import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  //Definimos funciones si un widget devuelve un valor y queremos llamar al padre
  final Function(double) onHeightChange;
  
  const HeightSelector({super.key,required this.selectedHeight,required this.onHeightChange});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8),
                child: Text("ALTURA",style: TextStyles.bodyText),
              ),
              Text("${widget.selectedHeight.toStringAsFixed(0)} cm",style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
              //Slider es una barra de estado, onchanged su value es el valor que devuelve la funcion
              Slider(value: widget.selectedHeight, onChanged: (medicion){
                widget.onHeightChange(medicion);
               //Cantidad minima y maxima y las divisones son el rango entre el minimoy maximo para que vaya de uno en uno
               //El activeColor es para la barra
               //Label se ve cuando movemos la barra
              },min: 150,max: 220,divisions: 70,
              label: "${widget.selectedHeight.toStringAsFixed(0)}",
              activeColor: AppColors.accent,)
            ],
          ),
        ),
      ),
    );
  }
}