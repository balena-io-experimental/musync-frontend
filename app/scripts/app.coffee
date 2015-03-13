'use strict'

###*
 # @ngdoc overview
 # @name MuSyncApp
 # @description
 # # MuSyncApp
 #
 # Main module of the application.
###
angular
  .module 'MuSyncApp', [
    'ngRoute'
    'ngTouch'
    'firebase'
  ]
  .constant('URL', "#{window.location.protocol}//#{window.location.host}/playlist")
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'

