import { Router } from 'express';

import { UserController } from '../controllers/user-controller';
import { MongodbUserRepository } from '../repositories/mongodb/mongodb-user-repository';
import { BcryptEncryptAdapter } from '../adapters/bcrypt/bcrypt-encrypt-adapter';
import { JwtTokenAdapter } from '../adapters/jwt/jwt-token-adapter';

const mongodbUserRepository = new MongodbUserRepository();
const bcryptEncryptAdapter = new BcryptEncryptAdapter();
const jwtTokenAdapter = new JwtTokenAdapter();

const userController = new UserController(
  mongodbUserRepository, 
  bcryptEncryptAdapter, 
  jwtTokenAdapter
);

export const userRoutes = Router();

userRoutes.post('/create', (req, res) => 
  userController.createUser(req, res)
);
userRoutes.delete('/delete', (req, res) => 
  userController.deleteUser(req, res)
);
