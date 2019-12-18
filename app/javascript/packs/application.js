import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '../plugins/init_drag.js'
// import { dragInit } from '../plugins/init_drag';
// import "../plugins/init_drag.js";
import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import "../vendor/stimulus";
// import { endTouch } from '../plugins/init_drag.js';
// import { moveTouch } from '../plugins/init_drag.js';
// import { startTouch }from '../plugins/init_drag.js';
import { dragInit } from '../plugins/init_drag';
import { dragInit2 } from '../plugins/init_drag';

import { initAnimateCart } from "../components/cartanimation";

initAnimateCart();

initMapbox();
dragInit();
dragInit2();
// endTouch();
// moveTouch();
// startTouch();

