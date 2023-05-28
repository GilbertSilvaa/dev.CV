import { Request, Response } from 'express';
import { z } from 'zod';

import { UserRepository } from '../repositories/user-repository';
import { TokenAdapter } from '../adapters/token-adapter';
import { EncryptAdapter } from '../adapters/encrypt-adapter';

export class LoginController {
  constructor(
    private userRepository: UserRepository,
    private tokenAdapter: TokenAdapter,
    private encryptAdapter: EncryptAdapter
  ){}

  async login(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        email: z.string().email(),
        password: z.string()
      });

      const data = bodySchema.parse(request.body);
      const userResponse = await this.userRepository.login(data);

      if(!userResponse) {
        response.status(400).json({ message: 'invalid email or password' });
        return;
      }

      const isPasswordCorrect = await this.encryptAdapter.verifyPassword({
        passwordSent: data.password,
        passwordCorrect: userResponse.password
      });

      if(!isPasswordCorrect) {
        response.status(400).json({ message: 'invalid password' });
        return;
      }

      const accessToken = this.tokenAdapter.createToken({
        id: userResponse._id,
        secret: process.env.JWT_KEY!,
        expiresTime: 9000000
      });

      await this.userRepository.createNewSession({
        idUser: userResponse._id,
        token: accessToken
      })

      userResponse.token = accessToken;
      response.status(200).json(userResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async logout(request: Request, response: Response) {
    try {
      await this.userRepository.logout(request.body.idUser);
      
      response.status(204).json({ message: 'user logged out successfully' });
    }
    catch(error) {
      response.status(400).json(error);
    }
  }
}