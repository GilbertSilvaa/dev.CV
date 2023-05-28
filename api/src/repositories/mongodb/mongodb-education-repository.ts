import { EducationModel } from '../../models/education-model';
import { 
  EducationRepository, 
  CreateDataEducation, 
  UpdateDataEducation 
} from '../education-repository';

export class MongodbEducationRepository implements EducationRepository {

  async create(params: CreateDataEducation) {
    const educationResponse = await EducationModel.create(params);
    return educationResponse;
  }

  async update({ idEducation, ...params }: UpdateDataEducation) {
    await EducationModel.updateOne({ _id: idEducation }, { ...params });
  }

  async get(idCurriculum: string) {
    const educationsResponse = await EducationModel.find({ idCurriculum });
    return educationsResponse;
  }

  async delete(idEducation: string) {
    await EducationModel.deleteOne({ _id: idEducation });
  }
}