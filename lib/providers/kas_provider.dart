import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';

class KasProvider extends ChangeNotifier {
  List<Kas> _items = [];

  // Getter for all items
  List<Kas> get items => _items;

  // Getter for masukItems (Kas Masuk)
  List<Kas> get masukItems =>
      _items.where((e) => e.jenis == JenisKas.kasMasuk).toList();

  // Change masukKeluar to keluarItems (Kas Keluar)
  List<Kas> get keluarItems =>
      _items.where((e) => e.jenis == JenisKas.kasKeluar).toList();

  // Method to add both Kas Masuk and Kas Keluar
  void tambah(Kas kas) {
    _items.add(kas);
    notifyListeners();
  }

  // Method to remove Kas Masuk or Kas Keluar
  void hapus(Kas kas) {
    _items.remove(kas);
    notifyListeners();
  }
}
