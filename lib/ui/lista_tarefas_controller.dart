import 'package:crud_object_box/database/objectbox_database.dart';
import 'package:crud_object_box/model/tarefa.dart';
import 'package:crud_object_box/ui/lista_tarefas_repository.dart';
import 'package:flutter/cupertino.dart';

class ListaTarefasController{

  ListaTarefasRepository listaTarefasRepository = ListaTarefasRepository();
  TextEditingController controllerTextField = TextEditingController();

  void salvaTarefa(Tarefa tarefa){
    ObjectBoxDatabase.tarefaBox.put(tarefa);
    controllerTextField.clear();
  }

  void deletarTarefa(Tarefa tarefa){
    ObjectBoxDatabase.tarefaBox.remove(tarefa.id!);
  }

  List<Tarefa> encontrarTarefa(){
    return ObjectBoxDatabase.tarefaBox.getAll();
  }

}