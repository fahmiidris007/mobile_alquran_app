import 'dart:convert';

class SurahBookmark {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  TempatTurun? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;

  SurahBookmark({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
  });

  factory SurahBookmark.fromRawJson(String str) =>
      SurahBookmark.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SurahBookmark.fromJson(Map<String, dynamic> json) => SurahBookmark(
    nomor: json["nomor"],
    nama: json["nama"],
    namaLatin: json["nama_latin"],
    jumlahAyat: json["jumlah_ayat"],
    tempatTurun: tempatTurunValues.map[json["tempat_turun"]]!,
    arti: json["arti"],
    deskripsi: json["deskripsi"],
    audio: json["audio"],
  );

  Map<String, dynamic> toJson() => {
    "nomor": nomor,
    "nama": nama,
    "nama_latin": namaLatin,
    "jumlah_ayat": jumlahAyat,
    "tempat_turun": tempatTurunValues.reverse[tempatTurun],
    "arti": arti,
    "deskripsi": deskripsi,
    "audio": audio,
  };
}

enum TempatTurun { MADINAH, MEKAH }

final tempatTurunValues =
EnumValues({"madinah": TempatTurun.MADINAH, "mekah": TempatTurun.MEKAH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
