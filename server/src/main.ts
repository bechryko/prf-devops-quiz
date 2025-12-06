import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import cors from 'cors';
import express from 'express';
import expressSession from 'express-session';
import mongoose from 'mongoose';
import passport from 'passport';
import { configureEndpoints } from './endpoints';
import { provideMockData } from './mock-data';
import { configurePassport } from './passport/passport';
import { Logger } from './utility';

Logger.success('Application started running');

const app = express();
const port = 5000;
const dbUrl = process.env['MONGO_URL'] || 'mongodb://mongo:27017';

Logger.info(`Try to connect to ${dbUrl}`);

mongoose
   .connect(dbUrl)
   .then(result => {
      Logger.success('MongoDB state:', result.ConnectionStates[result.connection.readyState]);
      provideMockData();
   })
   .catch(error => Logger.error(error));

const whitelist = ['*', 'http://localhost:4200'];
const corsOptions = {
   origin: (origin: string | undefined, callback: (err: Error | null, allowed?: boolean) => void) => {
      Logger.info('Request from', origin);
      if (whitelist.indexOf(origin!) !== -1 || whitelist.includes('*')) {
         Logger.success('Allowed by CORS');
         callback(null, true);
      } else {
         const message = 'Not allowed by CORS';
         Logger.error(message);
         callback(new Error(message));
      }
   },
   credentials: true
};
app.use(cors(corsOptions));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(cookieParser());

const sessionOptions: expressSession.SessionOptions = {
   secret: 'testsecret',
   resave: false,
   saveUninitialized: false
};
app.use(expressSession(sessionOptions));

app.use(passport.initialize());
app.use(passport.session());

configurePassport(passport);

app.use('/api', configureEndpoints(passport, express.Router()));

app.listen(port, '0.0.0.0', () => {
   Logger.success('Server is listening on port', port.toString());
});
