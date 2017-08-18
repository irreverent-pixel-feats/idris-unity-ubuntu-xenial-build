# idris-cil-ubuntu-xenial-build [![Build Status](https://img.shields.io/travis/irreverent-pixel-feats/idris-cil-ubuntu-xenial-build.svg?style=flat)](https://travis-ci.org/irreverent-pixel-feats/idris-cil-ubuntu-xenial-build)

Latest version of Unity Ubuntu builds can be found on this [forum](https://forum.unity3d.com/threads/unity-on-linux-release-notes-and-known-issues.350256/) (Yeah, instead of a download page its a forum thread, its a bit weird...)

SHAs for tracking the build environment used to build your binaries can be found in
`/var/version`.

Built images are available on [DockerHub](https://hub.docker.com/r/irreverentpixelfeats/idris-cil-build/)

Includes:

- [`bamboo/idris-cil`](https://github.com/bamboo/idris-cil), commit SHA [`00e977f`](https://github.com/bamboo/idris-cil/commit/00e977f7619041c6fa4b927d3ca0fd0ab397d9af)
- `mono-devel 5.2.0.215-0xamarin10+ubuntu1604b1`

Along for the ride:

- `idris 1.0`
- `ghc v8.0.2`
- `cabal 1.24.0.2`
- [`ambiata/mafia`](https://github.com/ambiata/mafia)
