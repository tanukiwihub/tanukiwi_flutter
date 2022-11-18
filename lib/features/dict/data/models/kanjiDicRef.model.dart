import '../../domain/entities/kanjiDicRef.entity.dart';

class KanjiDicRefModel extends KanjiDicRef {
  const KanjiDicRefModel({
    required String value,
    required String type,
    int? mPage,
    String? mVol,
  }) : super(
          value: value,
          type: type,
          mPage: mPage,
          mVol: mVol,
        );

  factory KanjiDicRefModel.fromMap(Map<String, dynamic> map) {
    return KanjiDicRefModel(
      value: map['dicRef'],
      type: map['dicRefType'],
      mPage: map['mPage'],
      mVol: map['mVol'],
    );
  }
}
