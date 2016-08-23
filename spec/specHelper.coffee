process.env['ENV'] = process.env.ENV || 'test' # Force use of 'test' config, unless it is explicitly overridden (e.g. on ci ENV will be explicitly set to 'ci')

sinon = require('sinon')
chai = require("chai")
sinonChai = require("sinon-chai")

global.expect = chai.expect
global.sinon = sinon
chai.use(sinonChai)

global.lib_dir = "#{__dirname}/../lib"
