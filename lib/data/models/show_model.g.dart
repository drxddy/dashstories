// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShowModelAdapter extends TypeAdapter<ShowModel> {
  @override
  final int typeId = 18;

  @override
  ShowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShowModel(
      id: fields[0] as String,
      name: fields[1] as String,
      creator: fields[2] as String,
      createdAt: fields[3] as int,
      description: fields[4] as String,
      genre: fields[5] as String,
      trope: fields[6] as String,
      rating: fields[7] as double,
      state: fields[8] as String,
      updatedAt: fields[9] as int,
      thumbNailUrl: fields[10] as String?,
      category: fields[11] as String,
      editorScore: fields[12] as double,
      createdBy: fields[13] as String,
      userId: fields[14] as String,
      episodes: (fields[15] as List).cast<EpisodeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, ShowModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.creator)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.trope)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.state)
      ..writeByte(9)
      ..write(obj.updatedAt)
      ..writeByte(10)
      ..write(obj.thumbNailUrl)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.editorScore)
      ..writeByte(13)
      ..write(obj.createdBy)
      ..writeByte(14)
      ..write(obj.userId)
      ..writeByte(15)
      ..write(obj.episodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      id: json['id'] as String,
      name: json['name'] as String,
      creator: json['creator'] as String,
      createdAt: (json['createdAt'] as num).toInt(),
      description: json['description'] as String,
      genre: json['genre'] as String,
      trope: json['trope'] as String,
      rating: (json['rating'] as num).toDouble(),
      state: json['state'] as String,
      updatedAt: (json['updatedAt'] as num).toInt(),
      thumbNailUrl: json['thumbNailUrl'] as String?,
      category: json['category'] as String,
      editorScore: (json['editorScore'] as num).toDouble(),
      createdBy: json['createdBy'] as String,
      userId: json['userId'] as String,
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => EpisodeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'creator': instance.creator,
      'createdAt': instance.createdAt,
      'description': instance.description,
      'genre': instance.genre,
      'trope': instance.trope,
      'rating': instance.rating,
      'state': instance.state,
      'updatedAt': instance.updatedAt,
      'thumbNailUrl': instance.thumbNailUrl,
      'category': instance.category,
      'editorScore': instance.editorScore,
      'createdBy': instance.createdBy,
      'userId': instance.userId,
      'episodes': instance.episodes,
    };
