import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/models/models.dart";
import "package:mk8se/providers/values.dart";

final dataProvider = NotifierProvider<DataNotifier, FileData>(DataNotifier.new);

class DataNotifier extends Notifier<FileData> {
  @override
  FileData build() => FileData.empty();

  Future<void> loadEmpty() async {
    state = FileData.empty();
    ref.read(valuesProvider.notifier).readData(state);
  }

  Future<void> load(String filepath) async {
    state = await FileData.fromFile(filepath);
    ref.read(valuesProvider.notifier).readData(state);
  }

  void loadBytes(Uint8List bytes) {
    state = FileData.fromBytes(bytes);
    ref.read(valuesProvider.notifier).readData(state);
  }

  Future<void> save() async {
    ref.read(valuesProvider.notifier).writeData(state);

    if (kIsWeb) {
      state.downloadWeb();
      return;
    }

    await state.toFileInPlace();
  }

  Future<void> saveAs(String filepath) async {
    ref.read(valuesProvider.notifier).writeData(state);
    await state.toFile(filepath);
  }
}
