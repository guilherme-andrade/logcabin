import 'bootstrap'
import '../stylesheets/application'

import { initMapbox } from '../plugins/init_mapbox'

document.addEventListener('turbolinks:load', function() {
	initMapbox();
})
