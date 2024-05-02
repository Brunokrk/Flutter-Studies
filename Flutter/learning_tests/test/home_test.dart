import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'bank_http.mocks.dart';

void main() {
  late MockBankHttp httpMock;

  setUp(() {
    httpMock = MockBankHttp();
  });

  testWidgets("My widget has a text 'Spent'", (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async=> ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:httpMock.dolarToReal()),
      ),
    ));
    final spentFinder = find.text('Spent');
    expect(spentFinder, findsOneWidget);
  });

  testWidgets("Finds the linear Progression Bar", (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async=> ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:httpMock.dolarToReal()),
      ),
    ));
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets("Finds the AccountStatus", (tester) async {
    when(httpMock.dolarToReal()).thenAnswer((_) async=> ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:httpMock.dolarToReal()),
      ),
    ));
    expect(find.byKey(Key('testKey')), findsOneWidget);
  });

  testWidgets('Find 5 BoxCards', (tester) async{
    when(httpMock.dolarToReal()).thenAnswer((_) async=> ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:httpMock.dolarToReal()),
      ),
    ));
    expect(find.byWidgetPredicate((widget)  {
      if(widget is BoxCard){
        return true;
      }else{
        return false;
      }
    }), findsNWidgets(5));
  });

  testWidgets('When tap deposit should upload earned in 10 points', (tester) async{

    when(httpMock.dolarToReal()).thenAnswer((_) async=> ('5'));
    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:httpMock.dolarToReal()),
      ),
    ));

    await tester.tap(find.text('Deposit'));
    await tester.tap(find.text('Earned'));
    await tester.pumpAndSettle(); //atualiza a tela
    expect(find.text('\$10.0'), findsOneWidget);


  });

  testWidgets('Testing MockHttp dolartoReal', (tester)async{

    when(httpMock.dolarToReal()).thenAnswer((_) async=> ('5'));

    await tester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:httpMock.dolarToReal()),
      ),
    ));

    verify(httpMock.dolarToReal()).called(1);

  });

}
