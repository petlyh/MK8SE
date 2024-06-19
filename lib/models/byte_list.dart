import "dart:math";
import "dart:typed_data";

import "package:built_collection/built_collection.dart";
import "package:collection/collection.dart";
import "package:meta/meta.dart";

@immutable
extension type const ByteList._(BuiltList<int> _list) implements Iterable<int> {
  ByteList.fromUint8List(Uint8List uint8List) : _list = uint8List.build();

  ByteList.fromByteData(ByteData byteData)
      : _list = byteData.buffer.asUint8List().build();

  @redeclare
  List<int> toList() => _list.toList();

  Uint8List toUint8List() => Uint8List.fromList(toList());

  List<int> toSublist(int start, [int? end]) =>
      _list.sublist(start, end).toList();

  int readInt8(int offset) => _list[offset];

  int readInt32(int offset) => _decodeBase(toSublist(offset, offset + 4), 256);

  ByteList withInt8At(int number, int offset) => ByteList._(
        _list.rebuild(
          (b) => b.replaceRange(
            offset,
            offset + 1,
            [number.clamp(0, 255)],
          ),
        ),
      );

  ByteList withInt32At(int number, int offset) => ByteList._(
        _list.rebuild(
          (b) => b.replaceRange(
            offset,
            offset + 4,
            _encodeBase(number, 4, 256),
          ),
        ),
      );
}

/// Encodes [number] to base [radix] with [digitCount] digits.
///
/// Result is [Endian.big].
Iterable<int> _encodeBase(int number, int digitCount, int radix) {
  final digitValue = pow(radix, digitCount - 1).toInt();
  final digit = (number / digitValue).truncate();

  return [
    digit,
    if (digitCount > 1)
      ..._encodeBase(number - (digit * digitValue), digitCount - 1, radix),
  ];
}

/// Interprets a list of digits of base [radix] as a an integer.
///
/// [input] is interpreted as [Endian.big].
int _decodeBase(List<int> input, int radix) => input.reversed.reduceIndexed(
      (index, previous, element) =>
          (previous + element.clamp(0, radix - 1) * pow(radix, index)).toInt(),
    );
