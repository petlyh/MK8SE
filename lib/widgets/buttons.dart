import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/providers/savefile_controller.dart";
import "package:mk8se/providers/values_controller.dart";

abstract class CustomButton extends ConsumerWidget {
  const CustomButton({super.key, this.enabled = true});

  final bool enabled;

  String get name;
  IconData get icon;

  FutureOr<void> onTap(WidgetRef ref);

  Future<void> _onTap(BuildContext context, WidgetRef ref) async {
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
        ),
      );
    }
  }

  static final style = ButtonStyle(
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
    shape: WidgetStateProperty.all(
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
  String get name => "New";
  @override
  IconData get icon => Icons.insert_drive_file_outlined;

  const EmptyButton({super.key});

  @override
  void onTap(WidgetRef ref) {
    ref.invalidate(savefileControllerProvider);
    // Invalidate the values provider to make sure the values are reset
    // even if the loaded savefile was already the empty savefile.
    ref.invalidate(valuesControllerProvider);
  }
}

class LoadButton extends CustomButton {
  @override
  String get name => "Load";
  @override
  IconData get icon => Icons.upload_file;

  const LoadButton({super.key});

  @override
  Future<void> onTap(WidgetRef ref) async =>
      await ref.read(savefileControllerProvider.notifier).loadFileDialog();
}

class SaveButton extends CustomButton {
  @override
  String get name => "Save";
  @override
  IconData get icon => Icons.save_alt;

  const SaveButton({super.key, super.enabled});

  @override
  Future<void> onTap(WidgetRef ref) async =>
      await ref.read(savefileControllerProvider.notifier).savePlatform();
}

class SaveAsButton extends CustomButton {
  @override
  String get name => "Save As";
  @override
  IconData get icon => Icons.save_alt;

  const SaveAsButton({super.key});

  @override
  Future<void> onTap(WidgetRef ref) async =>
      await ref.read(savefileControllerProvider.notifier).saveFileDialog();
}

class UnlockAllButton extends CustomButton {
  @override
  String get name => "Unlock All";
  @override
  IconData get icon => Icons.lock_open;

  const UnlockAllButton({super.key});

  @override
  void onTap(WidgetRef ref) =>
      ref.read(valuesControllerProvider.notifier).unlockAll();
}
