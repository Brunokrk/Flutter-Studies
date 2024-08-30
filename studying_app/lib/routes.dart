import 'package:go_router/go_router.dart';
import 'package:studying_app/views/home/home_page.dart';
import 'package:studying_app/views/page_one/one_page.dart';
import 'package:studying_app/views/page_two/two_page.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home', // opção de navegaçao
      path: '/', // opcao de navegaçao
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      name: 'one_page', // opção de navegaçao
      path: '/one', // opcao de navegaçao
      builder: (context, state) => OnePage(),
    ),
    GoRoute(
      name: 'two_page', // opção de navegaçao
      path: '/two', // opcao de navegaçao
      builder: (context, state) => TwoPage(),
    ),
  ],

);
