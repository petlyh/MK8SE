import "package:meta/meta.dart";
import "package:mk8se/models/byte_list.dart";

@immutable
sealed class Value {
  final String name;
  final int offset;

  const Value({required this.name, required this.offset});

  /// Returns a copy of this [Value] containing data decoded from [bytes] at [offset].
  Value read(ByteList bytes);

  /// Returns a copy of [bytes] with the encoded data of this [Value] at [offset].
  ByteList write(ByteList bytes);
}

class UnlockableValue extends Value {
  final bool isUnlocked;

  const UnlockableValue(String name, int offset)
      : this._(name: name, offset: offset, isUnlocked: false);

  const UnlockableValue._({
    required super.name,
    required super.offset,
    required this.isUnlocked,
  });

  UnlockableValue withValue(bool value) =>
      UnlockableValue._(name: name, offset: offset, isUnlocked: value);

  @override
  Value read(ByteList bytes) => withValue(bytes.readInt8(offset) > 0x00);

  @override
  ByteList write(ByteList bytes) =>
      bytes.withInt8At(isUnlocked ? 0x03 : 0x00, offset);

  @override
  bool operator ==(Object other) =>
      other is UnlockableValue &&
      name == other.name &&
      offset == other.offset &&
      isUnlocked == other.isUnlocked;

  @override
  int get hashCode => Object.hash(name, offset, isUnlocked);
}

class NumberValue extends Value {
  final int number;

  const NumberValue(String name, int offset)
      : this._(name: name, offset: offset, number: 0);

  const NumberValue._({
    required super.name,
    required super.offset,
    required this.number,
  });

  NumberValue withValue(int value) =>
      NumberValue._(name: name, offset: offset, number: value);

  @override
  Value read(ByteList bytes) => withValue(bytes.readInt32(offset));

  @override
  ByteList write(ByteList bytes) => bytes.withInt32At(number, offset);

  @override
  bool operator ==(Object other) =>
      other is NumberValue &&
      name == other.name &&
      offset == other.offset &&
      number == other.number;

  @override
  int get hashCode => Object.hash(name, offset, number);
}
