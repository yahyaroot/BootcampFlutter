class Character {
  int? _powerPoint;

  int get powerPoint => _powerPoint!;

  set powerPoint(int value) {
    if (value <= 5) {
      _powerPoint = value = 5;
    }
    _powerPoint = value;
  }
}
