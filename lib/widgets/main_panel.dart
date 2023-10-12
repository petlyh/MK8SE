import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/models/models.dart";
import "package:mk8se/providers/values.dart";
import "package:mk8se/widgets/spinbox.dart";

final selectedCategoryProvider = StateProvider<String>(
  (ref) => values.keys.first,
);

class MainPanel extends ConsumerWidget {
  const MainPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(flex: 1, child: CategoriesPanel()),
        VerticalDivider(width: 0),
        Expanded(flex: 2, child: ValuesEditorPanel()),
      ],
    );
  }
}

class CategoriesPanel extends ConsumerWidget {
  const CategoriesPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = values.keys;

    return ListView(
      children: categories
          .map((category) => ListTile(
                title: Text(category, style: const TextStyle(fontSize: 14)),
                onTap: () => ref.read(selectedCategoryProvider.notifier).state =
                    category,
                selected: category == ref.watch(selectedCategoryProvider),
              ))
          .toList(),
    );
  }
}

class ValuesEditorPanel extends ConsumerWidget {
  const ValuesEditorPanel({super.key});

  Widget? valueEditor(
      WidgetRef ref, MapEntry<String, OffsetValueHolder<dynamic>> entry) {
    final holder = entry.value;
    final offsetType = holder.offset.runtimeType;

    if (offsetType == UnlockableOffset) {
      return Checkbox(
          value: holder.value as bool,
          onChanged: (value) =>
              ref.read(valuesProvider.notifier).setValue(holder, value));
    } else if (offsetType == NumberOffset) {
      return SpinBox(
          value: holder.value as int,
          onChange: (value) =>
              ref.read(valuesProvider.notifier).setValue(holder, value));
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    ref.watch(valuesProvider);
    final entries =
        ref.watch(valuesProvider.notifier).getCategoryEntries(category);

    return ListView(
      children: entries
          .map((entry) => ListTile(
              contentPadding: const EdgeInsets.only(left: 16, right: 8),
              dense: true,
              title: Text(entry.key, style: const TextStyle(fontSize: 14)),
              trailing:
                  Transform.scale(scale: 0.9, child: valueEditor(ref, entry))))
          .toList(),
    );
  }
}
