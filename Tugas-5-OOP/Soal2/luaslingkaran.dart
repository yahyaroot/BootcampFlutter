class LuasLingkaran {
  double? _jarijari;
  final phi = 22 / 7;

  void setJari_jari(double value) {
    if (value < 0) {
      value *= -1;
    }
    _jarijari = value; //alias
  }

  double getJarijari() {
    return _jarijari!;
  }

  double hitungLuas() {
    return this._jarijari! * _jarijari! * phi;
  }
}
