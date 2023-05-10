class Medicion{
  final int id;
  final int userId;
  final String lungRate;
  final String heartRate;
  final int temperature;
  final String date;
  final String time;
  final bool type;

  Medicion({
    required this.id,
    required this.userId,
    required this.lungRate,
    required this.heartRate,
    required this.temperature,
    required this.date,
    required this.time,
    required this.type,
  });
}

