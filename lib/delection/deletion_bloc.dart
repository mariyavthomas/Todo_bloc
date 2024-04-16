import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todobook/api/apifunction.dart';

part 'deletion_event.dart';
part 'deletion_state.dart';

class DeletionBloc extends Bloc<DeletionEvent, DeletionState> {
 Api api;
 DeletionBloc(this.api) : super(DeletionInitial()) {
    on<TodoDeleteEvent>((event, emit) {
      emit(DeletionInitial());
      api.delete(event.id);
    });
  }
}
