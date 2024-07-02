import 'dart:ui';

import 'package:about_me_project/widgets/formacao_card.dart';

class AboutSections {
  AboutSections({
    required this.title,
    this.bodyText,
    required this.color,
    required this.textColor,
    this.subtitle,
    this.existText,
    this.formCard,
    this.isCerts = false, // Definição do valor padrão diretamente no construtor
  });

  final String title;
  final String? bodyText;
  final Color color;
  final Color textColor;
  final String? subtitle;
  final bool? existText;
  final FormacaoCard? formCard;
  final bool isCerts; // Agora é um campo não nulo
}
