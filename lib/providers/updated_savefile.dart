import "package:crc32_checksum/crc32_checksum.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/models/savefile.dart";
import "package:mk8se/providers/values_controller.dart";

/// Provides a copy of the savefile with the current values
/// from [valuesControllerProvider] and a newly calculated checksum.
final updatedSavefileFamily =
    Provider.family<Savefile, Savefile>((ref, savefile) {
  const checksumOffset = 0x38;
  const checksumDataOffset = 0x48;

  final values = ref.read(valuesControllerProvider);
  final bytes = values.write(savefile.bytes);
  final checksum = Crc32.calculate(bytes.toSublist(checksumDataOffset));
  final updatedBytes = bytes.withInt32At(checksum, checksumOffset);
  return savefile.withBytes(updatedBytes);
});
