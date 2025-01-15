// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PanelModelAdapter extends TypeAdapter<PanelModel> {
  @override
  final int typeId = 16;

  @override
  PanelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PanelModel(
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      episodeId: fields[2] as String,
      sequence: fields[3] as int,
      metadata: fields[4] as MediaSize,
      createdAt: fields[5] as int,
      updatedAt: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PanelModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.episodeId)
      ..writeByte(3)
      ..write(obj.sequence)
      ..writeByte(4)
      ..write(obj.metadata)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PanelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MediaSizeAdapter extends TypeAdapter<MediaSize> {
  @override
  final int typeId = 17;

  @override
  MediaSize read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MediaSize(
      width: fields[0] as int,
      height: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MediaSize obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.width)
      ..writeByte(1)
      ..write(obj.height);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MediaSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanelModel _$PanelModelFromJson(Map<String, dynamic> json) => PanelModel(
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      episodeId: json['episodeId'] as String,
      sequence: (json['sequence'] as num).toInt(),
      metadata: MediaSize.fromJson(json['metadata'] as Map<String, dynamic>),
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
    );

Map<String, dynamic> _$PanelModelToJson(PanelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'episodeId': instance.episodeId,
      'sequence': instance.sequence,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

MediaSize _$MediaSizeFromJson(Map<String, dynamic> json) => MediaSize(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$MediaSizeToJson(MediaSize instance) => <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
