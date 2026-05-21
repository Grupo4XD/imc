import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final Function() onIncrement;

  //Se recibimos arguments lo ponemos despues del padre para que guarde su valor
  const NumberSelector({super.key, required this.title, required this.onIncrement});

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //Con la clase widget. podemos llamar a los atributos de la clase
            Text(widget.title, style: TextStyles.bodyText,
            ),
            Text("10",style: TextStyles.numberText,),
            Row(
              //Para usar el mainaxis, entonces debemos hacer que cada contenedor ocupe todo el espcio puede ser con expanded
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //shape: Recibe un tipo de borde para los botones
                FloatingActionButton(
                  onPressed: () {
                    //Por lo general el setstate se pónecuando se interactua con un boton
                    widget.onIncrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                //Importante sized box es como un widget vacio
                SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.remove, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}