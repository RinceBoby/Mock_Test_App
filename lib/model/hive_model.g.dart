// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestNameModelAdapter extends TypeAdapter<TestNameModel> {
  @override
  final int typeId = 0;

  @override
  TestNameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestNameModel(
      testName: fields[0] as String,
      createdOn: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TestNameModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.testName)
      ..writeByte(1)
      ..write(obj.createdOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestNameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
