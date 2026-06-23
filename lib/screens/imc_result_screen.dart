import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';

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
      //Pasamos el context
      body: bodyResult(context),
    );
  }
  
  //Aqui tambien para que sea como parametro
  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

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
          SizedBox(height: 20),
          Expanded(
            //Hace que el widget hijo ocupe todo el espacio restante
            child: Container(
              //Las columns no responden a los height double infinity
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    getTitleleByImc(imcResult),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      //Sacamos un metodo de mi IMC
                      color: getColorByImc(imcResult),
                    ),
                  ),

                  Text(
                    imcResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(GetDescription(imcResult), style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 26),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  //Debemos poner el context arriba
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    AppColors.backgroundComponent,
                  ),
                ),
                child: Text("Finalizar", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic getColorByImc(double imcResult) {
    return switch(imcResult){
      //Funciones lambda
      < 18.6 => Colors.blue, //Derlgado
      <24.9 => Colors.green, //
      <29.99 => Colors.orange,
      _=> Colors.red 
    };
  }

  String getTitleleByImc(double imcResult){
    return switch(imcResult){
      //Funciones lambda
      < 18.6 => "IMC bajo", //Derlgado
      <24.9 => "IMC Normal", //
      <29.99 => "Sobrepeso",
      _=> "Obesidad"
    };
  }

  // ignore: non_constant_identifier_names
  String GetDescription(double imcResult){
    return switch(imcResult){
      //Funciones lambda
      < 18.6 => "Debes de comer un poco mas", //Derlgado
      <24.9 => "Estas yendo por el camino correcto", //
      <29.99 => "Debes hacer dieta ligera",
      _=> "Nesesitas cuidarte y has una dieta desde mañana"
    };
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