// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpisodeModelAdapter extends TypeAdapter<EpisodeModel> {
  @override
  final int typeId = 19;

  @override
  EpisodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeModel(
      id: fields[0] as String,
      name: fields[1] as String,
      showId: fields[2] as String,
      releaseDate: fields[3] as int,
      state: fields[4] as String,
      panels: (fields[5] as List).cast<PanelModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.showId)
      ..writeByte(3)
      ..write(obj.releaseDate)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.panels);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      showId: json['showId'] as String,
      releaseDate: (json['releaseDate'] as num).toInt(),
      state: json['state'] as String,
      panels: (json['panels'] as List<dynamic>)
          .map((e) => PanelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'showId': instance.showId,
      'releaseDate': instance.releaseDate,
      'state': instance.state,
      'panels': instance.panels,
    };
