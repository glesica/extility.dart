# Extility

A useful collection of static extension methods on basic Dart types.
See the `examples/` directory for some runnable example usages.

## Methods

Methods are organized below by the type that they extend on. Note
that the type headings below aren't necessarily valid syntax, they're
just for human consumption.

### Comparable<T extends Comparable<T>>

  * `genericClamp` - clamp any suitable `Comparable` value

### Iterable<E>

  * `bracket` - add values at the beginning and end of an iterable
  * `interleave` - insert values between elements of an iterable
  * `whereNotNull` - copy the iterable, removing `null`s
  * `zip` - zip two homogeneous lists into one list of lists
  * `zipTo` - zip two arbitrary lists into a list of arbitrary values
  * `zipToPairs` - zip two arbitrary lists into a list of `Pair`s

## Development

Dead simple if you're accustomed to Dart development. Get dependencies
(there are only dev dependencies, by design) with `pub get`. Run the
tests with `pub run test`.

Please be sure to document any methods you add. Also add them to the
readme (above) and to the `examples/` directory. Thanks!

### dart_dev

This repository uses [dart_dev][dart_dev] to simplify developer
tooling. This means that the following shortcuts are available. These
are also used in CI for consistency. You don't have to do things this
way, it's just a helpful option. You do you.

  * `pub run dart_dev analyze` - run the analyzer
  * `pub run dart_dev format` - run the formatter
  * `pub run dart_dev test` - run the tests

## Issues

Please file feature requests and bugs on [GitHub][issues].

[dart_dev]: https://pub.dev/packages/dart_dev
[issues]: https://github.com/glesica/extility.dart/issues
