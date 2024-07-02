import 'package:about_me_project/data/dataSecs.dart';
import 'package:about_me_project/widgets/about_section.dart';
import 'package:about_me_project/widgets/certification_card.dart';
import 'package:about_me_project/widgets/explore_drawer.dart';
import 'package:about_me_project/widgets/footer.dart';
import 'package:about_me_project/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home_View extends StatelessWidget {
  const Home_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Header(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
                "https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2-free/128/social-instagram-new-circle-512.png",
                height: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/LinkedIn_icon_circle.svg/2048px-LinkedIn_icon_circle.svg.png",
              height: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
                "https://icones.pro/wp-content/uploads/2021/06/icone-github-violet.png",
                height: 30),
          ),
        ],
      ),
      drawer: ExploreDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              //caso diminua a tela, o ideal seria aumentar o tamanho do body, e posicionar a foto acima do Home_Text
              height: 700,
              color: Colors.black87,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Image.asset('assets/images/Nome.png'),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    child: ClipOval(
                      child: Image.asset('assets/images/perfil.jpeg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return AboutSection(model: allSections[index]);
              },
              childCount: allSections.length,
            ),
          ),
          SliverToBoxAdapter(child: Footer()),
        ],
      ),
    );
  }

  List<CertificationCard> carouselItems() {
    List<CertificationCard> list = [];
    for (var cardModel in allCertifications) {
      list.add(CertificationCard(model: cardModel));
    }
    return list;
  }
}
