import 'package:dashstories/data/data.dart';
import 'package:dashstories/domain/utils/typedefs.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'episode_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 19)
class EpisodeModel {
  @JsonKey(name: 'id')
  @HiveField(0)
  final String id;

  @JsonKey(name: 'name')
  @HiveField(1)
  final String name;

  @JsonKey(name: 'showId')
  @HiveField(2)
  final String showId;

  @JsonKey(name: 'releaseDate')
  @HiveField(3)
  final int releaseDate;

  @JsonKey(name: 'state')
  @HiveField(4)
  final String state;

  @HiveField(5)
  final List<PanelModel> panels;

  const EpisodeModel(
      {required this.id,
      required this.name,
      required this.showId,
      required this.releaseDate,
      required this.state,
      required this.panels});

  factory EpisodeModel.fromJson(JSON json) => _$EpisodeModelFromJson(json);

  JSON toJson() => _$EpisodeModelToJson(this);

  // copywith
  EpisodeModel copyWith(
      {String? id,
      String? name,
      String? showId,
      int? releaseDate,
      String? state,
      List<PanelModel>? panels}) {
    return EpisodeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        showId: showId ?? this.showId,
        releaseDate: releaseDate ?? this.releaseDate,
        state: state ?? this.state,
        panels: panels ?? this.panels);
  }
}
