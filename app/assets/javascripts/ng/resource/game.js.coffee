angular.module('cnb').factory 'Game', ['railsResourceFactory', ($resource) ->
  $resource
    url: '/games'
    name: 'game'
]