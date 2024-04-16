part of 'deletion_bloc.dart';

sealed class DeletionEvent extends Equatable {
  const DeletionEvent();

  @override
  List<Object> get props => [];
}
class TodoDeleteEvent extends DeletionEvent{
  final String id;
  TodoDeleteEvent({required this.id});
  @override
  List<Object> get props => [];

}