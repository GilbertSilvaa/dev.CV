import { Request, Response } from 'express';
import { z } from 'zod';

import { UserRepository } from '../repositories/user-repository';
import { EncryptAdapter } from '../adapters/encrypt-adapter';
import { TokenAdapter } from '../adapters/token-adapter';

export class UserController {
  constructor(
    private userRepository: UserRepository,
    private encryptAdapter: EncryptAdapter,
    private tokenAdapter: TokenAdapter
  ){}

  async createUser(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        name: z.string(),
        email: z.string().email(),
        password: z.string()
      });

      const { password, email, name } = bodySchema.parse(request.body);
      const isUserExisting = await this.userRepository.login({ email, password });

      if(isUserExisting) {
        response.status(400).json({ message: 'email já registrado' });
        return;
      }

      const passwordEncrypted = await this.encryptAdapter.encrypt({ password });
      const userResponse = await this.userRepository.create({
        name,
        email,
        password: passwordEncrypted
      });

      const accessToken = this.tokenAdapter.createToken({
        id: userResponse._id,
        secret: process.env.JWT_KEY!,
        expiresTime: 9000000
      });
    
      await this.userRepository.createNewSession({
        idUser: userResponse._id,
        token: accessToken
      });

      userResponse.token = accessToken;
      response.status(201).json(userResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async deleteUser(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idUser: z.string()
      });

      const data = bodySchema.parse(request.body);
      await this.userRepository.delete(data.idUser);

      response.status(204).json();
    }
    catch(error) {
      response.status(400).json(error);
    }
  }
}