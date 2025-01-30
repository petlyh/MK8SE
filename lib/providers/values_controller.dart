import "package:built_collection/built_collection.dart";
import "package:mk8se/models/value.dart";
import "package:mk8se/models/values.dart";
import "package:mk8se/providers/savefile_controller.dart";
import "package:riverpod/riverpod.dart";

final valuesControllerProvider =
    NotifierProvider<ValuesController, Values>(ValuesController.new);

class ValuesController extends Notifier<Values> {
  @override
  Values build() =>
      _initialValues.read(ref.watch(savefileControllerProvider).bytes);

  void setValue(Value value) => state = state.withReplacedValue(value);

  void unlockAll() => state = state.withAllUnlocked();
}

final Values _initialValues = Values(
  BuiltList.of([
    Category(
      name: "Stats",
      values: BuiltList.of([
        const NumberValue("Coins", 0x1530),
        const NumberValue("Drifts", 0x153C),
        const NumberValue("Jump Boosts", 0x1538),
        const NumberValue("Mini-Turbos", 0x1544),
        const NumberValue("Super Mini-Turbos", 0x1548),
        const NumberValue("Balloons Popped", 0x154C),
        const NumberValue("Own Balloons Popped", 0x1550),
      ]),
    ),
    Category(
      name: "Cups",
      values: BuiltList.of([
        const UnlockableValue("Flower", 0x1A71),
        const UnlockableValue("Star", 0x1A72),
        const UnlockableValue("Special", 0x1A73),
        const UnlockableValue("Banana", 0x1A75),
        const UnlockableValue("Leaf", 0x1A76),
        const UnlockableValue("Lightning", 0x1A77),
      ]),
    ),
    Category(
      name: "Characters",
      values: BuiltList.of([
        const UnlockableValue("Rosalina", 0x1AA4),
        const UnlockableValue("Metal Mario", 0x1AA5),
        const UnlockableValue("Pink Gold Peach", 0x1AA6),
        const UnlockableValue("Lakitu", 0x1AA7),
        const UnlockableValue("Toadette", 0x1A9E),
        const UnlockableValue("Baby Rosalina", 0x1AAD),
        const UnlockableValue("Larry", 0x1AAE),
        const UnlockableValue("Lemmy", 0x1AAF),
        const UnlockableValue("Wendy", 0x1AB0),
        const UnlockableValue("Ludwig", 0x1AB1),
        const UnlockableValue("Iggy", 0x1AB2),
        const UnlockableValue("Roy", 0x1AB3),
        const UnlockableValue("Morton", 0x1AB4),
        const UnlockableValue("Mii", 0x1AB5),
      ]),
    ),
    Category(
      name: "Karts",
      values: BuiltList.of([
        const UnlockableValue("Pipe Frame", 0x1AD9),
        const UnlockableValue("Steel Diver", 0x1ADB),
        const UnlockableValue("Cat Cruiser", 0x1ADC),
        const UnlockableValue("Circuit Special", 0x1ADD),
        const UnlockableValue("Tri-Speeder", 0x1ADE),
        const UnlockableValue("Prancer", 0x1AE0),
        const UnlockableValue("Landship", 0x1AE2),
        const UnlockableValue("Bounder", 0x1AE3),
        const UnlockableValue("Sports Coupé", 0x1AE4),
        const UnlockableValue("Gold Kart", 0x1AE5),
      ]),
    ),
    Category(
      name: "Bikes",
      values: BuiltList.of([
        const UnlockableValue("Comet", 0x1AE7),
        const UnlockableValue("The Duke", 0x1AE9),
        const UnlockableValue("Flame Rider", 0x1AEA),
        const UnlockableValue("Varmint", 0x1AEB),
        const UnlockableValue("Mr Scooty", 0x1AEC),
        const UnlockableValue("Jet Bike", 0x1AED),
        const UnlockableValue("Yoshi Bike", 0x1AEE),
        const UnlockableValue("Wild Wiggler", 0x1AF0),
        const UnlockableValue("Teddy Buggy", 0x1AF1),
      ]),
    ),
    Category(
      name: "Tires",
      values: BuiltList.of([
        const UnlockableValue("Slick", 0x1B1C),
        const UnlockableValue("Metal", 0x1B1D),
        const UnlockableValue("Button", 0x1B1E),
        const UnlockableValue("Off-Road", 0x1B1F),
        const UnlockableValue("Sponge", 0x1B20),
        const UnlockableValue("Cushion", 0x1B22),
        const UnlockableValue("Normal Blue", 0x1B23),
        const UnlockableValue("Funky Monster", 0x1B24),
        const UnlockableValue("Azure Roller", 0x1B25),
        const UnlockableValue("Crimson Slim", 0x1B26),
        const UnlockableValue("Cyber Slick", 0x1B27),
        const UnlockableValue("Retro Off-Road", 0x1B28),
        const UnlockableValue("Gold Wheels", 0x1B29),
      ]),
    ),
    Category(
      name: "Gliders",
      values: BuiltList.of([
        const UnlockableValue("Cloud Glider", 0x1B59),
        const UnlockableValue("Wario Wing", 0x1B5A),
        const UnlockableValue("Waddle Wing", 0x1B5B),
        const UnlockableValue("Peach Parasol", 0x1B5C),
        const UnlockableValue("Flower Glider", 0x1B5F),
        const UnlockableValue("Bowser Kite", 0x1B60),
        const UnlockableValue("Plane Glider", 0x1B61),
        const UnlockableValue("MKTV Parafoil", 0x1B62),
        const UnlockableValue("Gold Glider", 0x1B63),
      ]),
    ),
  ]),
);
