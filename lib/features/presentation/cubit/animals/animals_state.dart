part of 'animals_cubit.dart';

@immutable
abstract class AnimalsState extends Equatable {
  const AnimalsState();
}

class AnimalInitial extends AnimalsState {
  @override
  List<Object> get props => [];
}

class AnimalLoading extends AnimalsState {
  @override
  List<Object> get props => [];
}


class AnimalSuccess extends AnimalsState {
  @override
  List<Object> get props => [];
}

class AnimalFailure extends AnimalsState {
  @override
  List<Object> get props => [];
}

class AnimalTypeListLoaded extends AnimalsState {
  final List<AnimalTypeEntity> animalTypes;

  const AnimalTypeListLoaded(this.animalTypes);

  @override
  List<Object> get props => [animalTypes];
}

class AnimalListLoaded extends AnimalsState {
  final List<AnimalEntity> animals;

  const AnimalListLoaded(this.animals);

  @override
  List<Object> get props => [animals];
}
