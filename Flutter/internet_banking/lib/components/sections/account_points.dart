import 'package:flutter/material.dart';
import 'package:internet_banking/components/box_card.dart';
import 'package:internet_banking/components/color_dot.dart';
import 'package:internet_banking/components/content_division.dart';

class AccountPoints extends StatelessWidget {
  const AccountPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Pontos da conta",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          BoxCard(boxContent: _AccountPointsContent()),
        ],
      ),
    );
  }
}

class _AccountPointsContent extends StatelessWidget {
  const _AccountPointsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text("Pontos Totais"),
        ),
        Text("3000", style: Theme.of(context).textTheme.bodyLarge,),
        Padding(
          padding: const EdgeInsets.only(top:4.0, bottom: 4.0),
          child: ContentDivision(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text("Objetivos:", style:Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ColorDot(color: Colors.deepOrange),
              ),
              Text("Entrega Grátis: 1500pts")
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ColorDot(color: Colors.deepOrange),
            ),
            Text("1 mês de streaming: 30000pts")
          ],
        )
      ],
    );
  }
}
