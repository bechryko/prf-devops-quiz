import client from 'prom-client';
import { Logger } from 'utility';

export function configureMetrics(): void {
   Logger.info('Registering metrics for Prometheus');

   const register = new client.Registry();

   client.collectDefaultMetrics({ register });

   const httpRequestDuration = new client.Histogram({
      name: 'http_request_duration_seconds',
      help: 'Duration of HTTP requests in seconds',
      labelNames: ['method', 'path', 'status_code'],
      buckets: [0.01, 0.05, 0.1, 0.5, 1]
   });

   const httpRequestTotal = new client.Counter({
      name: 'http_requests_total',
      help: 'Total number of HTTP requests',
      labelNames: ['method', 'path', 'status_code']
   });

   const calculationErrors = new client.Counter({
      name: 'calculation_errors_total',
      help: 'Total number of calculation errors',
      labelNames: ['error_type']
   });

   const calculationTotal = new client.Counter({
      name: 'calculations_total',
      help: 'Total number of calculations performed'
   });

   register.registerMetric(httpRequestDuration);
   register.registerMetric(httpRequestTotal);
   register.registerMetric(calculationErrors);
   register.registerMetric(calculationTotal);

   Logger.success('Metrics for Prometheus registered!');
}
