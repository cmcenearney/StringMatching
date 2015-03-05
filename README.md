String matching
================

Exploring string matching algorithms in Haskell, beginning with [Shift-And](http://videlalvaro.github.io/2014/01/shift-and-visualization.html).

Building and testing
--------------------

Built with cabal. To get set up:

```
cabal install --dependencies-only
cabal configure
cabal build
```

now you can test with:

```
cabal test
```

or run individual test files (with pretty output):

```
runhaskell -isrc -itest test/StringMatching/ShiftAndSpec.hs
```