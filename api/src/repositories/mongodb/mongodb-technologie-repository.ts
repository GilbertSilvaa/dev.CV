import { TechnologieModel } from '../../models/technologie-model';
import { CreateDataTechnologie, TechnologieRepository } from '../technologie-repository';

export class MongodbTechnologieRepository implements TechnologieRepository {

  async create(params: CreateDataTechnologie) {
    const technologieResponse = await TechnologieModel.create(params);
    return technologieResponse;
  }

  async getAll() {
    const technologiesResponse = await TechnologieModel.find();
    return technologiesResponse;
  }
}