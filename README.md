Musync Frontend
---------------

This is the Musync Frontend application, used to control the song playlist and play state for the MuSync clients.

[See the Musync project for more information](https://github.com/resin-io/musync)

![MuSync Frontend Screenshot](https://raw.githubusercontent.com/jviotti/musync-frontend/master/screenshots/screenshot.png)

Deploy to Firebase
------------------

In order to deploy the application to Firebase, change the application name in [firebase.json](https://github.com/resin-io/musync-frontend/blob/master/firebase.json) to your own application name (in the "firebase" key).

Install the [Firebase Command Line Tool](https://www.firebase.com/docs/hosting/command-line-tool.html) if you didn't already:

```sh
$ npm install -g firebase-tools
```

And deploy with the following command within the application directory:

```sh
$ firebase deploy
```

Make sure you build the application with `grunt build` before deploying if you made any customisation to the application source code.

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
