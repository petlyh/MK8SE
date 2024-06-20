import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/providers/savefile_controller.dart";
import "package:mk8se/widgets/buttons.dart";

enum _ValueType {
  uint8,
  uint32,
}

final _typeProvider = StateProvider((_) => _ValueType.uint8);
final _offsetProvider = StateProvider((_) => 0);

final _valueProvider = StateProvider((ref) {
  final type = ref.watch(_typeProvider);
  final offset = ref.watch(_offsetProvider);
  final bytelist = ref.watch(savefileControllerProvider).bytes;

  return switch (type) {
    _ValueType.uint8 => bytelist.readInt8(offset),
    _ValueType.uint32 => bytelist.readInt32(offset),
  };
});

class AdvancedDialog extends StatelessWidget {
  const AdvancedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Advanced"),
      content: const SingleChildScrollView(child: AdvancedEditor()),
      actionsOverflowButtonSpacing: -32,
      actions: [
        const Row(children: [_WriteButton(), SaveButton()]),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Close", style: TextStyle(height: 0.9)),
        ),
      ],
    );
  }
}

class AdvancedEditor extends ConsumerWidget {
  const AdvancedEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 310,
          padding: const EdgeInsets.only(bottom: 12),
          child: const Text(
            "WARNING: only use if you know what you're doing, otherwise you'll likely corrupt your save.",
            softWrap: true,
          ),
        ),
        const _TypeSelector(),
        const SizedBox(height: 10),
        const _OffsetInput(),
        const SizedBox(height: 12),
        const _ValueInput(),
      ],
    );
  }
}

class _TypeSelector extends ConsumerWidget {
  const _TypeSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = ref.watch(_typeProvider);

    return DropdownButtonFormField<_ValueType>(
      value: type,
      items: const [
        DropdownMenuItem(value: _ValueType.uint8, child: Text("8-bit")),
        DropdownMenuItem(value: _ValueType.uint32, child: Text("32-bit")),
      ],
      onChanged: (t) =>
          t != null ? ref.read(_typeProvider.notifier).state = t : null,
      decoration: const InputDecoration(labelText: "Type"),
    );
  }
}

class _OffsetInput extends ConsumerStatefulWidget {
  const _OffsetInput();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OffsetInputState();
}

class _OffsetInputState extends ConsumerState<_OffsetInput> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController.fromValue(
      const TextEditingValue(text: "0"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "Offset (hex)",
        hintText: "0",
      ),
      textCapitalization: TextCapitalization.characters,
      onChanged: (v) {
        final value = v.trim().isNotEmpty ? int.tryParse(v, radix: 16) : 0;
        if (value == null) {
          final offset = ref.read(_offsetProvider);
          controller.text = offset.toRadixString(16).toUpperCase();
          return;
        }
        ref.read(_offsetProvider.notifier).state = value;
      },
      inputFormatters: [
        TextInputFormatter.withFunction(
          (o, n) => n.copyWith(text: n.text.trim().toUpperCase()),
        ),
      ],
    );
  }
}

class _ValueInput extends ConsumerStatefulWidget {
  const _ValueInput();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ValueInputState();
}

class _ValueInputState extends ConsumerState<_ValueInput> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController.fromValue(
      const TextEditingValue(text: "0"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(_valueProvider);

    if (controller.text != value.toString()) {
      controller.text = value.toString();
    }

    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Value (dec)",
            hintText: "0",
            suffixIcon: IconButton(
              onPressed: () => ref.refresh(_valueProvider.notifier),
              icon: const Icon(Icons.refresh),
              tooltip: "Reload",
            ),
          ),
          textCapitalization: TextCapitalization.characters,
          onChanged: (v) {
            final parsedValue = v.trim().isNotEmpty ? int.tryParse(v) : 0;
            if (parsedValue == null) {
              controller.text = value.toString();
              return;
            }
            ref.read(_valueProvider.notifier).state = parsedValue;
          },
          inputFormatters: [
            TextInputFormatter.withFunction(
              (o, n) => n.copyWith(text: n.text.trim()),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          key: UniqueKey(),
          initialValue: value.toRadixString(16).toUpperCase(),
          decoration: const InputDecoration(labelText: "Value (hex)"),
          enabled: false,
        ),
      ],
    );
  }
}

class _WriteButton extends CustomButton {
  @override
  String get name => "Write";

  @override
  IconData get icon => Icons.edit_outlined;

  const _WriteButton();

  @override
  void onTap(WidgetRef ref) {
    final type = ref.read(_typeProvider);
    final value = ref.read(_valueProvider);
    final offset = ref.read(_offsetProvider);
    final notifier = ref.read(savefileControllerProvider.notifier);

    return switch (type) {
      _ValueType.uint8 => notifier.writeInt8(value, offset),
      _ValueType.uint32 => notifier.writeInt32(value, offset),
    };
  }
}
