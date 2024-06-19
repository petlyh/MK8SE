import "package:crc32_checksum/crc32_checksum.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/foundation.dart";
import "package:mk8se/models/byte_list.dart";
import "package:mk8se/models/savefile.dart";
import "package:mk8se/providers/empty_savefile.dart";
import "package:mk8se/providers/savefile_repository.dart";
import "package:mk8se/providers/values_controller.dart";
import "package:riverpod/riverpod.dart";

final savefileControllerProvider =
    NotifierProvider<SavefileController, Savefile>(SavefileController.new);

class SavefileController extends Notifier<Savefile> {
  static const _checksumOffset = 0x38;
  static const _checksumDataOffset = 0x48;

  @override
  Savefile build() => ref.read(emptySavefileProvider);

  Future<void> load(String path) async =>
      state = await SavefileRepository.read(path);

  void loadBytes(Uint8List bytes) =>
      state = Savefile(ByteList.fromUint8List(bytes));

  Future<void> saveInPlace() async =>
      await SavefileRepository.writeInPlace(_getUpdatedSavefile());

  Future<void> saveTo(String path) async =>
      await SavefileRepository.write(_getUpdatedSavefile(), path);

  void saveWeb() => SavefileRepository.saveWeb(_getUpdatedSavefile());

  /// Downloads the savefile if on web, otherwise saves it in place.
  Future<void> savePlatform() async => kIsWeb ? saveWeb() : await saveInPlace();

  /// Opens a file picker dialog and loads the selected file.
  Future<void> loadFileDialog() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["dat"]);

    if (result != null && result.files.isNotEmpty) {
      return kIsWeb
          ? loadBytes(result.files.first.bytes!)
          : await load(result.paths.first!);
    }
  }

  /// Opens a file picker dialog and writes the file to the selected path.
  Future<void> saveFileDialog() async {
    final filepath = await FilePicker.platform
        .saveFile(type: FileType.custom, allowedExtensions: ["dat"]);

    if (filepath != null) {
      await ref.read(savefileControllerProvider.notifier).saveTo(filepath);
    }
  }

  Savefile _getUpdatedSavefile() {
    final values = ref.read(valuesControllerProvider);
    final bytes = values.write(state.bytes);
    final checksum = _calculateChecksum(bytes);
    final updatedBytes = bytes.withInt32At(checksum, _checksumOffset);
    return state.withBytes(updatedBytes);
  }

  int _calculateChecksum(ByteList bytes) =>
      Crc32.calculate(bytes.toSublist(_checksumDataOffset));
}
