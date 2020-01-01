import 'package:test/test.dart';

import 'package:extility/src/iterable_extensions.dart';
import 'package:extility/src/pair.dart';

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

    group('zip()', () {
      test('should return an empty list if both iterables are empty', () {
        expect([].zip([]), isEmpty);
      });

      test('should return values zipped correctly', () {
        final output = [1, 2].zip([3, 4]).toList();
        expect(output, hasLength(2));
        expect(output, everyElement(hasLength(2)));
        expect(output[0], containsAllInOrder([1, 3]));
        expect(output[1], containsAllInOrder([2, 4]));
      });

      test('should allow the left iterable to be shorter', () {
        final output = [1].zip([3, 4]).toList();
        expect(output, hasLength(2));
        expect(output, everyElement(hasLength(2)));
        expect(output[0], containsAllInOrder([1, 3]));
        expect(output[1], containsAllInOrder([null, 4]));
      });

      test('should allow the right iterable to be shorter', () {
        final output = [1, 2].zip([3]).toList();
        expect(output, hasLength(2));
        expect(output, everyElement(hasLength(2)));
        expect(output[0], containsAllInOrder([1, 3]));
        expect(output[1], containsAllInOrder([2, null]));
      });
    });

    group('zipTo()', () {
      test('should use the combine function', () {
        final output = ['Kate', 'Pablo'].zipTo(
          [28, 31],
          (l, r) => <String, int>{l: r},
        );
        expect(output, hasLength(2));
        expect(output, everyElement(isA<Map<String, int>>()));
      });

      test('should support async combine functions', () async {
        final output = [1, 2].zipTo([5, 6], (l, r) => Future.value(l + r));
        final values = await Future.wait(output);
        expect(values, hasLength(2));
        expect(values, containsAllInOrder([6, 8]));
      });
    });

    group('zipToPair()', () {
      test('should combine elements into Pairs', () {
        final output = ['Kate', 'Pablo'].zipToPairs([28, 31]);
        expect(output, hasLength(2));
        expect(output, everyElement(isA<Pair<String, int>>()));
      });
    });
  });
}
