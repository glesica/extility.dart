/// Extensions on [Comparable] when it is implemented by a type that
/// is comparable to itself.
extension ComparableExtensions<T extends Comparable<T>> on Comparable<T> {
  /// Clamp the value between `min` and `max` (inclusive), returning
  /// `min` if less than `min`, `max` if greater than `max`, or `this`
  /// otherwise.
  ///
  /// For example:
  ///
  /// 5.clamp(min: 4, max: 6) // 5
  /// 5.clamp(min: 5, max: 6) // 5
  /// 5.clamp(min: 6, max: 6) // 6
  /// 5.clamp(min: 6) // 6
  ///
  /// Notes:
  ///   * `min` should be less-then or equal-to `max`
  ///   * The weird name is to avoid collision with [num.clamp]
  T genericClamp<C extends T>({
    C min,
    C max,
  }) {
    assert((min?.compareTo(max ?? min) ?? 0) <= 0);

    if (min != null && compareTo(min) < 0) {
      return min;
    }

    if (max != null && compareTo(max) > 0) {
      return max;
    }

    return this;
  }
}
