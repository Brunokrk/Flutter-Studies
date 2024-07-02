import 'dart:ui';

import 'package:about_me_project/widgets/formacao_card.dart';
import 'package:flutter/material.dart';

import '../model/aboutSections.dart';
import '../model/certification.dart';

List<AboutSections> allSections = <AboutSections>[
  AboutSections(
      title: "Sobre",
      bodyText:
          'Como estudante de Bacharelado em Ciência da Computação pela renomada '
          'Universidade do Estado de Santa Catarina (UDESC), encontro-me atualmente em busca de '
          'oportunidades no mercado de trabalho, almejando uma posição como desenvolvedor. '
          'Este site foi criado com o intuito de proporcionar um acesso facilitado ao meu currículo, '
          'destacando as habilidades e projetos dos quais participei durante minha jornada acadêmica, '
          'experiências profissionais anteriores, cursos e certificações adquiridos, além de quaisquer '
          'outros assuntos que eu deseje compartilhar.',
      color: Colors.white,
      textColor: Colors.black),
  AboutSections(
      title: "Experiências Profissionais",
      bodyText: 'No contexto de uma equipe focada no mercado '
          'internacional, desempenhei um papel significativo na customização e  criação '
          'de softwares para atender às necessidades específicas de  clientes corporativos '
          'para o mercado internacional. Como o principal  desenvolvedor da equipe no contexto '
          'de tecnologias Web, atuei em um  projeto de grande envergadura voltado para a '
          'modernização tecnológica,  que consistiu na transformação de programas desktop '
          'tradicionais em  aplicações web sofisticadas e adaptadas para o mercado internacional. '
          'Durante esse período, aprimorei substancialmente minhas habilidades no  uso dos '
          'frameworks Angular, AngularJS e PO-UI aplicando linguagens de  programação como '
          'TypeScript, HTML, Progress para desenvolver soluções robustas e  eficientes.',
      color: Color.fromRGBO(123, 123, 123, 0.7),
      textColor: Colors.white,
      subtitle:
          "TOTVS S.A - Estagiário em Desenvolvimento de Software - nov/2021 até jul/2023"),
  AboutSections(
      title: 'Formação',
      color: Colors.white,
      textColor: Colors.black,
      formCard: FormacaoCard()),
  AboutSections(
      title: "Alguns Certificados",
      color: Color.fromRGBO(123, 123, 123, 0.7),
      textColor: Colors.white,
      isCerts: true),
  AboutSections(
      title: "Projetos",
      bodyText:
      'Durante minha trajetória em vida acadêmica e trabalho, realizei diversos projetos com objetivo '
          'de estudo, passando por diversas linguagens e frameworks diferentes. Sempre tive o hábito '
          'de versionar meus projetos, então está tudo disponível em meu perfil do github. Iniciei meus estudos em '
          'programação com a tradicional linguagem C, que me forneceu uma base muito boa de lógica e estruturas de dados complexas, '
          'passei por Java aprendendo o paradigma orientado a objetos, com projetos simples usando "java swing" integrado com postgreSQL '
          'e MongoDB, também utilizei bastante python durante a graduação em diversas aplicações diferentes, que vão desde um jogo '
          ' estilo "space invaders" até aplicações com interface web de computação evolutiva para solucão de problemas de otimização '
          'passando por webapps utilizando django e aplicações de processamento de imagens explorando bibliotecas como openCV. '
          'Explorei também o paradigma funcional com a linguagem Haskell resolvendo alguns problemas clássicos de computação, explorei o '
          'paradigma reativo orientado a eventos utilizando o Framework Angular desenvolvendo algumas aplicações web, que acabaram'
          ' me rendendo um ótimo estágio. E mais recentemente, venho me aventurando pelo mundo do desenvolvimento mobile multiplataforma '
          'utilizando o framework Flutter, mas com planos de não se limitar apenas a este framework. Com Flutter alguns projetos foram '
          'feitos, uma lista de tarefas com gameficação, utilizada para dar início aos estudos, logo depois um aplicativo de diário e um '
          'de receitas pessoais, ambos utilizados para estudar como o Flutter lida com requisições para webAPIs,'
          ' um app de lista de compras também foi desenvolvido, estudando a integração de aplicativos com o Google Firebase, algumas interfaces '
          'como a tela de um banco e um app de delivery foram desenvolvidas para treinar a construção de telas, e um projeto privado de um '
          'gerenciador de treinos de academia utilizando MobX e Firebase está em desenvolvimento! Tudo é possível ser encontrado em meu GitHub, e estou disponível para conversar sobre!',
      color: Colors.white,
      textColor: Colors.black),
];

List<Certification> allCertifications = <Certification>[
  Certification(
      formName: 'Formação Python para Data Science - Alura',
      imagePath: 'assets/images/habilities/python_lang.png',
      data: '01/10/2021',
      nameColor: Color.fromRGBO(255, 186, 5, 1.0)),
  Certification(
      formName: 'Angular: boas práticas em arquiteturas e formulários - Alura',
      imagePath: 'assets/images/angular.png',
      data: '07/12/2021',
      nameColor: Colors.red),
  Certification(
      formName: 'Angular: controle o fluxo de navegação - Alura',
      imagePath: 'assets/images/angular.png',
      data: '08/12/2021',
      nameColor: Colors.red),
  Certification(
      formName: 'Formação Angular - Alura',
      imagePath: 'assets/images/angular.png',
      data: '21/12/2021',
      nameColor: Colors.red),
  Certification(
      formName: 'Projeto em Dart, a linguagem do Flutter - Alura',
      imagePath: 'assets/images/habilities/flutter.png',
      data: '24/01/2024',
      nameColor: Colors.blue),
  Certification(
      formName: 'Desenvolva seu Primeiro App com Flutter - Alura',
      imagePath: 'assets/images/habilities/flutter.png',
      data: '03/05/2024',
      nameColor: Colors.blue),
];
