import { IUser } from '../models/user-model';

export interface CreateDataUser {
  name: string;
  email: string;
  password: string;
}
export interface LoginDataUser {
  email: string;
  password: string;
}
export interface CreateNewSessionData {
  idUser: string;
  token: string;
}

export interface UserRepository {
  create: (data: CreateDataUser) => Promise<IUser>;
  delete: (idUser: string) => Promise<void>;
  login: (data: LoginDataUser) => Promise<IUser | null>;
  logout: (idUser: string) => Promise<void>;
  createNewSession: (data: CreateNewSessionData) => Promise<void>;
  getBySession: (token: string) => Promise<IUser | null>;
}