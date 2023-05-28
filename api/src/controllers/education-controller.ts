import { Request, Response } from 'express';
import { z } from 'zod';

import { EducationRepository } from '../repositories/education-repository';

export class EducationController {
  constructor(private educationRepository: EducationRepository){}

  async addEducation(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idCurriculum: z.string(),
        institution: z.string(),
        period: z.string(),
        course: z.string()
      });

      const data = bodySchema.parse(request.body);
      const educationResponse = await this.educationRepository.create(data);

      response.status(201).json(educationResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async updateEducation(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idEducation: z.string(),
        institution: z.string(),
        period: z.string(),
        course: z.string()
      });

      const data = bodySchema.parse(request.body);
      await this.educationRepository.update(data);

      response.status(204).json();
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async getEducations(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idCurriculum: z.string()
      });

      const { idCurriculum } = bodySchema.parse(request.body);
      const educationsResponse = await this.educationRepository.get(idCurriculum);

      response.status(200).json(educationsResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async deleteEducation(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        idEducation: z.string()
      });

      const { idEducation } = bodySchema.parse(request.body);
      await this.educationRepository.delete(idEducation);

      response.status(204).json();
    }
    catch(error) {
      response.status(400).json(error);
    }
  }
}