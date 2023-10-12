import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/models/models.dart";

typedef Values = Map<String, Map<String, OffsetValueHolder<dynamic>>>;

final valuesProvider =
    NotifierProvider<ValuesNotifier, Values>(ValuesNotifier.new);

class ValuesNotifier extends Notifier<Values> {
  @override
  Values build() => values;

  void _forEach(Function(OffsetValueHolder<dynamic> holder) func) {
    for (final category in state.keys) {
      for (final entry in state[category]!.keys) {
        func(state[category]![entry]!);
      }
    }
  }

  void setValue<T>(OffsetValueHolder<T> holder, T value) {
    holder.value = value;
    ref.notifyListeners();
  }

  void unlockAll() {
    _forEach((holder) {
      if (holder.offset.runtimeType != UnlockableOffset) {
        return;
      }

      holder.value = true;
    });

    ref.notifyListeners();
  }

  void readData(FileData data) {
    _forEach((holder) => holder.read(data));
    ref.notifyListeners();
  }

  void writeData(FileData data) {
    _forEach((holder) => holder.write(data));
  }

  List<MapEntry<String, OffsetValueHolder<dynamic>>> getCategoryEntries(
          String category) =>
      state[category]!.entries.toList();
}

Values values = {
  "Stats": {
    "Coins": OffsetValueHolder.number(0x1530),
    "Drifts": OffsetValueHolder.number(0x153C),
    "Jump Boosts": OffsetValueHolder.number(0x1538),
    "Mini-Turbos": OffsetValueHolder.number(0x1544),
    "Super Mini-Turbos": OffsetValueHolder.number(0x1548),
    "Balloons Popped": OffsetValueHolder.number(0x154C),
    "Own Balloons Popped": OffsetValueHolder.number(0x1550),
  },
  "Characters": {
    "Rosalina": OffsetValueHolder.unlockable(0x1AA4),
    "Metal Mario": OffsetValueHolder.unlockable(0x1AA5),
    "Pink Gold Peach": OffsetValueHolder.unlockable(0x1AA6),
    "Lakitu": OffsetValueHolder.unlockable(0x1AA7),
    "Baby Rosalina": OffsetValueHolder.unlockable(0x1AAD),
    "Larry": OffsetValueHolder.unlockable(0x1AAE),
    "Lemmy": OffsetValueHolder.unlockable(0x1AAF),
    "Wendy": OffsetValueHolder.unlockable(0x1AB0),
    "Ludwig": OffsetValueHolder.unlockable(0x1AB1),
    "Iggy": OffsetValueHolder.unlockable(0x1AB2),
    "Roy": OffsetValueHolder.unlockable(0x1AB3),
    "Morton": OffsetValueHolder.unlockable(0x1AB4),
    "Mii": OffsetValueHolder.unlockable(0x1AB5),
  },
  "Karts": {
    "Pipe Frame": OffsetValueHolder.unlockable(0x1AD9),
    "Steel Diver": OffsetValueHolder.unlockable(0x1ADB),
    "Cat Cruiser": OffsetValueHolder.unlockable(0x1ADC),
    "Circuit Special": OffsetValueHolder.unlockable(0x1ADD),
    "Tri-Speeder": OffsetValueHolder.unlockable(0x1ADE),
    "Prancer": OffsetValueHolder.unlockable(0x1AE0),
    "Landship": OffsetValueHolder.unlockable(0x1AE2),
    "Bounder": OffsetValueHolder.unlockable(0x1AE3),
    "Sports Coupé": OffsetValueHolder.unlockable(0x1AE4),
    "Gold Kart": OffsetValueHolder.unlockable(0x1AE5),
  },
  "Bikes": {
    "Comet": OffsetValueHolder.unlockable(0x1AE7),
    "The Duke": OffsetValueHolder.unlockable(0x1AE9),
    "Flame Rider": OffsetValueHolder.unlockable(0x1AEA),
    "Varmint": OffsetValueHolder.unlockable(0x1AEB),
    "Mr Scooty": OffsetValueHolder.unlockable(0x1AEC),
    "Jet Bike": OffsetValueHolder.unlockable(0x1AED),
    "Yoshi Bike": OffsetValueHolder.unlockable(0x1AEE),
    "Wild Wiggler": OffsetValueHolder.unlockable(0x1AF0),
    "Teddy Buggy": OffsetValueHolder.unlockable(0x1AF1),
  },
  "Tires": {
    "Slick": OffsetValueHolder.unlockable(0x1B1C),
    "Metal": OffsetValueHolder.unlockable(0x1B1D),
    "Button": OffsetValueHolder.unlockable(0x1B1E),
    "Off-Road": OffsetValueHolder.unlockable(0x1B1F),
    "Sponge": OffsetValueHolder.unlockable(0x1B20),
    "Cushion": OffsetValueHolder.unlockable(0x1B22),
    "Normal Blue": OffsetValueHolder.unlockable(0x1B23),
    "Funky Monster": OffsetValueHolder.unlockable(0x1B24),
    "Azure Roller": OffsetValueHolder.unlockable(0x1B25),
    "Crimson Slim": OffsetValueHolder.unlockable(0x1B26),
    "Cyber Slick": OffsetValueHolder.unlockable(0x1B27),
    "Retro Off-Road": OffsetValueHolder.unlockable(0x1B28),
    "Gold Wheels": OffsetValueHolder.unlockable(0x1B29),
  },
  "Gliders": {
    "Cloud Glider": OffsetValueHolder.unlockable(0x1B59),
    "Wario Wing": OffsetValueHolder.unlockable(0x1B5A),
    "Waddle Wing": OffsetValueHolder.unlockable(0x1B5B),
    "Peach Parasol": OffsetValueHolder.unlockable(0x1B5C),
    "Flower Glider": OffsetValueHolder.unlockable(0x1B5F),
    "Bowser Kite": OffsetValueHolder.unlockable(0x1B60),
    "Plane Glider": OffsetValueHolder.unlockable(0x1B61),
    "MKTV Parafoil": OffsetValueHolder.unlockable(0x1B62),
    "Gold Glider": OffsetValueHolder.unlockable(0x1B63),
  },
};
