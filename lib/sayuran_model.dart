class Sayuranmodel {
  String namavarieti;
  String unit;
  String harga;

  Sayuranmodel({
    this.namavarieti, this.unit, this.harga});

  factory Sayuranmodel.fromJson(dynamic json){
    return Sayuranmodel(
      namavarieti: "${json['nama_varieti']}",
      unit: "${json['unit']}",
      harga: "${json['harga']}",
    );
  }
  Map toJson() => {
    "nama_varieti": namavarieti,
    "unit": unit,
    "harga": harga,
  };
}