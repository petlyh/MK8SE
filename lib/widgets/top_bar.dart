import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/providers/savefile_controller.dart";
import "package:mk8se/widgets/buttons.dart";

class TopRow extends ConsumerWidget {
  const TopRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaveableInPlace =
        ref.watch(savefileControllerProvider).isSaveableInPlace;

    return Row(
      children: [
        const EmptyButton(),
        const LoadButton(),
        SaveButton(enabled: isSaveableInPlace || kIsWeb),
        if (!kIsWeb) const SaveAsButton(),
        const UnlockAllButton(),
      ],
    );
  }
}
