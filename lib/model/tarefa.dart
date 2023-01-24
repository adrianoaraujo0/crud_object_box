import 'package:objectbox/objectbox.dart';

@Entity()
class Tarefa{

  @Id()
  int? id;
  
  String nome;

  Tarefa({required this.nome});

}