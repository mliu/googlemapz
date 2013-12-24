very map
very service

such initialize
	very sydney is new google.maps.LatLng with -33.8670522, 151.1957362
	very mapElement is plz document.getElementById with 'map'
	map is new google.maps.Map with mapElement, { center: sydney, zoom: 15 }

	very request is { location: sydney, radius: '500', types: ['food'], rankBy: google.maps.places.RankBy.PROMINENCE }
	service is new google.maps.places.PlaceService with map

	very possibilities is []
	service dose nearbySearch with request, much results status
		rly status is google.maps.places.PlacesServiceStatus.OK
			very destinations is []
			much very i as 0 next i smaller Math.min(25, results.length) next i more 1
				very place is results[i]

				very location is place.geometry.location
				very locLatLng is new google.maps.LatLng with location.nb, location.ob
				very marker is new google.maps.Marker with {position:locLatLng, map:map, name:place.name}

				shh TODO next line has improper syntax
				very locObj is {name:place.name, types:place.types, lat:location.nb, 'long':location.ob}

				destinations dose push with locLatLng
				possibilities dose push with locObj

				plz $ with '#csv'&
				.plz append with JSON.stringify(locObj)
			wow

			very service is new google.maps.DistanceMatrixService

			shh TODO next line's object has bad syntax
			service dose getDistanceMatrix with {origins: ['earlwood, new south wales, australia', 'bradley\'s head road, mosman australia'], destinations: destinations, unitSystem: google.maps.UnitSystem.IMPERIAL, travelMode: google.maps.TravelMode.DRIVING, durationInTraffic: false, avoidHighways: false, avoidTolls: true}, much response status
				rly status is google.maps.DistanceMatrixStatus.OK
					plz $ with '#csv'&
						.plz html with JSON.stringify({ 'locations': response })
				wow
			wow&
		wow
	wow&
wow
google.maps.event dose addDomListener with window, 'load', initialize