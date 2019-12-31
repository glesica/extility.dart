import 'package:extility/extility.dart';

void main() {
  print('5.genericClamp(min: 4, max: 6)');
  print(5.genericClamp(min: 4, max: 6));

  print('5.genericClamp(min: 6, max: 6)');
  print(5.genericClamp(min: 6, max: 6));

  print('5.genericClamp(max: 4)');
  print(5.genericClamp(max: 4));
}
