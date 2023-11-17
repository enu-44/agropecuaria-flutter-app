part of 'edit_cubit.dart';

@immutable
abstract class TaskEditState extends Equatable {
  const TaskEditState();
}

class TaskEditInitial extends TaskEditState {
  @override
  List<Object> get props => [];
}

class TaskEditLoading extends TaskEditState {
  @override
  List<Object> get props => [];
}


class TaskEdituccess extends TaskEditState {
  @override
  List<Object> get props => [];
}


class TaskEditFailure extends TaskEditState {
  @override
  List<Object> get props => [];
}
