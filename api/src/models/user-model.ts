import { Document, Schema, model } from 'mongoose';

export interface IUser extends Document {
  name: string;
  email: string;
  password: string;
  token: string;
}

const userSchema = new Schema({
  name: {
    type: String,
    required: true
  },
  email: { 
    type: String,
    required: true
  },
  password: {
    type: String,
    required: true
  },
  token: {
    type: String,
    default: null
  }
});

export const UserModel = model<IUser>('Users', userSchema);