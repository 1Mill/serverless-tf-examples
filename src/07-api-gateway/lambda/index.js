exports.handler = async (event, ctx) => {
	const datetime = new Date().toUTCString()

	console.log('------')
	console.log(datetime)
	console.log(process.env.NODE_ENV)
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
