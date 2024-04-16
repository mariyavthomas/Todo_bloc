part of 'post_bloc_bloc.dart';

@immutable
sealed class PostBlocEvent {
  PostBlocEvent();
List<Object>get propo=>[];
}

// ignore: must_be_immutable
class Todoeventpost extends PostBlocEvent{
  String  title;
  String description;
  Todoeventpost({required this.title,required this.description});

}