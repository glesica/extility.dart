/// Extensions on any [Iterable].
extension IterableExtensions<E> on Iterable<E> {
  /// Bracket the iterable by prepending and appending elements
  /// provided by the callback.
  ///
  /// For example:
  ///
  /// [1, 2].bracket(() => 0) // [0, 1, 2, 0]
  Iterable<E> bracket<T extends E>(T Function() callback) sync* {
    if (isEmpty) {
      return;
    }

    yield callback();
    for (final element in this) {
      yield element;
    }
    yield callback();
  }

  /// Interleave elements provided by a callback into those of the
  /// iterable.
  ///
  /// For example:
  ///
  /// [1, 2, 3].interleave(() => 0) // [1, 0, 2, 0, 3]
  Iterable<E> interleave<T extends E>(T Function() callback) sync* {
    if (isEmpty) {
      return;
    }

    for (final element in take(length - 1)) {
      yield element;
      yield callback();
    }
    yield last;
  }
}
