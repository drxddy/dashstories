// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataModelAdapter extends TypeAdapter<UserDataModel> {
  @override
  final int typeId = 20;

  @override
  UserDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataModel(
      userId: fields[0] as String,
      userName: fields[1] as String,
      photoUrl: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      photoUrl: json['photoURL'] as String,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'photoURL': instance.photoUrl,
    };
