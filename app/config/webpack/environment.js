const { environment } = require('@rails/webpacker')


const webpack = require('webpack')

// import { environment } from '@rails/webpacker'

// import { ProvidePlugin } from 'webpack'

environment.plugins.append('Provide', 
	new webpack.ProvidePlugin({
		$: 'jquery',
		jQuery: 'jquery',
		Popper: ['popper.js', 'default']
	}))

// export default environment

module.exports = environment
