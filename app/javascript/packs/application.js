import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import "../vendor/stimulus"
initMapbox();

import { initAnimateCart } from "../components/cartanimation";

initAnimateCart();


