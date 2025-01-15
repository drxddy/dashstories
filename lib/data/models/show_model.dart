import 'package:dashstories/data/models/episode_model.dart';
import 'package:dashstories/domain/utils/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 18)
class ShowModel extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String creator;

  @HiveField(3)
  final int createdAt;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String genre;

  @HiveField(6)
  final String trope;

  @HiveField(7)
  final double rating;

  @HiveField(8)
  final String state;

  @HiveField(9)
  final int updatedAt;

  @HiveField(10)
  final String? thumbNailUrl;

  @HiveField(11)
  final String category;

  @HiveField(12)
  final double editorScore;

  @HiveField(13)
  final String createdBy;

  @HiveField(14)
  final String userId;

  @HiveField(15)
  final List<EpisodeModel> episodes;

  const ShowModel({
    required this.id,
    required this.name,
    required this.creator,
    required this.createdAt,
    required this.description,
    required this.genre,
    required this.trope,
    required this.rating,
    required this.state,
    required this.updatedAt,
    this.thumbNailUrl,
    required this.category,
    required this.editorScore,
    required this.createdBy,
    required this.userId,
    required this.episodes,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        creator,
        createdAt,
        description,
        genre,
        trope,
        rating,
        state,
        updatedAt,
        thumbNailUrl,
        category,
        editorScore,
        createdBy,
        userId,
        ...episodes
      ];

  // write a factory method to convert a json object to a ShowModel object
  factory ShowModel.fromJson(JSON json) => _$ShowModelFromJson(json);

  // write a method to convert a ShowModel object to a json object
  JSON toJson() => _$ShowModelToJson(this);

  // update the model with copywith
  ShowModel copyWith({
    String? id,
    String? name,
    String? creator,
    int? createdAt,
    String? description,
    String? genre,
    String? trope,
    double? rating,
    String? state,
    int? updatedAt,
    String? thumbNailUrl,
    String? category,
    double? editorScore,
    String? createdBy,
    String? userId,
    List<EpisodeModel>? episodes,
  }) {
    return ShowModel(
      id: id ?? this.id,
      name: name ?? this.name,
      creator: creator ?? this.creator,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      genre: genre ?? this.genre,
      trope: trope ?? this.trope,
      rating: rating ?? this.rating,
      state: state ?? this.state,
      updatedAt: updatedAt ?? this.updatedAt,
      thumbNailUrl: thumbNailUrl ?? this.thumbNailUrl,
      category: category ?? this.category,
      editorScore: editorScore ?? this.editorScore,
      createdBy: createdBy ?? this.createdBy,
      userId: userId ?? this.userId,
      episodes: episodes ?? this.episodes,
    );
  }
}
