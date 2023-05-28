import { CurriculumModel } from '../../models/curriculum-model';
import { 
  CurriculumRepository, 
  CreateDataCurriculum,
  UpdateDataCurriculum
} from '../curriculum-repository';

export class MongodbCurriculumRepository implements CurriculumRepository {

  async create(params: CreateDataCurriculum) {
    const curriculumResponse = (await CurriculumModel.create(params))
    .populate('technologies');
    
    return curriculumResponse;
  }

  async update({ idCurriculum, ...params }: UpdateDataCurriculum) {
    await CurriculumModel.updateOne({ _id: idCurriculum }, { ...params });
  }

  async delete(idCurriculum: string) {
    await CurriculumModel.deleteOne({ _id: idCurriculum });
  }

  async getByIdCurriculum(idCurriculum: string) {
    const curriculumResponse = await CurriculumModel
    .findOne({ _id: idCurriculum })
    .populate('technologies');

    return curriculumResponse;
  }

  async getByIdUser(idUser: string) {
    const curriculumResponse = await CurriculumModel
    .findOne({ idUser })
    .populate('technologies');

    return curriculumResponse;
  }

  async getByName(name: string) {
    const curriculumsResponse = await CurriculumModel.find({
      name: {
        $regex: `.*${name}.*`
      }
    })
    .populate('technologies');

    return curriculumsResponse;
  }
}