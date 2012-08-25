# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#fotografias_fields').nestedFields()
  $('#FotosCarousel').carousel()
  eventos_gmaps() if $('#evento_localizacion_attributes_latitude').length

eventos_gmaps= () ->
  @markersArray = []
  Gmaps.map.callback = () -> 
    google.maps.event.addListener Gmaps.map.serviceObject, 'click', (event) -> 
      clearOverlaysEventos()
      placeMarkerEventos(event.latLng)
      updateFormLocationEventos(event.latLng)
    
# Update form attributes with given coordinates
updateFormLocationEventos = (latLng) ->
  $('#evento_localizacion_attributes_latitude').val(latLng.lat())
  $('#evento_localizacion_attributes_longitude').val(latLng.lng())


# Add a marker with an open infowindow
placeMarkerEventos = (latLng) ->
  marker = new google.maps.Marker
    position: latLng, 
    map: Gmaps.map.serviceObject,
    draggable: true

  @markersArray.push(marker)
  # Set and open infowindow
  infowindow = new google.maps.InfoWindow 
    content: '<div class="popup"><h2>Evento creado!</h2><p>Mueve el punto a la posición donde estará ubicado.</p>'
  infowindow.open(Gmaps.map.serviceObject,marker)
   #Listen to drag & drop
  google.maps.event.addListener marker, 'dragend', () -> 
    updateFormLocationEventos(this.getPosition())

# Removes the overlays from the map
clearOverlaysEventos = () ->
  if (@markersArray) 
    for i in @markersArray
      i.setMap(null)
  @markersArray.length = 0;

