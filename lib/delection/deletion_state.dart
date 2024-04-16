part of 'deletion_bloc.dart';

sealed class DeletionState extends Equatable {
  const DeletionState();
  
  @override
  List<Object> get props => [];
}

final class DeletionInitial extends DeletionState {}
