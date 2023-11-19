part of 'animal_type_cubit.dart';

@immutable
abstract class AnimalTypeState extends Equatable {
  const AnimalTypeState();
}

class AnimalTypeInitial extends AnimalTypeState {
  @override
  List<Object> get props => [];
}

class AnimaTypelLoading extends AnimalTypeState {
  @override
  List<Object> get props => [];
}

class AnimalTypeFailure extends AnimalTypeState {
  @override
  List<Object> get props => [];
}

class AnimalTypeListLoaded extends AnimalTypeState {
  final List<AnimalTypeEntity> animalTypes;

  const AnimalTypeListLoaded(this.animalTypes);

  @override
  List<Object> get props => [animalTypes];
}
