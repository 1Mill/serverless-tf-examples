const { v4: uuidv4 } = require('uuid')

exports.handler = async (event, ctx) => {
	const datetime = new Date().toUTCString()
	const uuid = uuidv4()

	console.log('------')
	console.log(datetime)
	console.log(process.env.NODE_ENV)
	console.log(uuid)
	console.log('------')
	console.log(event)
	console.log('------')
	console.log(ctx.awsRequestId)
	console.log(ctx.functionName)
	console.log(ctx.functionVersion)
	console.log(ctx.invokedFunctionArn)
	console.log('------')

	return { datetime }
}
