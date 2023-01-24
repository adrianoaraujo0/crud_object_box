import 'package:crud_object_box/database/objectbox_database.dart';
import 'package:crud_object_box/model/tarefa.dart';

class ListaTarefasRepository{

  void adicionarNoBanco(Tarefa tarefa){
    ObjectBoxDatabase.tarefaBox.put(tarefa);
  }

}