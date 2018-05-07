var map, popup, Popup;
var geocoder;

/** Initializes the map and the custom popup. */
function initMap() {
  definePopupClass();

  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.7580348, lng: -73.991703},
    zoom: 17,
    keyboardShortcuts: false
  });

  geocoder = new google.maps.Geocoder();

  popup = new Popup(
      new google.maps.LatLng(40.758034, -73.991703),
      document.getElementById('content'));
  popup.setMap(map);
}

/** Defines the Popup class. */
function definePopupClass() {
  /**
   * A customized popup on the map.
   * @param {!google.maps.LatLng} position
   * @param {!Element} content
   * @constructor
   * @extends {google.maps.OverlayView}
   */
  Popup = function(position, content) {
    this.position = position;

    content.classList.add('popup-bubble-content');

    var pixelOffset = document.createElement('div');
    pixelOffset.classList.add('popup-bubble-anchor');
    pixelOffset.appendChild(content);

    this.anchor = document.createElement('div');
    this.anchor.classList.add('popup-tip-anchor');
    this.anchor.appendChild(pixelOffset);

    // Optionally stop clicks, etc., from bubbling up to the map.
    this.stopEventPropagation();
  };
  // NOTE: google.maps.OverlayView is only defined once the Maps API has
  // loaded. That is why Popup is defined inside initMap().
  Popup.prototype = Object.create(google.maps.OverlayView.prototype);

  /** Called when the popup is added to the map. */
  Popup.prototype.onAdd = function() {
    this.getPanes().floatPane.appendChild(this.anchor);
  };

  /** Called when the popup is removed from the map. */
  Popup.prototype.onRemove = function() {
    if (this.anchor.parentElement) {
      this.anchor.parentElement.removeChild(this.anchor);
    }
  };

  /** Called when the popup needs to draw itself. */
  Popup.prototype.draw = function() {
    var divPosition = this.getProjection().fromLatLngToDivPixel(this.position);
    // Hide the popup when it is far out of view.
    var display =
        Math.abs(divPosition.x) < 4000 && Math.abs(divPosition.y) < 4000 ?
        'block' :
        'none';

    if (display === 'block') {
      this.anchor.style.left = divPosition.x + 'px';
      this.anchor.style.top = divPosition.y + 'px';
    }
    if (this.anchor.style.display !== display) {
      this.anchor.style.display = display;
    }
  };

  /** Stops clicks/drags from bubbling up to the map. */
  Popup.prototype.stopEventPropagation = function() {
    var anchor = this.anchor;
    anchor.style.cursor = 'auto';

    ['click', 'dblclick', 'contextmenu', 'wheel', 'mousedown', 'touchstart',
     'pointerdown']
        .forEach(function(event) {
          anchor.addEventListener(event, function(e) {
            e.stopPropagation();
          });
        });
  };
}

// // circle for display
// circle = new google.maps.Circle({center:{lat: 40.7580348, lng: -73.991703},
//                                  radius: 200,
//                                  fillOpacity: 0.30,
//                                  fillColor: "#A9FFB5",
//                                  map: map});
// var bounds = new google.maps.LatLngBounds();
// var foundMarkers = 0;
// for (var i=0; i<gmarkers.length;i++) {
//   // if marker is in the circle, display it and add it to the sidebar
//   if (google.maps.geometry.spherical.computeDistanceBetween(gmarkers[i].getPosition(),searchCenter) < radius) {
//     bounds.extend(gmarkers[i].getPosition())
//     // display it
//     gmarkers[i].setMap(map);
//     // add a line to the side_bar html
//     side_bar_html += '<a href="javascript:myclick(' + i + ')">' + gmarkers[i].title + '<\/a><br>';
//     foundMarkers++;
//   } else {
//     // hide the marker, it is outside the circle
//     gmarkers[i].setMap(null);
//   }
// }
// // put the assembled side_bar_html contents into the side_bar div
// document.getElementById("side_bar").innerHTML = side_bar_html;
