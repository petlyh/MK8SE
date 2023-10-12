part of "models.dart";

class FileData {
  static const magicNumber = 0x43545553;
  static const deluxeMagicNumber = 0x53555443;

  bool get isMagicValid => readInt(0x00, 4) == magicNumber;
  bool get isDeluxeSave => readInt(0x00, 4) == deluxeMagicNumber;

  static const checksumOffset = NumberOffset(0x38);
  static const checksumDataStart = 0x48;

  static late FileData emptyFile;

  static Future<void> initEmpty() async {
    final bytes = await rootBundle.load("assets/userdata-empty.dat");
    final data = Uint8List.view(bytes.buffer);
    emptyFile = FileData(data);
  }

  Uint8List _data;
  ByteData get byteData => _data.buffer.asByteData();

  final String path;
  bool get isSaveableInPlace => path.isNotEmpty;

  FileData(this._data, [this.path = ""]);

  static Future<FileData> fromFile(String filepath) async {
    final bytes = await File(filepath).readAsBytes();
    return fromBytes(bytes, filepath);
  }

  static FileData fromBytes(Uint8List bytes, [String filepath = ""]) {
    final fileData = FileData(bytes, filepath);

    if (bytes.isEmpty) {
      throw ArgumentError("File is empty");
    }

    if (!fileData.isMagicValid) {
      if (fileData.isDeluxeSave) {
        throw ArgumentError("File is a Mario Kart 8 Deluxe save file");
      }

      throw ArgumentError("File is not a Mario Kart 8 save file");
    }

    return fileData;
  }

  Future<void> toFile(String filepath) async {
    _writeChecksum();
    await File(filepath).writeAsBytes(_data);
  }

  void downloadWeb() {
    _writeChecksum();
    AnchorElement()
      ..href = Uri.dataFromBytes(_data, mimeType: "application/octet-stream")
          .toString()
      ..download = "userdata.dat"
      ..style.display = "none"
      ..click();
  }

  Future<void> toFileInPlace() async {
    if (path.isEmpty) {
      throw StateError(
          "Data cannot be saved in place because it wasn't opened from a file");
    }

    await toFile(path);
  }

  int readInt(int offset, int byteCount) {
    return switch (byteCount) {
      1 => byteData.getUint8(offset),
      2 => byteData.getUint16(offset, Endian.big),
      4 => byteData.getUint32(offset, Endian.big),
      _ => throw ArgumentError(
          "byteCount argument has an illegal value: $byteCount"),
    };
  }

  void writeInt(int offset, int byteCount, int value) {
    final writeBytes = switch (byteCount) {
      1 => Uint8List(1)..buffer.asByteData().setInt8(0, value),
      2 => Uint8List(2)..buffer.asByteData().setInt16(0, value, Endian.big),
      4 => Uint8List(4)..buffer.asByteData().setInt32(0, value, Endian.big),
      _ => throw ArgumentError(
          "byteCount argument has an illegal value: $byteCount"),
    };

    final list = _data.toList();
    list.replaceRange(offset, offset + byteCount, writeBytes);
    _data = Uint8List.fromList(list);
  }

  T readOffset<T>(Offset<T> offset) => offset.read(this);
  void writeOffset<T>(Offset<T> offset, T value) => offset.write(this, value);

  /// Calculates and writes the save file checksum.
  void _writeChecksum() {
    final checksum = Crc32.calculate(_data.sublist(checksumDataStart));
    writeOffset(checksumOffset, checksum);
  }
}
