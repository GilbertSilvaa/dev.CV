import { IExperience } from '../models/experience-model';

export interface CreateDataExperience {
  idCurriculum: string;
  company: string;
  period: string;
  function: string;
}

export interface UpdateDataExperience{
  idExperience: string;
  company: string;
  period: string;
  function: string;
}

export interface ExperienceRepository {
  create: (data: CreateDataExperience) => Promise<IExperience>;
  update: (data: UpdateDataExperience) => Promise<void>;
  get: (idCurriculum: string) => Promise<IExperience[] | []>;
  delete: (idExperience: string) => Promise<void>;
}