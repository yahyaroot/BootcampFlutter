import 'employee.dart';

void main() {
  var data1 = new Employee.id(1);
  var data2 = new Employee.name("Yahya Sanbercode");
  var data3 = new Employee.department("Programmer");

  print("ID: ${data1.id}");
  print("Nama:${data2.name}");
  print("Departmen:${data3.department}");
}
