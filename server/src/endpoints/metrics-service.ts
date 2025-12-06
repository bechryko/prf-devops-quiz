import { Response } from 'express';
import { register } from 'prom-client';
import { Endpoint, Logger } from 'utility';

export class MetricsService {
   constructor() {
      Logger.info('LeaderboardService constructed');
   }

   @Endpoint({ method: 'get', path: '/metrics' })
   public getMetrics(_: Request, res: Response): void {
      res.setHeader('Content-Type', register.contentType);

      register
         .metrics()
         .then(metrics => {
            Logger.success('Metrics sent successfully');
            res.status(200).send(metrics);
         })
         .catch(error => {
            Logger.error(error);
            res.status(500).send('Error collecting metrics');
         });
   }
}
