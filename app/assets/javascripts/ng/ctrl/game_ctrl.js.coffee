angular.module('cnb').controller 'GameCtrl', ['$scope', 'Game', ($scope, Game)->
  $scope.newGame = () ->
    $scope.game = new Game level: 5
    $scope.game.create()
]