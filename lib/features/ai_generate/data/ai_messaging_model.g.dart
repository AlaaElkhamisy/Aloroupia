// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_messaging_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AiMessagingModelAdapter extends TypeAdapter<AiMessagingModel> {
  @override
  final int typeId = 0;

  @override
  AiMessagingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AiMessagingModel(
      prompt: fields[0] as String,
      generatedImage: fields[1] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, AiMessagingModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.prompt)
      ..writeByte(1)
      ..write(obj.generatedImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AiMessagingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
