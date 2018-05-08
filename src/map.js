var mymap = L.map('map').setView([40.758428, -73.992645], 17);
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
      maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'pk.eyJ1IjoicmVkZmlzaDA3IiwiYSI6ImNqZ3hzbDNrMDI5NjUzM3Axcm90N2o2NmcifQ.HjxYG61ovRMiydlM3AkfPQ'
}).addTo(mymap);

var marker = L.marker([40.758428, -73.992645], {autoPan: true, autoPanSpeed: 10}).addTo(mymap);

// FETCH POST TO DATABASE - COORDINATES
//     var popup = L.popup();
// let longitude = []
// let latitude = []
// let coordinates = []
// let test = {}
// let street = 14;
// let ave = 1;
// function onMapClick(e) {
//
//   let insert = {street: `${street}`, ave: `${ave}`, latitude: `${e.latlng.lat}`, longitude: `${e.latlng.lng}`}
//   console.log(insert)
//         if(ave === 9){
//           street ++
//           ave = 1
//         } else{
//           ave ++
//         }
//         fetch('http://localhost:3000/api/v1/locations', {
//           method: 'POST',
//           headers: {
//             'Content-Type': "application/json"
//           },
//           body: JSON.stringify(insert)
//         }).then(r => r.json()).then(console.log)
//         // console.log(test[`${street} st, ${ave} ave`])
// }
