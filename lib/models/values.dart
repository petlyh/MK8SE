import "package:built_collection/built_collection.dart";
import "package:collection/collection.dart";
import "package:meta/meta.dart";
import "package:mk8se/models/byte_list.dart";
import "package:mk8se/models/value.dart";

@immutable
extension type const Values(BuiltList<Category> _list)
    implements Iterable<Category> {
  Iterable<Value> get allValues => map((category) => category.values).flattened;

  Values read(ByteList bytes) =>
      _withMappedValues((value) => value.read(bytes));

  ByteList write(ByteList bytes) =>
      allValues.fold(bytes, (currentBytes, value) => value.write(currentBytes));

  Values withReplacedValue(Value newValue) => _withMappedValues(
        (value) => value.name == newValue.name ? newValue : value,
      );

  Values withAllUnlocked() => _withMappedValues(
        (value) => value is UnlockableValue && !value.isUnlocked
            ? value.withValue(true)
            : value,
      );

  Category? getCategory(String categoryName) =>
      _list.firstWhereOrNull((c) => c.name == categoryName);

  Value? getValue(String categoryName, String valueName) =>
      getCategory(categoryName)
          ?.values
          .firstWhereOrNull((v) => v.name == valueName);

  Values _withMappedValues(Value Function(Value) f) => Values(
        _list.rebuild(
          (b) => b.map(
            (category) =>
                category.withValues(category.values.rebuild((b2) => b2.map(f))),
          ),
        ),
      );
}

@immutable
class Category {
  final String name;
  final BuiltList<Value> values;

  const Category({required this.name, required this.values});

  Iterable<String> get valueNames => values.map((v) => v.name);

  Category withValues(Iterable<Value> newValues) =>
      Category(name: name, values: newValues.toBuiltList());

  @override
  bool operator ==(Object other) =>
      other is Category && name == other.name && values == other.values;

  @override
  int get hashCode => Object.hash(name, values);
}
