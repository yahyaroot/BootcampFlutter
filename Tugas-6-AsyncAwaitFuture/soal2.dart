void main() {
  print("Life");
  Is();
  NeverFlat();
}

Future<void> Is() {
  return Future.delayed(Duration(seconds: 1), () => print('Is'));
}

Future<void> NeverFlat() {
  return Future.delayed(Duration(seconds: 2), () => print('Never flat'));
}
