module.exports = function (config) {
   if (process.env.PRFQ_JENKINS) {
      //process.env.CHROME_BIN = '/usr/bin/chromium';
   }

   config.set({
      basePath: '',
      frameworks: ['jasmine'],
      plugins: [require('karma-jasmine'), require('karma-chrome-launcher')],
      jasmineHtmlReporter: {
         suppressAll: true
      },
      reporters: ['progress'],
      browsers: ['ChromeHeadlessCI'],
      customLaunchers: {
         ChromeHeadlessCI: {
            base: 'ChromeHeadless',
            flags: [
               '--no-sandbox',
               '--disable-setuid-sandbox',
               '--disable-gpu',
               '--disable-dev-shm-usage',
               '--disable-extensions',
               '--disable-software-rasterizer',
               '--remote-debugging-port=9222'
            ]
         }
      }
   });
};
