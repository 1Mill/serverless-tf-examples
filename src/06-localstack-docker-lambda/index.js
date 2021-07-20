const { v4: uuidv4 } = require('uuid')

exports.handler = async (event, ctx) => {
	const datetime = new Date().toUTCString()
	const uuid = uuidv4()

	console.log('------')
	console.log({ datetime, uuid })
	console.log('------')
	console.log({ event, ctx })
	console.log('------')

	return { datetime }
}
