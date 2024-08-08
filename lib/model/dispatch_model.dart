class DispatchModel {
  DispatchModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final String? status;
  final List<Datum> data;

  factory DispatchModel.fromJson(Map<String, dynamic> json) {
    return DispatchModel(
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
    required this.farmerId,
    required this.farmerName,
    required this.farmerAppno,
    required this.farmerMobileno,
    required this.dispatchReceipt,
    required this.dispatchStatus,
    required this.farmerAsset,
  });

  final String? farmerId;
  final String? farmerName;
  final String? farmerAppno;
  final String? farmerMobileno;
  final String? dispatchReceipt;
  final String? dispatchStatus;
  final List<FarmerAsset> farmerAsset;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      farmerId: json["farmer_id"],
      farmerName: json["farmer_name"],
      farmerAppno: json["farmer_appno"],
      farmerMobileno: json["farmer_mobileno"],
      dispatchReceipt: json["dispatch_receipt"],
      dispatchStatus: json["dispatch_status"],
      farmerAsset: json["farmer_asset"] == null
          ? []
          : List<FarmerAsset>.from(
              json["farmer_asset"]!.map((x) => FarmerAsset.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "farmer_id": farmerId,
        "farmer_name": farmerName,
        "farmer_appno": farmerAppno,
        "farmer_mobileno": farmerMobileno,
        "dispatch_receipt": dispatchReceipt,
        "dispatch_status": dispatchStatus,
        "farmer_asset": farmerAsset.map((x) => x.toJson()).toList(),
      };
}

class FarmerAsset {
  FarmerAsset({
    required this.assetId,
    required this.assetName,
    required this.dispatch,
  });

  final String? assetId;
  final String? assetName;
  final String? dispatch;

  factory FarmerAsset.fromJson(Map<String, dynamic> json) {
    return FarmerAsset(
      assetId: json["asset_id"],
      assetName: json["asset_name"],
      dispatch: json["dispatch"],
    );
  }

  Map<String, dynamic> toJson() => {
        "asset_id": assetId,
        "asset_name": assetName,
        "dispatch": dispatch,
      };
}
