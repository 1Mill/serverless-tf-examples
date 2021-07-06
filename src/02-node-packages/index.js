const { fromTheDepths } = require('./utils/from-the-depths')
const { v4: uuidv4 } = require('uuid')

exports.handler = (_event, _ctx) => {
	console.log(`Hello world! - ${uuidv4()}`)
	fromTheDepths()
}
