import express from 'express';

import { userRoutes } from './routes/user-routes';
import { loginRoutes } from './routes/login-routes';
import { curriculumRoutes } from './routes/curriculum-routes';
import { AuthMiddleware } from './middlewares/auth-middleware';
import { technologieRoutes } from './routes/technologie-routes';
import { experienceRoutes } from './routes/experience-routes';
import { educationRoutes } from './routes/education-routes';

export const app = express();
app.use(express.json());

app.use('/', loginRoutes);
app.use('/user', userRoutes);
app.use('/technologie', technologieRoutes);
app.use('/curriculum', AuthMiddleware, curriculumRoutes);
app.use('/experience', AuthMiddleware, experienceRoutes);
app.use('/education', AuthMiddleware, educationRoutes);