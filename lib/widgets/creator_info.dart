import 'package:flutter/material.dart';

class CreatorInfo extends StatelessWidget {
  const CreatorInfo({super.key});

  void onTutupTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ), // BoxDecoration
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Tentang Pembuat',
                style: TextStyle(fontSize: 14),
              ), // Text
              const SizedBox(height: 10), // SizedBox
              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/c1.jpeg'),
                  fit: BoxFit.cover,
                ), // Image
              ), // ClipRRect
              const SizedBox(height: 10), // SizedBox
              const Text(
                'Muhammad Irsan Abidin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ), // Text
              const Text(
                'XII RPL 2',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ), // Text
              const SizedBox(height: 10), // SizedBox
            ], // Column children
          ), // Column
        ), // Container
        Positioned(
          top: 10,
          right: 10,
          child: SizedBox(
            width: 50,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => onTutupTap(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.grey.shade100,
                foregroundColor: Colors.black,
                elevation: 0,
              ), // ElevatedButton.styleFrom
              icon: const Icon(Icons.close),
              label: const SizedBox.shrink(), // Hide label text
            ), // ElevatedButton.icon
          ), // SizedBox
        ), // Positioned
      ], // Stack children
    ); // Stack
  }
}
