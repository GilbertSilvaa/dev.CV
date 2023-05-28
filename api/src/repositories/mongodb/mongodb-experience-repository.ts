import { ExperienceModel } from '../../models/experience-model';
import { 
  ExperienceRepository, 
  CreateDataExperience, 
  UpdateDataExperience 
} from '../experience-repository';

export class MongodbExperienceRepository implements ExperienceRepository {

  async create(params: CreateDataExperience) {
    const experienceResponse = await ExperienceModel.create(params);
    return experienceResponse;
  }

  async update({ idExperience, ...params }: UpdateDataExperience) {
    await ExperienceModel.updateOne({ _id: idExperience }, { ...params });
  }

  async get(idCurriculum: string) {
    const experiencesResponse = await ExperienceModel.find({ idCurriculum });
    return experiencesResponse;
  }

  async delete(idExperience: string) {
    await ExperienceModel.deleteOne({ _id: idExperience });
  }
}