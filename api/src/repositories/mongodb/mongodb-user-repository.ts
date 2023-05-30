import { UserModel } from '../../models/user-model';
import { MongodbCurriculumRepository } from './mongodb-curriculum-repository';
import { 
  UserRepository, 
  CreateDataUser, 
  LoginDataUser, 
  CreateNewSessionData 
} from '../user-repository';

export class MongodbUserRepository implements UserRepository {

  async create(params: CreateDataUser) {
    const userResponse = await UserModel.create(params);
    return userResponse;
  }
  
  async login({ email }: LoginDataUser) {
    const userResponse = await UserModel.findOne({ email });
    return userResponse;
  }

  async logout(idUser: string) {
    await UserModel.updateOne({ _id: idUser }, { token: null });
  }

  async createNewSession({ idUser, token }: CreateNewSessionData) {
    await UserModel.updateOne({ _id: idUser }, { token });
  }

  async getBySession(token: string) {
    const userResponse = await UserModel.findOne({ token });
    return userResponse;
  }
  
  async delete(idUser: string) {
    await UserModel.deleteOne({ _id: idUser });

    const mongodbCurriculumRepository = new MongodbCurriculumRepository();
    const curriculumUser = await mongodbCurriculumRepository.getByIdUser(idUser);

    if(curriculumUser)
      await mongodbCurriculumRepository.delete(curriculumUser._id); 
  }
}