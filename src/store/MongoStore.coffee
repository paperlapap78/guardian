#MongoClient = require('mongodb').MongoClient

class MongoStore



  createAlarm: (alarm, callback) ->
    callback null, 77


  getAlarms: (callback) ->
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

    callback null, alarm



#  createAlarm: (alarm, callback) ->
#    MongoClient.connect url, (err, db) ->
#      alarmsCollection = db.collection('alarms')
#
#      alarmsCollection.insertOne(alarm, (err, result) ->
#        db.close()
#        if err then callback err
#        else callback null, result
#      )

#  getAlarms: (callback) ->
#    MongoClient.connect url, (err, db) ->
#      alarmsCollection = db.collection('alarms')
#
#      alarmsCollection.find({}).toArray((err, alarms) ->
#        db.close()
#        if err then callback err
#        else callback null, alarms)


module.exports = MongoStore