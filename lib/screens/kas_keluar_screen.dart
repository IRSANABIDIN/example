import 'package:flutter/material.dart';
import 'package:kas_personal/models/kas.dart';
import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/widgets/card_kas_info.dart';
import 'package:kas_personal/widgets/kas_item.dart';
import 'package:provider/provider.dart';

class KasKeluarScreen extends StatefulWidget {
  const KasKeluarScreen({super.key});

  @override
  State<KasKeluarScreen> createState() => _KasKeluarScreenState();
}

class _KasKeluarScreenState extends State<KasKeluarScreen> {
  void onItemTap(Kas kas) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Hapus'),
              content: const Text('Anda yakin ingin menghapus data?'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<KasProvider>(context, listen: false)
                          .hapus(kas);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ya')),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Tidak')),
              ],
            ));
  }

  void baru() async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: BaruDialogKeluar(
          onSimpan: (Kas kas) {
            Provider.of<KasProvider>(context, listen: false).tambah(kas);
          },
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas Keluar'),
      ), // AppBar
      floatingActionButton: FloatingActionButton(
        onPressed: baru,
        child: const Icon(Icons.add),
      ),
      body: Consumer<KasProvider>(
        builder: (context, value, child) {
          final items = value.keluarItems;

          return Column(
            children: [
              CardKasInfo(items: items, jenis: JenisKas.kasKeluar),
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
                      onTap: () => onItemTap(kas),
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
}

class BaruDialogKeluar extends StatefulWidget {
  const BaruDialogKeluar({super.key, required this.onSimpan});

  final void Function(Kas kas) onSimpan;

  @override
  State<BaruDialogKeluar> createState() => _BaruDialogKeluarState();
}

class _BaruDialogKeluarState extends State<BaruDialogKeluar> {
  final nominalController = TextEditingController(text: '');
  final keteranganController = TextEditingController(text: '');

  void onSimpan() {
    double nominal =
        nominalController.text != '' ? double.parse(nominalController.text) : 0;
    var kas = Kas.keluar(
      keterangan: keteranganController.text,
      nominal: nominal,
      dateTime: DateTime.now(),
    );
    widget.onSimpan(kas);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ), // BoxDecoration
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Buat Kas Keluar',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ), // TextStyle
          ), // Text
          const SizedBox(height: 10), // SizedBox
          TextField(
            controller: nominalController,
            decoration: const InputDecoration(
              labelText: 'Nominal',
              filled: true,
              border: OutlineInputBorder(),
            ), // InputDecoration
            keyboardType: TextInputType.number,
          ), // TextField
          const SizedBox(height: 10), // SizedBox
          TextField(
            controller: keteranganController,
            decoration: const InputDecoration(
              labelText: 'Keterangan',
              filled: true,
              border: OutlineInputBorder(),
            ), // InputDecoration
          ), // TextField
          const SizedBox(height: 10), // SizedBox
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onSimpan,
              child: const Text('Simpan'),
            ), // ElevatedButton
          ), // SizedBox
        ], // Column children
      ), // Column
    ); // Container
  }
}
