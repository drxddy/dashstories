import 'package:dashstories/domain/utils/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'panel_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 16)
class PanelModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final String episodeId;
  @HiveField(3)
  final int sequence;
  @HiveField(4)
  final MediaSize metadata;
  @HiveField(5)
  final int createdAt;
  @HiveField(6)
  final int updatedAt;

  const PanelModel({
    required this.id,
    required this.imageUrl,
    required this.episodeId,
    required this.sequence,
    required this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PanelModel.fromJson(JSON json) => _$PanelModelFromJson(json);

  JSON toJson() => _$PanelModelToJson(this);

  @override
  List<Object?> get props =>
      [id, imageUrl, episodeId, sequence, metadata, createdAt, updatedAt];

  PanelModel copyWith({
    String? id,
    String? imageUrl,
    String? episodeId,
    int? sequence,
    MediaSize? metadata,
    int? createdAt,
    int? updatedAt,
  }) {
    return PanelModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      episodeId: episodeId ?? this.episodeId,
      sequence: sequence ?? this.sequence,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

@HiveType(typeId: 17)
@JsonSerializable()
class MediaSize extends Equatable {
  @HiveField(0)
  final int width;
  @HiveField(1)
  final int height;

  const MediaSize({
    required this.width,
    required this.height,
  });

  factory MediaSize.fromJson(JSON json) => _$MediaSizeFromJson(json);

  JSON toJson() => _$MediaSizeToJson(this);

  @override
  List<Object?> get props => [width, height];
}
