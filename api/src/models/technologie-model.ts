import { Document, Schema, model } from 'mongoose';

export interface ITechnologie extends Document {
  name: string;
  icon: string;
}

const technologieSchema = new Schema({
  name: String,
  icon: String
});

export const TechnologieModel = model<ITechnologie>('Technologies', technologieSchema);