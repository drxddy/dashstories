// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortModelAdapter extends TypeAdapter<ShortModel> {
  @override
  final int typeId = 21;

  @override
  ShortModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortModel(
      show: fields[0] as ShowModel,
      userData: fields[1] as UserDataModel,
    );
  }

  @override
  void write(BinaryWriter writer, ShortModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.show)
      ..writeByte(1)
      ..write(obj.userData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortModel _$ShortModelFromJson(Map<String, dynamic> json) => ShortModel(
      show: ShowModel.fromJson(json['show'] as Map<String, dynamic>),
      userData:
          UserDataModel.fromJson(json['userData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShortModelToJson(ShortModel instance) =>
    <String, dynamic>{
      'show': instance.show,
      'userData': instance.userData,
    };
