import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  //Para guardar los valores que le pasamos de otra vista junto a los demas valores
  final double height;
  final int weight;
  
  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    //Para otra pantalla si osi nesesitamos un scaffold para hjacerla mas fluida
    return Scaffold(
      backgroundColor: AppColors.background,
      //Al poner el appBar el navigator pone la clecha de vuelta atras
      appBar: toolbarResult(),
      body: bodyResult(),
    );
  }

  Padding bodyResult() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tu resultado ",
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            //Hace que el widget hijo ocupe todo el espacio restante
            child: Container(
              //Las columns no responden a los height double infinity
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Text(""),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:26),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(onPressed: (){},
              style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      AppColors.backgroundComponent,
                    ),
                  )
              , child: Text("Finalizar", style: TextStyle(
                color: Colors.white
              ),)),
            ),
          )
        ],
      ),
    )
    ;
  }

  //Aqui extraimos un metodo para ser usado luego
  AppBar toolbarResult() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      title: Text("Resultado"),
    );
  }
}