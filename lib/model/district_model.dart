class DistrictModel {
  DistrictModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final String? status;
  final List<Datum> data;

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Datum {
  Datum({
    this.districtId,
    this.districtCode,
    this.districtName,
  });

  final String? districtId;
  final String? districtCode;
  final String? districtName;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      districtId: json["district_id"],
      districtCode: json["district_code"],
      districtName: json["district_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "district_code": districtCode,
        "district_name": districtName,
      };
}
