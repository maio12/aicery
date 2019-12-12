import "bootstrap";
import { autocompleteSearch } from '../components/autocomplete.js'
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();

autocompleteSearch()
