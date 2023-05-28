import { Router } from 'express';

import { CurriculumController } from '../controllers/curriculum-controller';
import { 
  MongodbCurriculumRepository 
} from '../repositories/mongodb/mongodb-curriculum-repository';

const mongodbCurriculumRepository = new MongodbCurriculumRepository();
const curriculumController = new CurriculumController(mongodbCurriculumRepository);

export const curriculumRoutes = Router();

curriculumRoutes.post('/create', (req, res) => 
  curriculumController.createCurriculum(req, res)
);
curriculumRoutes.put('/update', (req, res) =>
  curriculumController.updateCurriculum(req, res)
);
curriculumRoutes.post('/get', (req, res) => 
  curriculumController.getCurriculum(req, res)
);
curriculumRoutes.post('/user', (req, res) => 
  curriculumController.getCurriculumUser(req, res)
);
curriculumRoutes.delete('/delete', (req, res) => 
  curriculumController.deleteCurriculum(req, res)
);
