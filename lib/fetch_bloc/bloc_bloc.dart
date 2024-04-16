import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todobook/api/apifunction.dart';
import 'package:todobook/api/model.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  Api api ;
  BlocBloc( this.api) : super(BlocInitial()) {
    on<BlocEvent>((event, emit) async{
      emit (Todobookloading());
      try{
        final todo= await api.fetchdata();
        emit(Todobookloaded(todolist: todo));

      }catch(e){
        emit(Todobookerror(error: e.toString()));
      }
      
    });
  }
}
