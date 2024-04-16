part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}
class Todobookloading extends BlocState{


  List<Object>get propo=>[];

  

}
// ignore: must_be_immutable
class Todobookloaded extends BlocState{
  List<Modeltodo>todolist=[];
  Todobookloaded({required this.todolist});


List<Object> get propo=>[todolist];

}
// ignore: must_be_immutable
class Todobookerror extends BlocState{
  String ? error;
  Todobookerror ({this.error});
// ignore: override_on_non_overriding_member
@override
  List<Object> get propo=>[error!];
}