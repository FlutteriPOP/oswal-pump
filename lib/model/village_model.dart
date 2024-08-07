class VillageModel {
  VillageModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final String? status;
  final List<Village> data;

  factory VillageModel.fromJson(Map<String, dynamic> json) {
    return VillageModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Village>.from(json["data"]!.map((x) => Village.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Village {
  Village({
    required this.villageId,
    required this.villageCode,
    required this.villageName,
  });

  final String? villageId;
  final String? villageCode;
  final String? villageName;

  factory Village.fromJson(Map<String, dynamic> json) {
    return Village(
      villageId: json["village_id"],
      villageCode: json["village_code"],
      villageName: json["village_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "village_id": villageId,
        "village_code": villageCode,
        "village_name": villageName,
      };
}
