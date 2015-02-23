'use strict'

describe 'Controller: MainCtrl', ->

  beforeEach module 'MuSyncApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  describe '.playSong()', ->

    beforeEach ->
      scope.playlist =
        current: 1
        playStart: Date.now() - 100000

    it 'should set playlist.current to the index', ->
      expect(scope.playlist.current).toEqual(1)
      scope.playSong(3)
      expect(scope.playlist.current).toEqual(3)

    it 'should set playlist.playStart to the current time', ->
      expect(scope.playlist.playStart).not.toBeCloseTo(Date.now(), 5)
      scope.playSong(3)
      expect(scope.playlist.playStart).toBeCloseTo(Date.now(), 5)

  describe '.stop()', ->

    beforeEach ->
      scope.playlist =
        current: 1
        playStart: Date.now()

    it 'should set playlist.current to null', ->
      expect(scope.playlist.current).not.toBeNull()
      scope.stop()
      expect(scope.playlist.current).toBeNull()

    it 'should set playlist.playStart to null', ->
      expect(scope.playlist.playStart).not.toBeNull()
      scope.stop()
      expect(scope.playlist.playStart).toBeNull()

  describe '.isPlaying()', ->

    it 'should return true if playlist.current is defined', ->
      scope.playlist.current = 1
      expect(scope.isPlaying()).toBe(true)

    it 'should return false if playlist.current is not defined', ->
      scope.playlist.current = null
      expect(scope.isPlaying()).toBe(false)

  describe '.play()', ->

    it 'should set playlist.current to zero', ->
      scope.play()
      expect(scope.playlist.current).toEqual(0)

    it 'should set playlist.playStart to the current time', ->
      scope.play()
      expect(scope.playlist.playStart).toBeCloseTo(Date.now(), 5)

  describe '.hasNextSong()', ->

    it 'should return false if no songs array', ->
      scope.playlist.songs = null
      expect(scope.hasNextSong()).toBe(false)

    it 'should return false if no current', ->
      scope.playlist.current = null
      expect(scope.hasNextSong()).toBe(false)

    it 'should return false if no songs', ->
      scope.playlist.songs = []
      scope.playlist.current = 0
      expect(scope.hasNextSong()).toBe(false)

    it 'should return true if there is a next song', ->
      scope.playlist =
        current: 0
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]
      expect(scope.hasNextSong()).toBe(true)

    it 'should return true if there is not a next song', ->
      scope.playlist =
        current: 1
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]
      expect(scope.hasNextSong()).toBe(false)

  describe '.hasPreviousSong()', ->

    it 'should return false if no songs array', ->
      scope.playlist.songs = null
      expect(scope.hasPreviousSong()).toBe(false)

    it 'should return false if no current', ->
      scope.playlist.current = null
      expect(scope.hasPreviousSong()).toBe(false)

    it 'should return false if no songs', ->
      scope.playlist.songs = []
      scope.playlist.current = 0
      expect(scope.hasPreviousSong()).toBe(false)

    it 'should return true if there is a previous song', ->
      scope.playlist =
        current: 1
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]
      expect(scope.hasPreviousSong()).toBe(true)

    it 'should return true if there is not a previous song', ->
      scope.playlist =
        current: 0
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]
      expect(scope.hasPreviousSong()).toBe(false)

  describe '.addSong()', ->

    it 'should add a song at the end of the list', ->
      scope.playlist.songs = [
        { artist: 'Taylor Swift', title: 'Blank Space' }
      ]

      scope.newSong = { artist: 'Taylor Swift', title: 'Shake It Off' }

      scope.addSong()

      expect(scope.playlist.songs).toEqual [
        { artist: 'Taylor Swift', title: 'Blank Space' }
        { artist: 'Taylor Swift', title: 'Shake It Off' }
      ]

    it 'should erase newSong', ->
      scope.newSong = { artist: 'Taylor Swift', title: 'Shake It Off' }
      scope.addSong()
      expect(scope.newSong).toEqual({})

  describe '.remove()', ->

    it 'should remove the song from the playlist', ->
      scope.playlist =
        current: 0
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]

      scope.remove(1)

      expect(scope.playlist.songs).toEqual [
        { artist: 'Taylor Swift', title: 'Shake It Off' }
      ]

    it 'should replay the current song', ->
      scope.playlist =
        current: 0
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]

      scope.remove(1)

      expect(scope.playlist.current).toEqual(0)
      expect(scope.playlist.playStart).toBeCloseTo(Date.now(), 5)

    it 'should not restart playStart if no current', ->
      scope.playlist =
        songs: [
          { artist: 'Taylor Swift', title: 'Shake It Off' }
          { artist: 'Taylor Swift', title: 'Blank Space' }
        ]

      scope.remove(1)

      expect(scope.playlist.current).toBeUndefined()
      expect(scope.playlist.playStart).toBeUndefined()

  describe '.previous()', ->

    describe 'if has a previous song', ->

      beforeEach ->
        scope.playlist =
          current: 1
          songs: [
            { artist: 'Taylor Swift', title: 'Shake It Off' }
            { artist: 'Taylor Swift', title: 'Blank Space' }
          ]

      it 'should play the previous song', ->
        scope.previous()
        expect(scope.playlist.current).toEqual(0)
        expect(scope.playlist.playStart).toBeCloseTo(Date.now(), 5)

    describe 'if no previous song', ->

      beforeEach ->
        scope.playlist =
          current: 0
          songs: [
            { artist: 'Taylor Swift', title: 'Shake It Off' }
            { artist: 'Taylor Swift', title: 'Blank Space' }
          ]

      it 'should do nothing', ->
        scope.previous()
        expect(scope.playlist.current).toEqual(0)
        expect(scope.playlist.playStart).toBeUndefined()

  describe '.next()', ->

    describe 'if has a next song', ->

      beforeEach ->
        scope.playlist =
          current: 0
          songs: [
            { artist: 'Taylor Swift', title: 'Shake It Off' }
            { artist: 'Taylor Swift', title: 'Blank Space' }
          ]

      it 'should play the next song', ->
        scope.next()
        expect(scope.playlist.current).toEqual(1)
        expect(scope.playlist.playStart).toBeCloseTo(Date.now(), 5)

    describe 'if no next song', ->

      beforeEach ->
        scope.playlist =
          current: 1
          songs: [
            { artist: 'Taylor Swift', title: 'Shake It Off' }
            { artist: 'Taylor Swift', title: 'Blank Space' }
          ]

      it 'should do nothing', ->
        scope.next()
        expect(scope.playlist.current).toEqual(1)
        expect(scope.playlist.playStart).toBeUndefined()
