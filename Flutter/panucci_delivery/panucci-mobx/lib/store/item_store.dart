import 'package:mobx/mobx.dart';

part 'item_store.g.dart';  //gerador de arquivos

class ItemStore = _ItemStore with _$ItemStore;  //Classe privada

abstract class _ItemStore with Store {

  @observable
  int valorContador = 0;

  @action
  void adicionaItem(){
    valorContador++;
  }

  @action
  void removerItem(){
    valorContador--;
  }

}