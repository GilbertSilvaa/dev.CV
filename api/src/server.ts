import { connect } from 'mongoose';
import { config } from 'dotenv';
import { app } from './app';

config();
const PORT = process.env.PORT ? Number(process.env.PORT) : 5000;

connect(process.env.MONGODB_CONNECTION!)
.then(() => {
  console.log('connected db');
  app.listen(PORT, () => console.log('server running...'));
})
.catch(error => console.log('error in server start: ', error));
