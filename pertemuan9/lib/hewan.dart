// hewan.dart
class Hewan {
  String nama;
  double berat;

  Hewan(this.nama, this.berat);

  void makan(double porsi) {
    berat += porsi;
  }

  void lari(double jarak) {
    berat -= jarak;
  }
}
