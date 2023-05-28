import { Router } from 'express';

import { TechnologieController } from '../controllers/technologie-controller';
import { 
  MongodbTechnologieRepository 
} from '../repositories/mongodb/mongodb-technologie-repository';

const mongodbTechnologieRepository = new MongodbTechnologieRepository();
const technologieController = new TechnologieController(mongodbTechnologieRepository);

export const technologieRoutes = Router();

technologieRoutes.post('/create', (req, res) => 
  technologieController.createTechnologie(req, res)
);
technologieRoutes.get('/get', (req, res) => 
  technologieController.getTechnologies(req, res)
);