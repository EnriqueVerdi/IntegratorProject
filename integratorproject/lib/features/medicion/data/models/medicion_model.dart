import '../../domain/entities/medicion.dart';


class MedicionModel extends Medicion {
  MedicionModel({required int id, required int userId, required String lungRate, required String heartRate, required int temperature, required String date, required String time, required bool type})
      : super(id: id, userId: userId, lungRate: lungRate, heartRate: heartRate, temperature: temperature, date: date, time: time, type: type );

  factory MedicionModel.fromJson(Map<String, dynamic> json) {
    return MedicionModel(id: json['id'], userId: json['userId'], lungRate: json['lungRate'], heartRate: json['heartRate'], temperature: json['temperature'], date: json['date'], time: json['time'], type: json['type']      );
  }

  factory MedicionModel.fromEntity(Medicion medicion) {
    return MedicionModel(id: medicion.id, userId: medicion.userId, lungRate: medicion.lungRate, heartRate: medicion.heartRate, temperature: medicion.temperature, date: medicion.date, time: medicion.time, type: medicion.type );
  }
}
