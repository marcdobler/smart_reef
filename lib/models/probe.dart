class Probe {
  final String measurementUnit;
  final dynamic measurement;

  Probe({this.measurementUnit, this.measurement});

  factory Probe.fromJson(Map<dynamic, dynamic> json) {
    return Probe(
        measurementUnit: json['measurement_unit'] as String,
        measurement: json['measurement'] as dynamic);
  }
}
