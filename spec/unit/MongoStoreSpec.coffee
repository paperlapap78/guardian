require '../specHelper'

MongoStore = require "#{lib_dir}/store/MongoStore"

describe 'MongoStore', ->

  it 'stores alarms and returns an ID', (done) ->
    mongoStore = new MongoStore()
    id = mongoStore.createAlarm(
      {
        user: 'eva',
        type: 'type'
      }
    )
    expect(id).to.be.eq('77')
