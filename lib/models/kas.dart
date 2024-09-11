enum JenisKas { kasMasuk, kasKeluar }

class Kas {
  final String keterangan;
  final JenisKas jenis;
  final double nominal;
  final DateTime dateTime;

  const Kas({
    required this.jenis,
    required this.keterangan,
    required this.nominal,
    required this.dateTime,
  });

  const Kas.masuk({
    required String keterangan,
    required double nominal,
    required DateTime dateTime,
  }) : this(
          jenis: JenisKas.kasMasuk,
          keterangan: keterangan,
          nominal: nominal,
          dateTime: dateTime,
        );

  const Kas.keluar({
    required String keterangan,
    required double nominal,
    required DateTime dateTime,
  }) : this(
          jenis: JenisKas.kasKeluar,
          keterangan: keterangan,
          nominal: nominal,
          dateTime: dateTime,
        );
}
