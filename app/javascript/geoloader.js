
document.addEventListener('DOMContentLoaded', (event) => {

  var geo = document.getElementById('geo');
  var watchId;
  url = new URL(window.location.href);


    function appendLocation(location, verb) {
    verb = verb || 'updated';
    const lat = location.coords.latitude
    const lng = location.coords.longitude
    console.log(lat);
    console.log(lng);
    url = window.location.href + "?lat=" + lat + "&lng=" + lng ;
    window.location = url;
  }






  if ((geo) && !(url.searchParams.get('lat'))) {

  if ('geolocation' in navigator) {
      navigator.geolocation.getCurrentPosition(function (location) {
      appendLocation(location, 'fetched');});
      watchId = navigator.geolocation.watchPosition(appendLocation);

    } else {
      target.innerText = 'Geolocation API not supported.';
    }
}

});
