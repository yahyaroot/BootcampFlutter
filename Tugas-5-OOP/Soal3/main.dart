import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main(List<String> args) {
  ArmorTitan ar = ArmorTitan();
  AttackTitan at = AttackTitan();
  BeastTitan bs = BeastTitan();
  Human hm = Human();

  ar.powerPoint = 8;
  at.powerPoint = 10;
  bs.powerPoint = 6;
  hm.powerPoint = 1;

  print("level power Armor Titan: ${ar.powerPoint}");
  print("level power Attack Titan: ${at.powerPoint}");
  print("level power Beast Titan: ${bs.powerPoint}");
  print("level power Human: ${hm.powerPoint}");

  print("sifat dari Armor Titan: " + ar.terjang());
  print("sifat dari Attack Titan: " + at.punch());
  print("sifat dari Beast Titan: " + bs.lempar());
  print("sifat dari Human: " + hm.killAllTitan());
}
