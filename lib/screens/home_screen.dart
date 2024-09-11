import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kas_personal/providers/kas_provider.dart';
import 'package:kas_personal/widgets/card_kas_info_all.dart';
import 'package:kas_personal/widgets/creator_info.dart';
import 'package:kas_personal/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onKasMasukTap() => context.goNamed('kas_masuk');
  void onKasKeluarTap() => context.goNamed('kas_keluar');
  void ontransaksiTap() => context.goNamed('transaksi');

  void onInfoTap() async {
    await showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: CreatorInfo(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kas Personal App'),
      ), // AppBar
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Consumer<KasProvider>(
              builder: (context,value,child){
                final items = value.items;
                return CardKasInfoAll(items: items);
              }
            ),
            const SizedBox(height : 10,
            ),
            Divider(color: Colors.grey.shade200,height:0,),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: CustomIconButton(
                    backgroundColor: Colors.blue,
                    icon: Icons.credit_card,
                    text: 'Kas Masuk',
                    onTap: onKasMasukTap,
                  ), // CustomIconButton
                ), // Flexible
                const SizedBox(width: 10), // SizedBox
                Flexible(
                  fit: FlexFit.tight,
                  child: CustomIconButton(
                    backgroundColor: Colors.blue,
                    icon: Icons.receipt,
                    text: 'Kas Keluar',
                    onTap: onKasKeluarTap,
                  ), // CustomIconButton
                ), // Flexible
              ], // Row children
            ),
            const SizedBox(height: 10), // SizedBox
            CustomIconButton(
              backgroundColor: Colors.blue,
              icon: Icons.monetization_on,
              text: 'Lihat Semua transaksi',
              onTap: ontransaksiTap,
            ),            
            const SizedBox(height: 10), // SizedBox
            CustomIconButton(
              backgroundColor: Colors.blue,
              icon: Icons.info,
              text: 'Tentang Pembuat',
              onTap: onInfoTap,
            ), // CustomIconButton
          ], // Column children
        ), // Column
      ), // Container
    ); // Scaffold
  }
}
