import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FormacaoCard extends StatelessWidget {
  const FormacaoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 600),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: SelectableText("Universidade do Estado de Santa Catarina - UDESC", style: Theme.of(context).textTheme.titleMedium,),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: SelectableText("Centro de Ciências Tecnológicas - Joinville", style: Theme.of(context).textTheme.titleMedium),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Image.asset("assets/images/Marca_Udesc.png", width: 100,),
                  const Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [SelectableText("Bacharel em Ciência da Computação"),
                      SelectableText("Previsão de Conclusão: Jul/2025")],)
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
