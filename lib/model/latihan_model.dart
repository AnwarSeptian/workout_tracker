import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LatihanModel {
  final int? id;
  final String namalatihan;
  final int durasi;
  final int total;
  final String tanggal;
  LatihanModel({
    this.id,
    required this.namalatihan,
    required this.durasi,
    required this.total,
    required this.tanggal,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namalatihan': namalatihan,
      'durasi': durasi,
      'total': total,
      'tanggal': tanggal,
    };
  }

  factory LatihanModel.fromMap(Map<String, dynamic> map) {
    return LatihanModel(
      id: map['id'] != null ? map['id'] as int : null,
      namalatihan: map['namalatihan'] as String,
      durasi: map['durasi'] as int,
      total: map['total'] as int,
      tanggal: map['tanggal'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LatihanModel.fromJson(String source) =>
      LatihanModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
