import 'dart:io';

void main() {
  //Soal 1
  // print("Ingin Instal Aplikasi (Y/N):\t ");

  // String? answer = stdin.readLineSync() ?? "";

  // String output = (answer.toLowerCase() == 'y')
  //     ? "Anda akan menginstall aplikasi dart"
  //     : "Aborted";

  // print(output);

  // Soal 2 If-else if dan else

  // print("Selamat datang di Dunia Werewolf!");
  // print("Silahkan masukkan nama kamu: ");
  // String name = stdin.readLineSync() ?? "";

  // if (name.isEmpty) {
  //   print("Nama harus diisi!");
  // } else {
  //   print(
  //       "Halo, $name, pilih peranmu untuk memulai game (Penyihir/Guard/Werewolf): ");
  //   String role = stdin.readLineSync() ?? "";

  //   if (role.isEmpty) {
  //     print("Hallo '$name', Pilih Peranmu untuk memulai game!");
  //   } else if (role.toLowerCase() == "penyihir") {
  //     print(
  //         "'$name' Peran 'Penyihir', 'Selamat datang di dunia Werewrolf, $name'Hallo Penyihir $name kamu dapat melihat siapa yang menjadi werewolf!.");
  //   } else if (role.toLowerCase() == "guard") {
  //     print(
  //         "'$name' Peran 'Guard', 'Selamat datang di dunia Werewrolf, $name'Hallo Guard $name kamu akan membantu melindungi temanmu dari serangan werewolf.");
  //   } else if (role.toLowerCase() == "werewolf") {
  //     print(
  //         "'$name' Peran 'Werewolf', 'Selamat datang di dunia Werewrolf, $name'Hallo Warewolf $name Kamu akan memakan mangsa setiap malam!.");
  //   } else {
  //     print(
  //         "Hallo '$name' Peran yang kamu pilih tidak tersedia. Pilih Peranmu (Penyihir/Guard/Werewolf).");
  //   }
  // }

// Soal 3 Switch case
  // print("Masukkan hari (Senin, Selasa, Rabu, Kamis, Jumat, Sabtu, Minggu): ");
  // String day = stdin.readLineSync() ?? "";

  // switch (day.toLowerCase()) {
  //   case "senin":
  //     print(
  //         "Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.");
  //     break;
  //   case "selasa":
  //     print(
  //         "Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.");
  //     break;
  //   case "rabu":
  //     print(
  //         "Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.");
  //     break;
  //   case "kamis":
  //     print(
  //         "Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.");
  //     break;
  //   case "jumat":
  //     print("Hidup tak selamanya tentang pacar.");
  //     break;
  //   case "sabtu":
  //     print("Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.");
  //     break;
  //   case "minggu":
  //     print(
  //         "Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.");
  //     break;
  //   default:
  //     print("Hari yang dimasukkan tidak valid.");
  // }

  //  Soal 4 Switch Case
  // var tanggal = 21;
  // var bulan = 1;
  // var tahun = 1945;

  // String formattedMonth;

  // switch (bulan) {
  //   case 1:
  //     formattedMonth = "Januari";
  //     break;
  //   case 2:
  //     formattedMonth = "Februari";
  //     break;
  //   case 3:
  //     formattedMonth = "Maret";
  //     break;
  //   case 4:
  //     formattedMonth = "April";
  //     break;
  //   case 5:
  //     formattedMonth = "Mei";
  //     break;
  //   case 6:
  //     formattedMonth = "Juni";
  //     break;
  //   case 7:
  //     formattedMonth = "Juli";
  //     break;
  //   case 8:
  //     formattedMonth = "Agustus";
  //     break;
  //   case 9:
  //     formattedMonth = "September";
  //     break;
  //   case 10:
  //     formattedMonth = "Oktober";
  //     break;
  //   case 11:
  //     formattedMonth = "November";
  //     break;
  //   case 12:
  //     formattedMonth = "Desember";
  //     break;
  //   default:
  //     formattedMonth = "Bulan tidak valid";
  // }

  // if (tanggal >= 1 && tanggal <= 31 && tahun >= 1900 && tahun <= 2200) {
  //   print("$tanggal $formattedMonth $tahun");
  // } else {
  //   print("Input tanggal, bulan, atau tahun tidak valid.");
  // }
}
