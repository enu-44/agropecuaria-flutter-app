class AnimalTypeEntity {
  AnimalTypeEntity(this.id, this.name, this.path, {this.countAnimals = 0});
  final int id;
  final String name;
  final String path;
  int countAnimals;
}

// ignore: constant_identifier_names
final DEFAULT_DATA_ANIMAL_TYPE = <AnimalTypeEntity>[
  AnimalTypeEntity(1, "Bovino", "assets/img/animals/bovino.png"),
  AnimalTypeEntity(2, "Lechero", "assets/img/animals/bovino.webp"),
  AnimalTypeEntity(3, "De Trabajo", "assets/img/animals/detrabajo.webp"),
  AnimalTypeEntity(4, "Pastoreo", "assets/img/animals/pastoreo.jpeg"),
  AnimalTypeEntity(
      5, "Doble Proposito", "assets/img/animals/doble-proposito.jpeg"),
  AnimalTypeEntity(6, "Engorde Rapido", "assets/img/animals/engorde.webp")
];
