MongoStore = require '../store/MongoStore'

class AlarmController

  @postAlarm: (req, res) ->
#    console.log req.params.user
    alarmToSave = req.body
    console.log alarmToSave

    mongoStore = new MongoStore()
    mongoStore.createAlarm(alarmToSave, (err, id) ->
      res.status 200
      res.json {id: id}
    )

  @mongo: (req, res) ->
    alarm = [
      {
        user: 'Tom17'
        date: '2015-10-29T13:44:17'
        type: 'headache'
        longitude: '-74.00594130000002'
        latitude: '40.7127837'
      },
      {
        user: 'Eva55'
        date: '2015-10-29T13:55:10'
        type: 'overdose'
        longitude: '142.207031'
        latitude: '-36.315125'
      }
    ]

    res.status 200
    res.json alarm

  @getAlarms: (req, res) ->
    mongoStore = new MongoStore()
    mongoStore.getAlarms((err, alarms) ->
      if err
        res.status 400
        res.json err
      else
        res.status 200
        res.json alarms
    )

module.exports = AlarmController