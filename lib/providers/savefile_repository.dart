import "dart:io";

import "package:flutter/services.dart";
import "package:mk8se/models/byte_list.dart";
import "package:mk8se/models/savefile.dart";
import "package:universal_html/html.dart" show AnchorElement;

final class SavefileRepository {
  const SavefileRepository._();

  static Future<Savefile> read(String path) async {
    final bytes = await File(path).readAsBytes();
    final byteList = ByteList.fromUint8List(bytes);
    _validateSavedata(byteList);
    return Savefile(byteList, path: path);
  }

  static Future<Savefile> readAsset(String key) async {
    final byteData = await rootBundle.load(key);
    final byteList = ByteList.fromByteData(byteData);
    _validateSavedata(byteList);
    return Savefile(byteList);
  }

  static Future<void> write(Savefile savefile, String path) async {
    await File(path).writeAsBytes(savefile.uint8List);
  }

  static Future<void> writeInPlace(Savefile savefile) async {
    if (savefile.path == null) {
      throw ArgumentError(
        "The provided savefile cannot be written to in-place because it doesn't have a path associated with it",
      );
    }

    return await write(savefile, savefile.path!);
  }

  static void saveWeb(Savefile savefile) => AnchorElement(href: savefile.url)
    ..download = "userdata.dat"
    ..style.display = "none"
    ..click();
}

void _validateSavedata(ByteList byteList) {
  const magicNumber = 0x43545553;
  const deluxeMagicNumber = 0x53555443;

  if (byteList.isEmpty || byteList.length < 4) {
    throw ArgumentError("File is empty");
  }

  final magicBytes = byteList.readInt32(0x00);

  if (magicBytes != magicNumber) {
    if (magicBytes == deluxeMagicNumber) {
      throw ArgumentError("File is a Mario Kart 8 Deluxe save file");
    }

    throw ArgumentError("File is not a Mario Kart 8 save file");
  }
}
