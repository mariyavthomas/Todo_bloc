import 'package:flutter/material.dart';
import 'package:todobook/Screen/homescreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todobook/api/apifunction.dart';
import 'package:todobook/delection/deletion_bloc.dart';
import 'package:todobook/edit/editbloc_bloc.dart';
import 'package:todobook/fetch_bloc/bloc_bloc.dart';
import 'package:todobook/post_bloc/post_bloc_bloc.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> BlocBloc(Api())),
        BlocProvider(create: (context)=>PostBlocBloc(Api())),
        BlocProvider(create: (context)=>EditblocBloc(Api())),
        BlocProvider(create: (context)=>DeletionBloc(Api()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:HomeScreen() ,
      ),
    );
  }
}