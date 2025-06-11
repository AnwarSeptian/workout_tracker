import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LatihanModel {
  final int? id;
  final String durasi;
  final String jumlah;
  LatihanModel({this.id, required this.durasi, required this.jumlah});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'durasi': durasi, 'jumlah': jumlah};
  }

  factory LatihanModel.fromMap(Map<String, dynamic> map) {
    return LatihanModel(
      durasi: map['durasi'] as String,
      jumlah: map['jumlah'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatihanModel.fromJson(String source) =>
      LatihanModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
