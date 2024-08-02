class GetGodownModel {
  final String? godownId;
  final String? godownName;
  final String? godownLocation;
  final String? availableTotalQty;
  final List<AssetQty>? availableAssetQty;
  final String? spareTotalQty;
  final List<AssetQty>? spareAssetQty;
  final String? noOfSupplier;
  final String? nameOfSupplier;
  final String? noOfInstaller;
  final String? nameOfInstaller;
  final String? type;

  GetGodownModel({
    this.godownId,
    this.godownName,
    this.godownLocation,
    this.availableTotalQty,
    this.availableAssetQty,
    this.spareTotalQty,
    this.spareAssetQty,
    this.noOfSupplier,
    this.nameOfSupplier,
    this.noOfInstaller,
    this.nameOfInstaller,
    this.type,
  });

  factory GetGodownModel.fromJson(Map<String, dynamic> json) {
    return GetGodownModel(
      godownId: json['godown_id'],
      godownName: json['godown_name'],
      godownLocation: json['godown_location'],
      availableTotalQty: json['available_total_qty'],
      availableAssetQty: (json['available_asset_qty'] as List)
          .map((item) => AssetQty.fromJson(item))
          .toList(),
      spareTotalQty: json['spare_total_qty'],
      spareAssetQty: (json['spare_asset_qty'] as List)
          .map((item) => AssetQty.fromJson(item))
          .toList(),
      noOfSupplier: json['no_of_supplier'],
      nameOfSupplier: json['name_of_supplier'],
      noOfInstaller: json['no_of_installer'],
      nameOfInstaller: json['name_of_installer'],
      type: json['type'],
    );
  }
}

class AssetQty {
  final String? assetName;
  final String? count;

  AssetQty({this.assetName, this.count});

  factory AssetQty.fromJson(Map<String, dynamic> json) {
    return AssetQty(
      assetName: json['asset_name'],
      count: json['count'],
    );
  }
}