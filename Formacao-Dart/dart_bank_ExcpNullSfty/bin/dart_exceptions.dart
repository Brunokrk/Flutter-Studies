import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety(){
  Account? myAccount;

  //Simulando uma comunicação externa
  Random rng = Random(); 
  int randomNumber = rng.nextInt(10);
  //print(randomNumber);
  if(randomNumber <= 5){
    myAccount = Account(name: "Bruno", balance: 200, isAuthenticated: true);
  }
  //print(myAccount.runtimeType);

  if (myAccount != null){
    print(myAccount.balance);
  }else{
    print('Conta Nula');
  }

  print(myAccount?.balance);
}


void main() {
  
  testingNullSafety();
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 800, isAuthenticated: true));

  // Fazendo transferência
  try{
    bool result = bankController.makeTransfer(idSender: "Kako", idReceiver: "Ricarth", amount: 700);
    // Observando resultado
    if (result){
      print("Transação concluída com sucesso");
    }

  }on SenderIdInvalidException catch(e){
    print("O ID '${e.idSender}' não é um ID válido");
  }on ReceiverIdInvalidException catch(e){
    print("O ID '${e.idReceiver}' não é um ID válido");
  }on SenderNotAuthenticatedException catch(e){
    print("O usuário remetende de ID '${e.idSender}' não está autenticado");
  }on SenderBalanceLowerThanAmountException catch(e){
    print("O usuário de ID '${e.idSender}' tentou enviar ${e.amount} sendo que em sua conta existe ${e.senderBalance}");
  }on Exception{
    print("Algo deu errado");
  }

  //Exceptions
  //functionTwo();
}

void functionOne(){
  try{
    functionTwo();
  } catch(exception, stackTrace){
      print(exception);
      print(stackTrace);
    }
    print("Finished F01");
  }

void functionTwo(){
  print("Started F02");
  for (int i = 1; i<=5; i++){
    print(i);
    double amount = double.parse("Not a number");
  }
}
