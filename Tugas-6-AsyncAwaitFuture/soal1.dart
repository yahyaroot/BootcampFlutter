// void main() {
//   var h = Human();
//   print("Luffy");
//   print("zoro");
//   print("killer");
//   h.getData();
//   print(h.name);
// }

// class Human {
//   String name = "nama character one piece";

//   void getData() {
//     name = "hilmy";
//     print("get data [done]");
//   }
// }

void main() async {
  var h = Human();
  print("Luffy");
  print("Zoro");
  print("Killer");
  print(h.name);
  await h.getData();
  print(h.name);
}

class Human {
  String name = "nama character one piece";
  Future<void> getData() async {
    await Future.delayed(
        Duration(seconds: 3)); // Simulating an asynchronous operation
    name = "Hilmy";
    print("get data [done]");
  }
}
