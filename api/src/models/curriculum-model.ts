import { Document, Schema, model } from 'mongoose';

export interface ICurriculum extends Document {
  idUser: string;
  name: string;
  job: string;
  pictureInBase64: string;
  location: string;
  company: string;
  github: string;
  email: string;
  linkedin: string;
  site: string;
  technologies: string[];
  projectsGithub: [{ idRepository: number }];
}

const curriculumSchema = new Schema({
  idUser: {
    type: Schema.Types.ObjectId,
    ref: 'Users',
    required: true
  },
  name: {
    type: String,
    required: true
  },
  job: {
    type: String,
    required: true
  },
  pictureInBase64: {
    type: String,
    required: true
  },
  location: {
    type: String,
    required: true
  },
  company: String,
  github: String,
  email: String,
  linkedin: String,
  site: String,
  projectsGithub: [{ idRepository: Number }],
  technologies: [{ type: Schema.Types.ObjectId, ref: 'Technologies' }]
});

export const CurriculumModel = model<ICurriculum>('Curriculums', curriculumSchema);