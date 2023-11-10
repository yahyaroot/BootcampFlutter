void main() {
  LuasSegitiga segitiga;

  double luasSegitiga;

  segitiga = new LuasSegitiga();

  segitiga.setengah = 0.5;
  segitiga.alas = 20.0;
  segitiga.tinggi = 30.0;

  luasSegitiga = segitiga.hitungLuasSegitiga();
  print(luasSegitiga);
}

class LuasSegitiga {
  double? setengah, alas, tinggi;
  double hitungLuasSegitiga() {
    return this.setengah! * alas! * tinggi!;
  }
}
