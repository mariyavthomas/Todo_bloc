part of 'post_bloc_bloc.dart';

@immutable
sealed class PostBlocState  {
  const  PostBlocState();
 List<Object>get propo=>[];
}

 
final class PostBlocInitial extends PostBlocState {}
