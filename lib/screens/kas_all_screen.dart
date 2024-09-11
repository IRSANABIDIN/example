import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';
import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/widgets/kas_item.dart';
import 'package:provider/provider.dart';

class KasAllScreen extends StatefulWidget {
  const KasAllScreen({super.key});

  @override
  State<KasAllScreen> createState() => _KasAllScreenState();
}

class _KasAllScreenState extends State<KasAllScreen> {
  double totalMasuk(List<Kas> items) {
    final listMasuk = items.where((e) => e.jenis == JenisKas.kasMasuk).toList();
    return listMasuk.isNotEmpty
        ? listMasuk.map((e) => e.nominal).reduce((a, b) => a + b)
        : 0.0;
  }

  double totalKeluar(List<Kas> items) {
    final listKeluar =
        items.where((e) => e.jenis == JenisKas.kasKeluar).toList();
    return listKeluar.isNotEmpty
        ? listKeluar.map((e) => e.nominal).reduce((a, b) => a + b)
        : 0.0;
  }

  double sisaKas(List<Kas> items) {
    return totalMasuk(items) - totalKeluar(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Transaksi Kas'),
      ),
      body: Consumer<KasProvider>(
        builder: (context, provider, child) {
          final items = provider.items;

          return Column(
            children: [
              // Tampilan Pemasukan, Pengeluaran, dan Sisa Kas
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Total Pemasukan
                    _buildSummaryCard(
                      title: 'Pemasukan',
                      amount: totalMasuk(items),
                      color: Colors.green,
                    ),
                    // Total Pengeluaran
                    _buildSummaryCard(
                      title: 'Pengeluaran',
                      amount: totalKeluar(items),
                      color: Colors.red,
                    ),
                    // Sisa Kas
                    _buildSummaryCard(
                      title: 'Sisa Kas',
                      amount: sisaKas(items),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              // Daftar Semua Transaksi
              Flexible(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: Colors.grey.shade200,
                  ), // Divider
                  itemBuilder: (context, index) {
                    var kas = items[index];
                    return KasItem(
                      kas: kas,
                      onTap: () {
                        // Aksi jika item kas diklik
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget untuk menampilkan summary Pemasukan, Pengeluaran, dan Sisa Kas
  Widget _buildSummaryCard({
    required String title,
    required double amount,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'IDR ${amount.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
