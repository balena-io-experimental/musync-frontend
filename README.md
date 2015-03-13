Musync Frontend
---------------

This is the Musync Frontend application, used to control the song playlist and play state for the MuSync clients.

[See the Musync project for more information](https://github.com/resin-io/musync)

![MuSync Frontend Screenshot](https://raw.githubusercontent.com/jviotti/musync-frontend/master/screenshots/screenshot.png)

Preview
-------

Go to the [dist/](https://github.com/resin-io/musync-frontend/tree/master/dist) directory and start a web server:

```sh
$ cd dist/ && python -m SimpleHTTPServer
```

Then point your browser to [0.0.0.0:8000](http://0.0.0.0:8000).

If you want to change the firebase endpoint, you will need to recompile the application.

Follow the instructions at the [customisation section](https://github.com/resin-io/musync-frontend#customisation) and recompile with:

```sh
$ grunt build
```

Build & development
-------------------

Make sure you have `grunt-cli` installed globally:

```sh
$ npm install -g grunt-cli
```

In the repo directory, do an `npm install`:

```sh
$ npm install
```

Run `grunt` for building and `grunt serve` for preview.

Customisation
-------------

Head over to [app/scripts/app.coffee](https://github.com/jviotti/musync-frontend/blob/master/app/scripts/app.coffee) and change the `URL` constant to your [Firebase](https://www.firebase.com) instance.

Tests
-----

Running `grunt test` will run the unit tests with karma.

Contribute
----------

- Issue Tracker: [github.com/resin-io/musync-frontend/issues](https://github.com/resin-io/musync-frontend/issues)
- Source Code: [github.com/resin-io/musync-frontend](https://github.com/resin-io/musync-frontend)

Support
-------

If you're having any problem, please [raise an issue](https://github.com/resin-io/musync-frontend/issues/new) on GitHub.

License
-------

The project is licensed under the MIT license.
