import { connect } from 'mongoose';
import { config } from 'dotenv';
import { app } from './app';

config();
connect(process.env.MONGODB_CONNECTION!)
.then(() => {
  console.log('connected db');
  app.listen(5000, () => console.log('server running...'));
})
.catch(error => console.log('error in server start: ', error));
