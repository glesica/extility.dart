import 'package:extility/extility.dart';

void main() {
  print('[1].bracket(() => 0');
  print([1].bracket(() => 0));
  print('');

  print('[1, 2, 3].interleave(() => 0)');
  print([1, 2, 3].interleave(() => 0));
  print('');

  print('[1, 2].zip([3, 4])');
  print([1, 2].zip([3, 4]));
  print('');

  print('[\'Kate\', \'Pablo\'].zipTo([28, 31], (l, r) => <String, int>{l: r})');
  print(['Kate', 'Pablo'].zipTo([28, 31], (l, r) => <String, int>{l: r}));
  print('');

  print('[\'Kate\', \'Pablo\'].zipToPairs([28, 31])');
  print(['Kate', 'Pablo'].zipToPairs([28, 31]));
  print('');
}
