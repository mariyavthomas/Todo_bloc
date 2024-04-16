import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todobook/api/apifunction.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  Api api;
  PostBlocBloc( this.api) : super(PostBlocInitial()) {
    on<Todoeventpost>((event, emit) async{
      print(event.title);
      api.createdata(event.title, event.description);
    });
  }
}
