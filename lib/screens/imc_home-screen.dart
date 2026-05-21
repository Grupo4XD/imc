//StateLess -> Indica que no tiene estados, widget estaticos que novarian como html puro
//StateFul -> Indica que los widgets cambairan de estado dependiendod el comportamiento del usuario comoen javascript

import 'package:flutter/material.dart';
import 'package:imc_calculadora/components/gender_selector.dart';
import 'package:imc_calculadora/components/height_selector.dart';
import 'package:imc_calculadora/components/number_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreen();
}

class _ImcHomeScreen extends State<ImcHomeScreen> {
  int SelectedAge = 20;
  int SelectedWeight = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
        Padding(
          padding: EdgeInsets.all(26.0),
          child: Row(
            children: [
              //El expanded hace que cada widget ocupe todo el contendio en un row o columkn
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  onIncrement: (){
                    SelectedWeight++;
                  }
                ),
              ),
              SizedBox(width: 16),
              Expanded(child: NumberSelector(title: "EDAD",onIncrement: (){},)),
            ],
          ),
        ),
      ],
    );
  }
}