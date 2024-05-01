
import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().kakoBotStream(1,10);
  var subscriber = myStream.listen((event){
    print('                        Kakobot está ativo a $event segundos');
  }, onDone: (){
    print('KakoBot está finalizando seu trabalho, realize a última pergunta');
    a = false;
  }
  );

  print('-- Iniciando o KakoBOT, aguarde.. --');
  await BotClock().clock(2);
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      await BotClock().clock(2);
      TimeQuestions(usuario).timeQuestion();
    } else if (usuario.contains('música') ||
               usuario.contains('Música') ||
               usuario.contains('musica') ||
               usuario.contains('Musica')) {
      await myFutureMusic().then((value) => print(value));
    } else if (GoodManners(usuario).isThisManners()){
      GoodManners(usuario).goodManners();
    }else {
      await BotClock().clock(2);
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}


Future myFutureMusic() async{
  try{
    print('On a dark desert highway');
    await BotClock().clock(1);
    print('Cool wind in my hair');
    await BotClock().clock(1);
    print('Warm smell of colitas');
    await BotClock().clock(1);
    print('Rising up through the air');
    await BotClock().clock(1);
    print('Up ahead, in the distance');
    await BotClock().clock(1);
    print('I saw a shimmering light');
    await BotClock().clock(1);
    print('My head grew heavy and my sight grew dim');
    await BotClock().clock(1);
    print('I had to stop for the night');
    return "Hotel California - Eagles";
  }catch(e){
    return "O cantor Esqueceu a letra!";
  }finally{
    print("Música Finalizada!");
  }

}