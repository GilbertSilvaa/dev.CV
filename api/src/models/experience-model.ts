import { Document, Schema, model } from 'mongoose';

export interface IExperience extends Document {
  idCurriculum: string;
  company: string;
  period: string;
  function: string;
}

const experienceSchema = new Schema({
  idCurriculum: {
    type: Schema.Types.ObjectId,
    ref: 'Curriculums',
    required: true
  },
  company: {
    type: String,
    required: true
  },
  period: {
    type: String,
    required: true
  },
  function: {
    type: String,
    required: true
  }
});

export const ExperienceModel = model<IExperience>('Experiences', experienceSchema);