import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initStarRating } from '../plugins/init_star_rating';
import { initMapbox } from '../plugins/init_mapbox';
import { initFakeNotify } from '../plugins/init_fake_notification';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initMapbox();
initStarRating();
initFakeNotify();


import 'jquery'

var img = $('#directions-map')
img.hide();
$('#unfurl-map').click(function(){
  img.show();
})
