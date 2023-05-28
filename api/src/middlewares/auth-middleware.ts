import { Request, Response, NextFunction } from 'express';

import { UserRepository } from '../repositories/user-repository';
import { MongodbUserRepository } from '../repositories/mongodb/mongodb-user-repository';

const mongodbUserRepository = new MongodbUserRepository();

export async function AuthMiddleware(
  request: Request, 
  response: Response, 
  next: NextFunction
) {
  const userRepository: UserRepository = mongodbUserRepository;
  const accessToken = <string>request.headers['x-access-token'];

  if(!accessToken) {
    response.status(401).json({ auth: false, message: 'no token provided' });
    return;
  }

  const userResponse = await userRepository.getBySession(accessToken);

  if(!userResponse) {
    response.status(500).json({ auth: false, message: 'failed to authenticate token' });
    return;
  }

  request.body.idUser = userResponse._id;
  next();
}