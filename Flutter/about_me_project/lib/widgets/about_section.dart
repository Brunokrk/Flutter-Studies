import 'package:about_me_project/model/aboutSections.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/dataSecs.dart';
import 'certification_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.model});

  final AboutSections model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: model.color,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(65.0, 45, 65, 45),
        child: model.isCerts ? _buildCertifications(context) : _buildInformation(context),
      ),
    );
  }

  Widget _buildInformation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(context),
        if (model.subtitle != null && model.subtitle!.isNotEmpty)
          _buildSubtitle(context),
        if (model.bodyText != null && model.bodyText!.isNotEmpty)
          _buildBodyText(context)
        else
          model.formCard!,
      ],
    );
  }

  Widget _buildCertifications(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTitle(context),
        CarouselSlider(
          items: _carouselItems(),
          options: CarouselOptions(autoPlay: true, viewportFraction: 0.2, height: 350),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
      child: SelectableText(
        model.title,
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: model.textColor),
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SelectableText(
        model.subtitle!,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: model.textColor, fontWeight: FontWeight.bold, fontSize: 19),
      ),
    );
  }

  Widget _buildBodyText(BuildContext context) {
    return Container(
      width: 800,
      child: SelectableText(
        model.bodyText!,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: model.textColor),
      ),
    );
  }

  List<Widget> _carouselItems() {
    return allCertifications.map((cardModel) => CertificationCard(model: cardModel)).toList();
  }
}
