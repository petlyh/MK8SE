import "package:built_collection/built_collection.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/models/value.dart";
import "package:mk8se/providers/values_controller.dart";
import "package:mk8se/widgets/spinbox.dart";

final selectedCategoryProvider = StateProvider<String>(
  (ref) => ref.read(valuesControllerProvider).first.name,
);

class MainPanel extends ConsumerWidget {
  const MainPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: CategoriesPanel()),
        VerticalDivider(width: 0),
        Expanded(flex: 2, child: ValuesEditorPanel()),
      ],
    );
  }
}

class CategoriesPanel extends ConsumerWidget {
  const CategoriesPanel({super.key});

  void Function() setSelected(WidgetRef ref, String category) =>
      () => ref.read(selectedCategoryProvider.notifier).state = category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.read(valuesControllerProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return ListView(
      children: categories
          .map(
            (category) => ListTile(
              title: Text(
                category.name,
                style: const TextStyle(fontSize: 14),
              ),
              onTap: setSelected(ref, category.name),
              selected: category.name == selectedCategory,
            ),
          )
          .toList(),
    );
  }
}

class ValuesEditorPanel extends ConsumerWidget {
  const ValuesEditorPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryName = ref.watch(selectedCategoryProvider);

    // Converted to BuiltList so RiverPod can check for equality
    // and prevent unnecessary rebuilds
    final valueNames = ref.watch(
      valuesControllerProvider
          .select((v) => BuiltList.of(v.getCategory(categoryName)!.valueNames)),
    );

    return ListView(
      // Key prevents checkboxes being reused and animated when
      // switching to a different category page.
      key: ValueKey(categoryName),
      children: valueNames
          .map((valueName) => ValueEntry(categoryName, valueName))
          .toList(),
    );
  }
}

class ValueEntry extends ConsumerWidget {
  const ValueEntry(this.categoryName, this.valueName, {super.key});

  final String categoryName;
  final String valueName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(
      valuesControllerProvider
          .select((v) => v.getValue(categoryName, valueName)!),
    );

    final valuesController = ref.read(valuesControllerProvider.notifier);

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 16, right: 8),
      dense: true,
      title: Text(valueName, style: const TextStyle(fontSize: 14)),
      onTap: value is UnlockableValue
          ? () => valuesController.setValue(value.withValue(!value.isUnlocked))
          : null,
      trailing: Transform.scale(
        scale: 0.9,
        child: switch (value) {
          UnlockableValue() => Checkbox(
              value: value.isUnlocked,
              onChanged: (v) => valuesController.setValue(value.withValue(v!)),
            ),
          NumberValue() => SpinBox(
              value: value.number,
              onChange: (v) => valuesController.setValue(value.withValue(v)),
            ),
        },
      ),
    );
  }
}
