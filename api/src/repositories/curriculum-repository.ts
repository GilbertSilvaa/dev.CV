import { ICurriculum } from '../models/curriculum-model';

export interface CreateDataCurriculum {
  idUser: string;
  name: string;
  job: string;
  pictureInBase64: string;
  location: string;
  company?: string;
  github?: string;
  email?: string;
  linkedin?: string;
  site?: string;
  technologies?: string[];
  projectsGithub?: [{ idRepository: number }];
}

export interface UpdateDataCurriculum extends CreateDataCurriculum {
  idCurriculum: string;
}

export interface CurriculumRepository {
  create: (data: CreateDataCurriculum) => Promise<ICurriculum>;
  update: (data: UpdateDataCurriculum) => Promise<void>;
  delete: (idCurriculum: string) => Promise<void>;
  getByIdCurriculum: (idCurriculum: string) => Promise<ICurriculum | null>;
  getByIdUser: (idUser: string) => Promise<ICurriculum | null>;
  getByName: (name: string) => Promise<ICurriculum[] | []>;
}