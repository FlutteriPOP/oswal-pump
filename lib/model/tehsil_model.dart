class TehsilModel {
  TehsilModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final String? status;
  final List<Tehsil> data;

  factory TehsilModel.fromJson(Map<String, dynamic> json) {
    return TehsilModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Tehsil>.from(json["data"]!.map((x) => Tehsil.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Tehsil {
  Tehsil({
    required this.tehsilId,
    required this.tehsilCode,
    required this.tehsilName,
  });

  final String? tehsilId;
  final String? tehsilCode;
  final String? tehsilName;

  factory Tehsil.fromJson(Map<String, dynamic> json) {
    return Tehsil(
      tehsilId: json["tehsil_id"],
      tehsilCode: json["tehsil_code"],
      tehsilName: json["tehsil_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "tehsil_id": tehsilId,
        "tehsil_code": tehsilCode,
        "tehsil_name": tehsilName,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Tehsil &&
          runtimeType == other.runtimeType &&
          tehsilId == other.tehsilId;

  @override
  int get hashCode => tehsilId.hashCode;
}
