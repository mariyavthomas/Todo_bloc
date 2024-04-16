import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todobook/api/apifunction.dart';

part 'editbloc_event.dart';
part 'editbloc_state.dart';

class EditblocBloc extends Bloc<EditblocEvent, EditblocState> {
  Api api;
  EditblocBloc(this.api) : super(EditblocInitial()) {
    on<TodoeditEvent>((event, emit)async {
      api.updateapi( event.id, event.title, event.description,);
    });
  }
}
