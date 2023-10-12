part of "models.dart";

abstract class Offset<T> {
  /// the offset at which the data is located
  final int offset;

  const Offset(this.offset);

  T read(FileData fileData);
  void write(FileData fileData, T value);
}

class NumberOffset extends Offset<int> {
  const NumberOffset(super.offset);

  @override
  int read(FileData fileData) => fileData.readInt(offset, 4);

  @override
  void write(FileData fileData, int value) =>
      fileData.writeInt(offset, 4, value);
}

class UnlockableOffset extends Offset<bool> {
  const UnlockableOffset(super.offset);

  @override
  bool read(FileData fileData) => fileData.readInt(offset, 1) > 0;

  @override
  void write(FileData fileData, bool value) =>
      fileData.writeInt(offset, 1, value ? 3 : 0);
}
