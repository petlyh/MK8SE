part of "models.dart";

class OffsetValueHolder<T> {
  final Offset<T> offset;
  T value;

  OffsetValueHolder(this.offset, this.value);

  static OffsetValueHolder<bool> unlockable(int offset) =>
      OffsetValueHolder(UnlockableOffset(offset), false);

  static OffsetValueHolder<int> number(int offset) =>
      OffsetValueHolder(NumberOffset(offset), 0);

  void read(FileData data) => value = data.readOffset(offset);
  void write(FileData data) => data.writeOffset(offset, value);
}
