import 'package:extility/src/pair.dart';

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

  /// Return an iterable with any `null` elements removed.
  ///
  /// For example:
  ///
  /// [1, null, 2].whereNotNull() // [1, 2]
  /// [1, 2].whereNotNull() // [1, 2]
  /// [].whereNotNull() // []
  Iterable<E> whereNotNull() sync* {
    for (final element in this) {
      if (element == null) {
        continue;
      }
      yield element;
    }
  }

  /// Zip the elements of the iterable together with those of the
  /// given iterable to form an iterable of lists (of length two)
  /// of elements at the same indices as those of the inputs.
  ///
  /// For example:
  ///
  /// [1, 2].zip([5, 6]) // [[1, 5], [2, 6]]
  Iterable<List<E>> zip(Iterable<E> iterable) =>
      zipTo(iterable, (left, right) => [left, right]);

  /// Zip the elements of the iterable together with those of the
  /// given iterable using the provided callback to combine each pair
  /// of elements.
  ///
  /// If one iterable is shorter than the other, the extra elements
  /// will be combined with `null`. Therefore, the callback
  /// must be able to handle `null` for either of its parameters,
  /// though not both.
  ///
  /// For example:
  ///
  /// ['Kate', 'Pablo'].zipToContainer(
  ///   [28, 31],
  ///   (name, age) => {name: age},
  /// ); // [{'Kate': 28}, {'Pablo': 31}]
  Iterable<C> zipTo<T, C>(
    Iterable<T> iterable,
    C Function(E, T) combine,
  ) sync* {
    final left = iterator;
    final right = iterable.iterator;

    while (true) {
      final leftAlive = left.moveNext();
      final rightAlive = right.moveNext();
      if (!leftAlive && !rightAlive) {
        break;
      }

      yield combine(left.current, right.current);
    }
  }

  /// Zip the elements of the iterable together with those of the
  /// given iterable using a convenience wrapper, [Pair], to combine
  /// them.
  ///
  /// For example:
  ///
  /// [1, 2].zipToPairs([5, 6]) // [Pair(1, 5), Pair(2, 6)]
  Iterable<Pair<E, T>> zipToPairs<T>(Iterable<T> iterable) =>
      zipTo(iterable, _PairImpl.factory);
}

class _PairImpl<L, R> implements Pair<L, R> {
  static Pair<L, R> factory<L, R>(L left, R right) => _PairImpl(left, right);

  @override
  final L left;

  @override
  final R right;

  _PairImpl(this.left, this.right);

  @override
  String toString() => 'Pair($left, $right)';
}
