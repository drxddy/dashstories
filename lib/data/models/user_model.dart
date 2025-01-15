import 'package:dashstories/domain/utils/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 20)
@JsonSerializable()
class UserDataModel extends Equatable {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  @JsonKey(name: 'photoURL')
  final String photoUrl;

  const UserDataModel({
    required this.userId,
    required this.userName,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [userId, userName, photoUrl];

  factory UserDataModel.fromJson(JSON json) => _$UserDataModelFromJson(json);

  JSON toJson() => _$UserDataModelToJson(this);
}
