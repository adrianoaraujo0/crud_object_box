import 'package:crud_object_box/model/tarefa.dart';
import 'package:crud_object_box/ui/lista_tarefas_controller.dart';
import 'package:flutter/material.dart';

class ListaTarefasPage extends StatefulWidget {
  ListaTarefasPage({super.key});

  @override
  State<ListaTarefasPage> createState() => _ListaTarefasPageState();
}

class _ListaTarefasPageState extends State<ListaTarefasPage> {
  ListaTarefasController listaTarefasController = ListaTarefasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agenda de contatos')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children:  [
              textField(),
              const SizedBox(height: 20),
              containerTarefas(context)
            ]
          ),
        ),
      ),
    );
  }

  Widget textField(){
    return TextField(
      controller: listaTarefasController.controllerTextField,
      decoration: InputDecoration(
        hintText: "Insira sua tarefa",
        suffixIcon: IconButton(
          icon: const Icon(Icons.add, color: Colors.black),
          onPressed: () {
            setState(() => listaTarefasController.salvaTarefa(Tarefa(nome: listaTarefasController.controllerTextField.text)));
          }),
        border: const OutlineInputBorder()
      ),
    );
  }

  Widget containerTarefas(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.maxFinite,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) ,border: Border.all(color: Colors.black)),
      child: listViewTarefas(),
    );
  }

  Widget listViewTarefas(){
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listaTarefasController.encontrarTarefa().length,
      itemBuilder: (context, index) {
        return inkWellTarefa(index);
      },
    );
  }

  Widget inkWellTarefa(int index){
    return InkWell(
      onLongPress: () => setState(() => listaTarefasController.deletarTarefa( listaTarefasController.encontrarTarefa()[index])),
      child: tarefa(index),
    );
  }

  Widget tarefa(int index){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, color: Colors.grey[400]),
              const SizedBox(width: 10),
              Expanded(child: Text(listaTarefasController.encontrarTarefa()[index].nome, style: const TextStyle(fontSize: 25))),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red[400],
                onPressed: () => setState(() => listaTarefasController.deletarTarefa( listaTarefasController.encontrarTarefa()[index]))
              ),

            ],
          ),
          const SizedBox(height: 5),
          Container(width: double.maxFinite, height: 1, color: Colors.grey)
        ],
      ),
    );
  }
}