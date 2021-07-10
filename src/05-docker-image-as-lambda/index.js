exports.handler = async (event, ctx) => {
	console.log('Hello world!')
	console.log(event)
	return new Date().toUTCString()
}
