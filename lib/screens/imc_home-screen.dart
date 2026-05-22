//StateLess -> Indica que no tiene estados, widget estaticos que novarian como html puro
//StateFul -> Indica que los widgets cambairan de estado dependiendod el comportamiento del usuario comoen javascript

import 'package:flutter/material.dart';
import 'package:imc_calculadora/components/gender_selector.dart';
import 'package:imc_calculadora/components/height_selector.dart';
import 'package:imc_calculadora/components/number_selector.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';
import 'package:imc_calculadora/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreen();
}

class _ImcHomeScreen extends State<ImcHomeScreen> {
  int SelectedAge = 20;
  int SelectedWeight = 80;
  double selectedHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        //() -> Se pone asi si no recibmos ningun valor pero si devuelve un valor entonces ponemos la variable donde queremos que se guarde y poder usarla
        //Se pone dentro d
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChange: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.all(26.0),
          child: Row(
            children: [
              //El expanded hace que cada widget ocupe todo el contendio en un row o columkn
              Expanded(
                child: NumberSelector(
                  title: "PESO",
                  value: SelectedWeight,
                  //Cada vez que se toque el boton del hijo llama a la funcion y hace que se incremente para alterar el estado de este padreo
                  onIncrement: () {
                    setState(() {
                      SelectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      SelectedWeight--;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: NumberSelector(
                  title: "EDAD",
                  value: SelectedAge,
                  onIncrement: () {
                    setState(() {
                      SelectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      SelectedAge--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                //Decimos al navegador que redirija a otra ruta, el cotexto que todos loswidgets lo nesesitan
                Navigator.push(
                  //El contexttienen todos los widgets
                  context,
                  //El materialpageroute es un braper que simplifica la navegacion
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreen(
                      height: selectedHeight,
                      weight: SelectedWeight,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                //Shape : Forma osea dentro van las formas de un widget
                //El widgetstatepropertyall, define la forma de un widget sin importar el estado en el que estee, ya sea clicekado o over, etc
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  AppColors.backgroundComponent,
                ),
              ),
              child: Text("Calcular", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
