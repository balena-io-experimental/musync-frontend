'use strict'

###*
 # @ngdoc function
 # @name MuSyncApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the MuSyncApp
###
angular.module('MuSyncApp')
.controller 'MainCtrl', ($scope, $firebase, URL) ->

  playlist = $firebase(new Firebase(URL)).$asObject()
  playlist.$bindTo($scope, 'playlist')

  $scope.newSong = {}
  $scope.playlist = {}

  $scope.playSong = (index) ->
    $scope.playlist.current = index
    $scope.playlist.playStart = Date.now()

  $scope.addSong = ->
    $scope.playlist.songs.push($scope.newSong)
    $scope.newSong = {}

  $scope.previous = ->
    return if not $scope.hasPreviousSong()
    $scope.playSong($scope.playlist.current - 1)

  $scope.next = ->
    return if not $scope.hasNextSong()
    $scope.playSong($scope.playlist.current + 1)

  $scope.stop = ->
    $scope.playlist.current = null
    $scope.playlist.playStart = null

  $scope.play = ->
    $scope.playSong(0)

  $scope.remove = (index) ->
    $scope.playlist.songs.splice(index, 1)

  $scope.isPlaying = ->
    return $scope.playlist?.current?

  $scope.hasNextSong = ->
    return false if not $scope.playlist.songs?
    return false if not $scope.isPlaying()
    return $scope.playlist.current < $scope.playlist.songs.length - 1

  $scope.hasPreviousSong = ->
    return false if not $scope.playlist.songs?
    return $scope.playlist.current > 0
