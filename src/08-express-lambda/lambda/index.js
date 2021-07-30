exports.handler = async (_event, ctx) => {
	console.log('Hello world!')
	console.log('Hello world!')
	console.log('Hello world!')
	console.log('Hello world!')
	console.log('Hello world!')

	return {
		datetime: new Date().toUTCString(),
		message: 'Hello world via HTTPS!',
	}
}
