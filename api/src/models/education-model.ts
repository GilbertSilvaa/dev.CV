import { Document, Schema, model } from 'mongoose';

export interface IEducation extends Document {
  idCurriculum: string;
  institution: string;
  period: string;
  course: string;
}

const educationSchema = new Schema({
  idCurriculum: {
    type: Schema.Types.ObjectId,
    ref: 'Curriculums',
    required: true
  },
  institution: {
    type: String,
    required: true
  },
  period: {
    type: String,
    required: true
  },
  course: {
    type: String,
    required: true
  }
});

export const EducationModel = model<IEducation>('Educations', educationSchema);