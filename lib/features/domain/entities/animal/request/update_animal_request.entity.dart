class UpdateAnimalRequestEntity {
  UpdateAnimalRequestEntity(
      {required this.id,
      required this.accountId,
      required this.animalTypeId,
      required this.name,
      required this.code,
      required this.sexo,
      required this.race,
      required this.color,
      this.earringNumber,
      this.lote,
      this.characteristics});
  final String id;
  final String accountId;
  final String animalTypeId;
  final String name;
  final String code;
  final String sexo;
  final String race;
  final String color;
  final String? earringNumber;
  final String? lote;
  final String? characteristics;
}