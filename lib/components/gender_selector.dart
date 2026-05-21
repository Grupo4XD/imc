import 'package:flutter/material.dart';
import 'package:imc_calculadora/core/app_colors.dart';
import 'package:imc_calculadora/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          //El widget sera clicleable con este metodo 
          child: GestureDetector(
            onTap: (){
              setState(() {
                //Este metodod siempre se llama siempre que modifiquemos el UI, y siempre se pone para hacer algun cambie en un stateful
                selectedGender = "Masculino";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 26,bottom:16,top: 16, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "Masculino" ?
                  AppColors.backgroundComponentSelected:
                  AppColors.backgroundComponent
                  ,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/imagenes/male.png", height: 80),
                      SizedBox(height: 8,),
                      Text(
                        "Masculino".toUpperCase(),
                        style: TextStyles.bodyText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //Mujer
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = "Femenino";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 16,bottom: 16,right: 26,left: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender =="Femenino" ?
                  AppColors.backgroundComponentSelected:
                  AppColors.backgroundComponent
                  ,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Image.asset("assets/imagenes/female.png", height: 80),
                          SizedBox(height: 8,),
                          Text(
                            "Femenino".toUpperCase(),
                            style: TextStyles.bodyText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
