import { Request, Response } from 'express';
import { z } from 'zod';

import { ExperienceRepository } from '../repositories/experience-repository';

export class ExperienceController {
  constructor(private experienceRepository: ExperienceRepository){}

  async addExperience(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idCurriculum: z.string(),
        company: z.string(),
        period: z.string(),
        function: z.string()
      });

      const data = bodySchema.parse(request.body);
      const experienceResponse = await this.experienceRepository.create(data);

      response.status(201).json(experienceResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  } 

  async updateExperience(request: Request, response: Response){
    try {
      const bodySchema = z.object({
        idExperience: z.string(),
        company: z.string(),
        period: z.string(),
        function: z.string()
      });

      const data = bodySchema.parse(request.body);
      await this.experienceRepository.update(data);

      response.status(204).json();
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async getExperiences(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idCurriculum: z.string()
      });

      const { idCurriculum } = bodySchema.parse(request.body);
      const experiencesResponse = await this.experienceRepository.get(idCurriculum);

      response.status(200).json(experiencesResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async deleteExperience(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idExperience: z.string()
      });

      const { idExperience } = bodySchema.parse(request.body);
      await this.experienceRepository.delete(idExperience);

      response.status(204).json();
    }
    catch(error) {
      response.status(400).json(error);
    }
  }
}