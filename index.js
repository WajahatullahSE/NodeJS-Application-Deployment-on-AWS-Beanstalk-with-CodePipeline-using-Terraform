var express = require('express')
var app = express()

app.set('port', (process.env.PORT || 8081))
app.use(express.static(__dirname + '/public'))

app.get('/', function(request, response) {
  response.send(`
    <h1>Node.js Sample Application, Version 12</h1>
    <p>Deployed on Elastic Beanstalk with CodePipeline, Pipeline Complete</p>
    <p>Welcome to Application!</p>
    <hr>
    <h3>Environment Variables:</h3>
    <p><strong>NODE_ENV:</strong> ${process.env.NODE_ENV || 'Not set'}</p>
    <p><strong>CUSTOM_VAR:</strong> ${process.env.CUSTOM_VAR || 'Not set'}</p>
    <p><strong>PORT:</strong> ${process.env.PORT || '8081'}</p>
  `);
});


app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'))
})
