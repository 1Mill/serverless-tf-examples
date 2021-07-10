const { v4: uuidv4 } = require('uuid')

exports.handler = async (event, ctx) => {
	console.log('---')
	console.log(`UUID :: ${uuidv4()}`)
	console.log('---')
	console.log(event)
	console.log('---')
	return new Date().toUTCString()
}
