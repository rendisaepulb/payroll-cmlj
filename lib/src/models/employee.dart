import '../utils/utils.dart';

class EmployeeModel {
  final String name, email;
  final String? id, nik, role, npwp;
  final double gajiPokok,
      tunKeahlian,
      tunMakan,
      tunLain,
      masukLanjut,
      lemburNasional,
      bpjsNaker,
      pensiun,
      bpjsKesehatan,
      kehadiran;

  EmployeeModel({
    this.id,
    required this.name,
    required this.email,
    this.nik,
    this.role,
    this.npwp,
    this.gajiPokok = 0,
    this.tunKeahlian = 0,
    this.tunMakan = 0,
    this.tunLain = 0,
    this.masukLanjut = 0,
    this.lemburNasional = 0,
    this.bpjsNaker = 0,
    this.pensiun = 0,
    this.bpjsKesehatan = 0,
    this.kehadiran = 0,
  });

  double totalPendapatan() {
    final calc = gajiPokok +
        tunKeahlian +
        tunMakan +
        tunLain +
        masukLanjut +
        lemburNasional;
    return calc;
  }

  double totalPengurangan() {
    final calc = bpjsNaker + pensiun + bpjsKesehatan + kehadiran;
    return calc;
  }

  double gajiBersih() {
    return totalPendapatan() - totalPengurangan();
  }

  EmployeeModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        nik = json['nik'],
        role = json['role'],
        npwp = json['npwp'],
        gajiPokok = Utils.parsingToDouble(json['gaji_pokok']),
        tunKeahlian = Utils.parsingToDouble(json['tun_keahlian']),
        tunMakan = Utils.parsingToDouble(json['tun_makan']),
        tunLain = Utils.parsingToDouble(json['tun_lain']),
        masukLanjut = Utils.parsingToDouble(json['masuk_lanjut']),
        lemburNasional = Utils.parsingToDouble(json['lembur_nasional']),
        bpjsNaker = Utils.parsingToDouble(json['bpjs_naker']),
        pensiun = Utils.parsingToDouble(json['pensiun']),
        bpjsKesehatan = Utils.parsingToDouble(json['bpjs_kesehatan']),
        kehadiran = Utils.parsingToDouble(json['kehadiran']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nik': nik,
      'role': role,
      'npwp': npwp,
      'gaji_pokok': gajiPokok,
      'tun_keahlian': tunKeahlian,
      'tun_makan': tunMakan,
      'tun_lain': tunLain,
      'masuk_lanjut': masukLanjut,
      'lembur_nasional': lemburNasional,
      'bpjs_naker': bpjsNaker,
      'pensiun': pensiun,
      'bpjs_kesehatan': bpjsKesehatan,
      'kehadiran': kehadiran,
    };
  }
}
