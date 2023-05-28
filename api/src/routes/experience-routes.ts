import { Router } from 'express';

import { ExperienceController } from '../controllers/experience-controller';
import { 
  MongodbExperienceRepository 
} from '../repositories/mongodb/mongodb-experience-repository';

const mongodbExperienceRepository = new MongodbExperienceRepository();
const experienceController = new ExperienceController(mongodbExperienceRepository);

export const experienceRoutes = Router();

experienceRoutes.post('/add', (req, res) => 
  experienceController.addExperience(req, res)
);
experienceRoutes.put('/update', (req, res) => 
  experienceController.updateExperience(req, res)
);  
experienceRoutes.post('/get', (req, res) => 
  experienceController.getExperiences(req, res)
);  
experienceRoutes.delete('/delete', (req, res) => 
  experienceController.deleteExperience(req, res)
);  