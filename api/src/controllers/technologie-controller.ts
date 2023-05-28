import { Request, Response } from 'express';
import { z } from 'zod';

import { TechnologieRepository } from '../repositories/technologie-repository';

export class TechnologieController {
  constructor(private technologieRepository: TechnologieRepository){}

  async createTechnologie(request: Request, response: Response) {
    try {
      const bodySchema = z.object({
        name: z.string(),
        icon: z.string()
      });
  
      const data = bodySchema.parse(request.body);
      const technologieResponse = await this.technologieRepository.create(data);
  
      response.status(201).json(technologieResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }

  async getTechnologies(request: Request, response: Response) {
    try {
      const technologiesResponse = await this.technologieRepository.getAll();

      response.status(200).json(technologiesResponse);
    }
    catch(error) {
      response.status(400).json(error);
    }
  }
}