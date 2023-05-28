import { Router } from 'express';

import { EducationController } from '../controllers/education-controller';
import { 
  MongodbEducationRepository 
} from '../repositories/mongodb/mongodb-education-repository';

const mongodbEducationRepository = new MongodbEducationRepository()
const educationController = new EducationController(mongodbEducationRepository);

export const educationRoutes = Router();

educationRoutes.post('/add', (req, res) => 
  educationController.addEducation(req, res)
);
educationRoutes.put('/update', (req, res) => 
  educationController.updateEducation(req, res)
);  
educationRoutes.post('/get', (req, res) =>
  educationController.getEducations(req, res)
);
educationRoutes.delete('/delete',(req, res) => 
  educationController.deleteEducation(req, res)
);