import { IEducation } from '../models/education-model';

export interface CreateDataEducation {
  idCurriculum: string;
  institution: string;
  period: string;
  course: string;
}

export interface UpdateDataEducation{
  idEducation: string;
  institution: string;
  period: string;
  course: string;
}

export interface EducationRepository {
  create: (data: CreateDataEducation) => Promise<IEducation>;
  update: (data: UpdateDataEducation) => Promise<void>;
  get: (idCurriculum: string) => Promise<IEducation[] | []>;
  delete: (idEducation: string) => Promise<void>;
}
