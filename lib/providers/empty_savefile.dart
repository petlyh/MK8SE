import "package:mk8se/models/savefile.dart";
import "package:mk8se/providers/savefile_repository.dart";
import "package:riverpod/riverpod.dart";

final emptySavefileProvider = Provider<Savefile>((_) {
  throw Exception("emptySavefileProvider is not initialized");
});

Future<Savefile> readEmptySavefile() async {
  const key = "assets/userdata-empty.dat";
  return await SavefileRepository.readAsset(key);
}
