import "dart:typed_data";

import "package:mk8se/models/byte_list.dart";

class Savefile {
  final ByteList bytes;
  final String? path;

  const Savefile(this.bytes, {this.path});

  bool get isSaveableInPlace => path != null;

  Uint8List get uint8List => bytes.toUint8List();

  String get url => Uri.dataFromBytes(bytes.toList()).toString();

  Savefile withBytes(ByteList newBytes) => Savefile(newBytes, path: path);

  @override
  bool operator ==(Object other) =>
      other is Savefile &&
      runtimeType == other.runtimeType &&
      bytes == other.bytes &&
      path == other.path;

  @override
  int get hashCode => Object.hash(runtimeType, bytes, path);
}
