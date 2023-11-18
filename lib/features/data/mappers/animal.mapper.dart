import 'package:agropecuariosapp/features/data/datasources/hive/entities/animal_hive.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/animal.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/create_animal_request.entity.dart';
import 'package:agropecuariosapp/features/domain/entities/animal/request/update_animal_request.entity.dart';

extension CreateAnimalRequestEntityMapper on CreateAnimalRequestEntity {
  AnimalEntityHive toHive() {
    return AnimalEntityHive(
        accountId: accountId,
        animalTypeId: animalTypeId,
        code: code,
        color: color,
        name: name,
        race: race,
        sexo: sexo,
        characteristics: characteristics,
        earringNumber: earringNumber,
        lote: lote,
        photo: photo);
  }
}

extension UpdateAnimalRequestEntityMapper on UpdateAnimalRequestEntity {
  AnimalEntityHive toHive() {
    return AnimalEntityHive(
        accountId: accountId,
        animalTypeId: animalTypeId,
        code: code,
        color: color,
        name: name,
        race: race,
        sexo: sexo,
        characteristics: characteristics,
        earringNumber: earringNumber,
        lote: lote,
        photo: photo);
  }
}

extension AnimalEntityHiveMapper on AnimalEntityHive {
  AnimalEntity toEntity() {
    return AnimalEntity(
        id: key,
        accountId: accountId,
        animalTypeId: animalTypeId,
        code: code,
        color: color,
        name: name,
        race: race,
        sexo: sexo,
        characteristics: characteristics,
        earringNumber: earringNumber,
        lote: lote,
        bytesPhoto: photo,
        createdDate: createdDate);
  }
}
