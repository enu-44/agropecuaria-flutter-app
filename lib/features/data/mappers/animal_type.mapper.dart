import 'package:agropecuariosapp/features/data/datasources/hive/entities/animal_type_hive.dart';
import 'package:agropecuariosapp/features/domain/entities/animal_type/animal_type.entity.dart';

extension AnimalEntityMapper on AnimalTypeEntity {
  AnimalTypeEntityHive toHive() {
    return AnimalTypeEntityHive(name: name, path: path);
  }
}

extension AnimalEntityHiveMapper on AnimalTypeEntityHive {
  AnimalTypeEntity toEntity() {
    return AnimalTypeEntity(int.parse(key), name, path);
  }
}
