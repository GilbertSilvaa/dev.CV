import { Router } from 'express';
import { LoginController } from '../controllers/login-controller';
import { MongodbUserRepository } from '../repositories/mongodb/mongodb-user-repository';
import { JwtTokenAdapter } from '../adapters/jwt/jwt-token-adapter';
import { BcryptEncryptAdapter } from '../adapters/bcrypt/bcrypt-encrypt-adapter';
import { AuthMiddleware } from '../middlewares/auth-middleware';

const mongodbUserRepository = new MongodbUserRepository();
const bcryptEncryptAdapter = new BcryptEncryptAdapter();
const jwtTokenAdapter = new JwtTokenAdapter();

const loginController = new LoginController(
  mongodbUserRepository, 
  jwtTokenAdapter, 
  bcryptEncryptAdapter
);

export const loginRoutes = Router();

loginRoutes.post('/login', (req, res) => 
  loginController.login(req, res)
);
loginRoutes.post('/logout', AuthMiddleware, (req, res) =>  
  loginController.logout(req, res)
);