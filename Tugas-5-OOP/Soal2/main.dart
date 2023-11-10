import 'luaslingkaran.dart';

void main() {
  LuasLingkaran lingkaran;
  double luasLingkaran;

  lingkaran = new LuasLingkaran();
  lingkaran.setJari_jari(4.0);

  luasLingkaran = lingkaran.hitungLuas();
  print(luasLingkaran);
}
