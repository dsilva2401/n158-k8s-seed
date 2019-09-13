import { ProcessHandler } from 'n158/classes';
import path from 'path';
import demoHTTPPipelineHandler from './http-pipeline-handlers/demo';

// Setup env variables
const httpPort = process.env.PORT ? parseInt(process.env.PORT) : 3000

// Init process handler
var processHandler = new ProcessHandler({
  httpServers: [{
    name: 'server',
    ports: { http: httpPort },
    routers: [
      // Setup api
      {
        name: 'api',
        path: '/api',
        routes: [{
          method: 'GET',
          path: '/demo',
          pipeline: [{
            handler: demoHTTPPipelineHandler
          }]
        }]
      },
      // Setup webapps
      {
        name: 'webapps',
        path: '/',
        routes: [{
          method: 'GET',
          path: '/',
          pipeline: [{
            staticsPath: path.join(__dirname, './webapps/home')
          }]
        }]
      }
    ]
  }]
});

processHandler.startHTTPServers().then((results) => {
  results.forEach((r) => {
      Object.keys(r.ports).forEach((protName) => {
        console.log(protName.toUpperCase()+' Server '+r.serverName+' is running at '+protName+'://localhost:'+r.ports[protName]);
      });
  });
});
