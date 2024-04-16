import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todobook/Screen/homescreen.dart';
import 'package:todobook/api/model.dart';
import 'package:todobook/edit/editbloc_bloc.dart';
import 'package:todobook/post_bloc/post_bloc_bloc.dart';

// ignore: must_be_immutable
class AddNotes extends StatelessWidget {
  AddNotes({super.key, this.todo, required this.isedit, this.model, this.id});
  final Map ? todo;
  bool isedit;
  Modeltodo? model;
  String? id;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController decriptioncontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if (isedit) {
      titlecontroller.text = model!.title!;
      decriptioncontroller.text = model!.description!;
    }
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title:isedit ? Text('Edit') : Text('New Task'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formkey,
        child: Stack(children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: Text('Enter your Task Name'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: titlecontroller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(hintText: 'title'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 310),
                child: Text('Decripation :'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  child: TextFormField(
                    maxLines: 50,
                    controller: decriptioncontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    minLines: 1,
                    decoration: InputDecoration(
                        hintText: 'Decription', border: OutlineInputBorder()),
                  ),
                ),
              ),
            ],
          ),
          isedit?
              // ? Padding(
              //     padding: const EdgeInsets.only(top: 690, left: 350),
              //     child: FloatingActionButton(
              //       backgroundColor: Colors.teal[300],
              //       onPressed: () {
              //         submit(context);
                     
              //       },
              //       child: Icon(Icons.check, size: 30),
              //     ),
              //   )
              Padding(
                padding: const EdgeInsets.only(top: 690, left: 300),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                  onPressed: (){
                 update(context);
                }, child: Text("Edit")),
              )
              : Padding(
                  padding: const EdgeInsets.only(top: 690, left: 350),
                  child: FloatingActionButton(
                    backgroundColor: Colors.teal[300],
                    onPressed: () {
                       
                      submit(context);
                    },
                    child: Icon(Icons.check, size: 30),
                  ),
                )
        ]),
      )),
    );
  }

  void submit(BuildContext context) {
    BlocProvider.of<PostBlocBloc>(context).add(Todoeventpost(
        title: titlecontroller.text, description: decriptioncontroller.text));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  void update(BuildContext context) {
    BlocProvider.of<EditblocBloc>(context).add(TodoeditEvent(
      id: id??'1',
      title: titlecontroller.text,
      description: decriptioncontroller.text,
    ));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
  }
}
