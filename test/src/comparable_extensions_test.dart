import 'package:test/test.dart';

import 'package:extility/src/comparable_extensions.dart';

void main() {
  group('ComparableExtensions', () {
    group('genericClamp()', () {
      test('should return itself if given no bounds', () {
        expect(5.genericClamp(), 5);
      });

      test('should clamp on the lower bound', () {
        expect(5.genericClamp(min: 4), 5);
        expect(5.genericClamp(min: 5), 5);
        expect(5.genericClamp(min: 6), 6);
      });

      test('should clamp on the upper bound', () {
        expect(5.genericClamp(max: 4), 4);
        expect(5.genericClamp(max: 5), 5);
        expect(5.genericClamp(max: 6), 5);
      });

      test('should assert min orders before or the same as max', () {
        expect(() => 5.genericClamp(min: 7, max: 3),
            throwsA(isA<AssertionError>()));
      });

      group('given both bounds', () {
        test('should return itself if within the bounds', () {
          expect(5.genericClamp(min: 3, max: 7), 5);
        });

        test('should clamp the lower bound', () {
          expect(5.genericClamp(min: 5, max: 7), 5);
          expect(5.genericClamp(min: 6, max: 7), 6);
        });

        test('should clamp the upper bound', () {
          expect(5.genericClamp(min: 3, max: 5), 5);
          expect(5.genericClamp(min: 3, max: 4), 4);
        });

        test('should clamp to trivial bounds', () {
          expect(5.genericClamp(min: 5, max: 5), 5);
          expect(5.genericClamp(min: 4, max: 4), 4);
          expect(5.genericClamp(min: 6, max: 6), 6);
        });
      });
    });
  });
}
