import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:state_management/main.dart' as app;
import 'package:provider/provider.dart';
import 'package:state_management/models/clients.dart';
import 'package:state_management/models/types.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); //garante que vai rodar o emulador

  testWidgets('Integration Test', (tester)async{

    final providerKey = GlobalKey();
    app.main(list:[], providerKey: providerKey);

    await tester.pumpAndSettle();
    //testando tela inicial
    expect(find.text('Clientes'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);

    //testando drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Gerenciar clientes'), findsOneWidget);
    expect(find.text('Tipos de clientes'), findsOneWidget);
    expect(find.text('Sair'), findsOneWidget);

    //testando navegação e tela de tipos
    await tester.tap(find.text('Tipos de clientes'));
    await tester.pumpAndSettle();
    expect(find.text('Tipos de cliente'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(find.text('Platinum'), findsOneWidget);
    expect(find.text('Golden'), findsOneWidget);
    expect(find.text('Titanium'), findsOneWidget);
    expect(find.text('Diamond'), findsOneWidget);

    //Testar a criação de um novo cliente
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'Ferro');

    await tester.tap(find.text('Selecionar icone'));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.card_giftcard));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();
    expect(find.text('Ferro'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(Provider.of<Types>(providerKey.currentContext!, listen: false).types.last.name, 'Ferro');
    expect(Provider.of<Types>(providerKey.currentContext!, listen: false).types.last.icon, Icons.card_giftcard);

    //Testando novo Cliente
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Gerenciar clientes'));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('NameKey1')), 'DandaraBot');
    await tester.enterText(find.byKey(Key('EmailKey1')), 'Dandara@bot.com.br');
    await tester.tap(find.byIcon(Icons.arrow_downward));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ferro').last);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Salvar'));
    await tester.pumpAndSettle();

    //Verificanto se o Cliente apareceu devidamente
    expect(find.text('DandaraBot (Ferro)'), findsOneWidget);
    expect(find.byIcon(Icons.card_giftcard), findsOneWidget);

    expect(Provider.of<Clients>(providerKey.currentContext!, listen: false).clients.last.name, 'DandaraBot');
    expect(Provider.of<Clients>(providerKey.currentContext!, listen: false).clients.last.email, 'Dandara@bot.com.br');

  });

}