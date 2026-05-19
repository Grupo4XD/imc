//StateLess -> Indica que no tiene estados, widget estaticos que novarian como html puro
//StateFul -> Indica que los widgets cambairan de estado dependiendod el comportamiento del usuario comoen javascript

import 'package:flutter/material.dart';
import 'package:imc_calculadora/components/gender_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreen();
}

class _ImcHomeScreen extends State<ImcHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GenderSelector()
      ],
    );
  }
}