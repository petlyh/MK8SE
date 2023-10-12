import "package:file_picker/file_picker.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/providers/data.dart";
import "package:mk8se/providers/values.dart";

abstract class CustomButton extends ConsumerWidget {
  const CustomButton({super.key, this.enabled = true});

  final bool enabled;

  String get name;
  IconData get icon;

  Future<void> onTap(WidgetRef ref);

  void _onTap(BuildContext context, WidgetRef ref) async {
    try {
      await onTap(ref);
    } catch (e) {
      if (!context.mounted) {
        return;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(e.toString()),
                actions: [
                  TextButton(
                    child: const Text("Close"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ));
    }
  }

  static final style = ButtonStyle(
    padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton.icon(
        onPressed: enabled ? () => _onTap(context, ref) : null,
        icon: Icon(icon, size: 16),
        label: Text(name, style: const TextStyle(fontSize: 12)),
        style: style,
      ),
    );
  }
}

class EmptyButton extends CustomButton {
  @override
  final String name = "New";
  @override
  final IconData icon = Icons.insert_drive_file_outlined;

  const EmptyButton({super.key});

  @override
  Future<void> onTap(WidgetRef ref) async {
    await ref.read(dataProvider.notifier).loadEmpty();
  }
}

class LoadButton extends CustomButton {
  @override
  final String name = "Load";
  @override
  final IconData icon = Icons.upload_file;

  const LoadButton({super.key});

  @override
  Future<void> onTap(WidgetRef ref) async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ["dat"]);

    if (result == null || result.files.isEmpty) {
      return;
    }

    if (kIsWeb) {
      final bytes = result.files.first.bytes!;
      ref.read(dataProvider.notifier).loadBytes(bytes);
      return;
    }

    final filepath = result.paths.first!;
    await ref.read(dataProvider.notifier).load(filepath);
  }
}

class SaveButton extends CustomButton {
  @override
  final String name = "Save";
  @override
  final IconData icon = Icons.save_alt;

  const SaveButton({super.key, super.enabled});

  @override
  Future<void> onTap(WidgetRef ref) async {
    await ref.read(dataProvider.notifier).save();
  }
}

class SaveAsButton extends CustomButton {
  @override
  final String name = "Save As";
  @override
  final IconData icon = Icons.save_alt;

  const SaveAsButton({super.key});

  @override
  Future<void> onTap(WidgetRef ref) async {
    final filepath = await FilePicker.platform
        .saveFile(type: FileType.custom, allowedExtensions: ["dat"]);

    if (filepath == null) {
      return;
    }

    await ref.read(dataProvider.notifier).saveAs(filepath);
  }
}

class UnlockAllButton extends CustomButton {
  @override
  final String name = "Unlock All";
  @override
  final IconData icon = Icons.lock_open;

  const UnlockAllButton({super.key});

  @override
  Future<void> onTap(WidgetRef ref) async =>
      ref.read(valuesProvider.notifier).unlockAll();
}
