import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mini_projeck/pages/materi_page/components/list_materi.dart';
import 'package:mini_projeck/pages/materi_page/components/materi_card.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: himpunan
              .map((e) => MateriCard(judulMateri: e.judulMateri))
              .toList(),
        ),
      ),
    );
  }
}
