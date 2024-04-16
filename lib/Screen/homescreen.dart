import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todobook/Screen/addnotes.dart';
import 'package:todobook/api/apifunction.dart';
import 'package:todobook/api/model.dart';
import 'package:todobook/delection/deletion_bloc.dart';
import 'package:todobook/fetch_bloc/bloc_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: BlocProvider(
        create: (context) => BlocBloc(Api())..add(Todobookevents()),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Notes',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.overline,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<BlocBloc>().add(Todobookevents());
                },
                child: Visibility(
                  visible: isloading,
                  child: Center(
                    child: Text('Nothing'),
                  ),
                  replacement: BlocBuilder<BlocBloc, BlocState>(
                    builder: (context, state) {
                      if (state is Todobookloading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is Todobookloaded) {
                        List<Modeltodo> list = state.todolist;
                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SingleChildScrollView(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.teal[400],
                                    borderRadius: BorderRadius.circular(10)),
                                height: 100, // Set the height as needed
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${list[index].title}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                '${list[index].description}',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                           PopupMenuButton(
                                    onSelected: (value){
                                      if(value=='Edit'){
                                        navigateToEdit(context,list[index].sId.toString(),list[index]);
                                      }
                                      else if(value=='Delete'){
                                      
                                       context.read<DeletionBloc>().add(TodoDeleteEvent(id:list[index].sId.toString()));
                                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),),(route) => false,);
                                      }
          
                                    },
                                    itemBuilder: (context){
                                    return [
                                      PopupMenuItem(child: Text("Edit"),value: 'Edit',),
                                      PopupMenuItem(child: Text("Delete"),value: 'Delete',),
                                    ];
                                  }),
                                
                              
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return SizedBox(); // Add a default return value
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[100],
        onPressed: () {
          navigate(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> navigate(context) async {
    final route = MaterialPageRoute(
        builder: (context) => AddNotes(
              isedit: false,
            ));
    await Navigator.push(context, route);
  }
   Future<void> navigateToEdit(context,String id, Modeltodo model)async{
    final route = MaterialPageRoute(builder: (context) => AddNotes(id: id,model: model,isedit: true),);
    await Navigator.push(context, route);
  }

}
