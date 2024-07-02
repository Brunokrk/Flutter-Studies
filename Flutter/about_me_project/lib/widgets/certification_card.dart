import 'package:about_me_project/model/certification.dart';
import 'package:flutter/material.dart';

class CertificationCard extends StatelessWidget {
  const CertificationCard({super.key, required this.model});

  final Certification model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:50.0, bottom: 20),
              child: Image.asset(
                model.imagePath,width: 90,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SelectableText(model.formName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: model.nameColor,
                      ),
                  textAlign: TextAlign.center),
            ),
            SelectableText(
              model.data,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
