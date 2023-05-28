import { ITechnologie } from "../models/technologie-model";

export interface CreateDataTechnologie {
  name: string;
  icon: string;
}

export interface TechnologieRepository {
  create: (data: CreateDataTechnologie) => Promise<ITechnologie>;
  getAll: () => Promise<ITechnologie[] | []>;
}