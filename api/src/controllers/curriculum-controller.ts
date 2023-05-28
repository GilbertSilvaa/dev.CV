import { Request, Response } from 'express';
import { z } from 'zod';

import { 
  CurriculumRepository, 
  CreateDataCurriculum,
  UpdateDataCurriculum
} from '../repositories/curriculum-repository';

export class CurriculumController {
  constructor(private curriculumRepository: CurriculumRepository){}

  async createCurriculum(request: Request, response: Response) {
    try {
      // validar os campos com o zod 
      const data = <CreateDataCurriculum>request.body;
      const curriculumResponse = await this.curriculumRepository.create(data);

      response.status(201).json(curriculumResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async updateCurriculum(request: Request, response: Response) {
    try {
      // validar os campos com o zod 
      const data = <UpdateDataCurriculum>request.body;
      await this.curriculumRepository.update(data);

      const curriculumResponse = await this.curriculumRepository.getByIdCurriculum(
        data.idCurriculum
      );

      response.status(200).json(curriculumResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async getCurriculum(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idCurriculum: z.string().optional(),
        name: z.string().optional()
      });

      const { idCurriculum, name } = bodySchema.parse(request.body);

      if(idCurriculum) {
        const curriculumResponse = await this.curriculumRepository.getByIdCurriculum(
          idCurriculum
        );
        response.status(200).json(curriculumResponse);
        return;
      }

      if(name) {
        const curriculumsResponse = await this.curriculumRepository.getByName(name);
        response.status(200).json(curriculumsResponse);
        return;
      }

      const curriculumsResponse = await this.curriculumRepository.getByName('');
      response.status(200).json(curriculumsResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async getCurriculumUser(request: Request, response: Response) {
    try {
      const curriculumResponse = await this.curriculumRepository.getByIdUser(
        request.body.idUser
      );
      
      response.status(200).json(curriculumResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async deleteCurriculum(request: Request, response: Response) {
    try {
      await this.curriculumRepository.delete(request.body.idCurriculum);

      response.status(204).json();
    }
    catch(error) {
      response.status(400).json(error);
    }
  }
}