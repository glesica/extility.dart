import 'package:test/test.dart';

import 'package:extility/src/iterable/iterable_extensions.dart';

void main() {
  group('IterableExtensions', () {
    group('bracket()', () {
      test('should do nothing on an empty iterable', () {
        final input = [];
        final output = input.bracket(() => null);
        expect(output.isEmpty, isTrue);
      });

      test('should bracket a non-empty iterable', () {
        final input = [1];
        final output = input.bracket(() => 0);
        expect(output, hasLength(3));
        expect(output, containsAllInOrder([0, 1, 0]));
      });

      test('should bracket with subtype values', () {
        final input = <num>[1.0];
        final output = input.bracket(() => 0);
        expect(output, hasLength(3));
        expect(output, containsAllInOrder([0, 1.0, 0]));
      });
    });

    group('interleave()', () {
      test('should do nothing on an empty iterable', () {
        final input = [];
        final output = input.interleave(() => null);
        expect(output.isEmpty, isTrue);
      });

      test('should do nothing on a single-element iterable', () {
        final input = [1];
        final output = input.interleave(() => 0);
        expect(output, hasLength(1));
        expect(output, containsAllInOrder([1]));
      });

      test('should interleave a non-empty iterable', () {
        final input = [1, 2];
        final output = input.interleave(() => 0);
        expect(output, hasLength(3));
        expect(output, containsAllInOrder([1, 0, 2]));
      });

      test('should interleave with subtype values', () {
        final input = <num>[1.0, 2.0];
        final output = input.interleave(() => 0);
        expect(output, hasLength(3));
        expect(output, containsAllInOrder([1.0, 0, 2.0]));
      });
    });
  });
}
