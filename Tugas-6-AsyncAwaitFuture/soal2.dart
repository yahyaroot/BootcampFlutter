void main() {
  print("Life");

  Future.delayed(Duration(seconds: 1), () => print("Is"));

  Future.delayed(Duration(seconds: 2), () => print("Never flat"));
}
