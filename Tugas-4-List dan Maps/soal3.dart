void main() {
  dataHandling(List<List<dynamic>> data) {
    for (int i = 0; i < data.length; i++) {
      List<dynamic> entry = data[i];
      print('Nomor ID: ${entry[0]}');
      print('Nama Lengkap: ${entry[1]}');
      print('TTL: ${entry[2]} ${entry[3]}');
      if (entry.length > 4) {
        for (int j = 4; j < entry.length; j++) {
          print('Hobi: ${entry[j]}');
        }
      }
      print(''); // Menambah baris kosong antara setiap entri
    }
  }

  var input = [
    ["001", 'Roman Alamsyah', 'Bandar Lampung', '21/05/1989', 'Membaca'],
    ["002", 'Dika Sembiring', 'Medan', '20/12/1990', 'Bermain Gitar'],
    ["003", 'Winona', 'Ambon', '25/12/1905', 'Memasak'],
    ["004", 'Bintang Senjaya', 'Surabaya', '03/03/1987', 'Berkebun']
  ];

  dataHandling(input);
}
