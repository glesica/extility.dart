/// A pair of elements, possibly of different types.
///
/// This type is used by some of the iterable extensions
/// since Dart lacks a built-in tuple type and lists must
/// be homogeneous.
abstract class Pair<L, R> {
  /// The element on the left-hand side of the pair, can
  /// also be thought of as the first element.
  L get left;

  /// The element on the right-hand side of the pair, can
  /// also be thought of as the second element.
  R get right;
}
