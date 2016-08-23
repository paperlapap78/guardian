express = require 'express'
bodyParser = require 'body-parser'
cookieParser = require 'cookie-parser'
AlarmController = require './controllers/AlarmController'

app = module.exports = express()

app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
app.use cookieParser()


app.get('/', (req, res) ->
  res.send 'Hello World!'
)

app.post '/alarm', AlarmController.postAlarm

app.get '/alarms', AlarmController.getAlarms

app.get '/mongo', AlarmController.mongo





