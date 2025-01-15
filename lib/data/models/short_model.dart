import 'package:dashstories/data/data.dart';
import 'package:dashstories/data/models/user_model.dart';
import 'package:dashstories/domain/services/kv_storage_base.dart';
import 'package:dashstories/domain/utils/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'short_model.g.dart';

@HiveType(typeId: 21)
@JsonSerializable()
class ShortModel extends Equatable {
  @HiveField(0)
  final ShowModel show;
  @HiveField(1)
  final UserDataModel userData;

  const ShortModel({required this.show, required this.userData});

  @override
  List<Object?> get props => [show, userData];

  factory ShortModel.fromJson(JSON json) => _$ShortModelFromJson(json);

  JSON toJson() => _$ShortModelToJson(this);

  void saveCurrentPosition(double scrollPosition) {
    // Save the current scroll position
    KeyValueStorageBase.setScrollPosition(show.id, scrollPosition);
  }

  double getCurrentPosition() {
    return KeyValueStorageBase.getScrollPosition(show.id) ?? 0.0;
  }
}
