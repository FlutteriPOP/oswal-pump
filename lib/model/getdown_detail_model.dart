class GetDownDetailModel {
  String? message;
  String? name;
  String? location;
  String? status;
  String? id;
  List<Data>? data;

  GetDownDetailModel(
      {this.message,
      this.name,
      this.location,
      this.status,
      this.id,
      this.data});

  GetDownDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    name = json['name'];
    location = json['location'];
    status = json['status'];
    id = json['id'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['name'] = name;
    data['location'] = location;
    data['status'] = status;
    data['id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? assetId;
  String? assetName;
  String? totalQty;
  String? transferredQty;
  String? normalQty;
  String? spareQty;
  List<ModelSpecificationData>? modelSpecificationData;

  Data(
      {this.assetId,
      this.assetName,
      this.totalQty,
      this.transferredQty,
      this.normalQty,
      this.spareQty,
      this.modelSpecificationData});

  Data.fromJson(Map<String, dynamic> json) {
    assetId = json['asset_id'];
    assetName = json['asset_name'];
    totalQty = json['total_qty'];
    transferredQty = json['transferred_qty'];
    normalQty = json['normal_qty'];
    spareQty = json['spare_qty'];
    if (json['model_specification_data'] != null) {
      modelSpecificationData = <ModelSpecificationData>[];
      json['model_specification_data'].forEach((v) {
        modelSpecificationData!.add(ModelSpecificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asset_id'] = assetId;
    data['asset_name'] = assetName;
    data['total_qty'] = totalQty;
    data['transferred_qty'] = transferredQty;
    data['normal_qty'] = normalQty;
    data['spare_qty'] = spareQty;
    if (modelSpecificationData != null) {
      data['model_specification_data'] =
          modelSpecificationData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelSpecificationData {
  String? specifionId;
  String? assetModelId;
  String? assetModelName;
  String? specificationName;
  String? totalQty;
  String? transferredQty;
  String? normalQty;
  String? spareQty;
  List<SpecificationSerialData>? specificationSerialData;

  ModelSpecificationData(
      {this.specifionId,
      this.assetModelId,
      this.assetModelName,
      this.specificationName,
      this.totalQty,
      this.transferredQty,
      this.normalQty,
      this.spareQty,
      this.specificationSerialData});

  ModelSpecificationData.fromJson(Map<String, dynamic> json) {
    specifionId = json['specifion_id'];
    assetModelId = json['asset_model_id'];
    assetModelName = json['asset_model_name'];
    specificationName = json['specification_name'];
    totalQty = json['total_qty'];
    transferredQty = json['transferred_qty'];
    normalQty = json['normal_qty'];
    spareQty = json['spare_qty'];
    if (json['specification_serial_data'] != null) {
      specificationSerialData = <SpecificationSerialData>[];
      json['specification_serial_data'].forEach((v) {
        specificationSerialData!.add(SpecificationSerialData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specifion_id'] = specifionId;
    data['asset_model_id'] = assetModelId;
    data['asset_model_name'] = assetModelName;
    data['specification_name'] = specificationName;
    data['total_qty'] = totalQty;
    data['transferred_qty'] = transferredQty;
    data['normal_qty'] = normalQty;
    data['spare_qty'] = spareQty;
    if (specificationSerialData != null) {
      data['specification_serial_data'] =
          specificationSerialData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpecificationSerialData {
  String? assetHistoryId;
  String? serialNo;
  String? pdiNo;
  String? assetId;
  String? godownId;
  String? godownName;
  String? assetModelId;
  String? assetModelName;
  String? installerId;
  String? installerName;
  String? farmerId;
  String? status;
  String? brandId;
  String? brandName;
  String? supplierId;
  String? supplierName;
  String? assetLocation;
  String? assetImage;

  SpecificationSerialData(
      {this.assetHistoryId,
      this.serialNo,
      this.pdiNo,
      this.assetId,
      this.godownId,
      this.godownName,
      this.assetModelId,
      this.assetModelName,
      this.installerId,
      this.installerName,
      this.farmerId,
      this.status,
      this.brandId,
      this.brandName,
      this.supplierId,
      this.supplierName,
      this.assetLocation,
      this.assetImage});

  SpecificationSerialData.fromJson(Map<String, dynamic> json) {
    assetHistoryId = json['asset_history_id'];
    serialNo = json['serial_no'];
    pdiNo = json['pdi_no'];
    assetId = json['asset_id'];
    godownId = json['godown_id'];
    godownName = json['godown_name'];
    assetModelId = json['asset_model_id'];
    assetModelName = json['asset_model_name'];
    installerId = json['installer_id'];
    installerName = json['installer_name'];
    farmerId = json['farmer_id'];
    status = json['status'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    supplierId = json['supplier_id'];
    supplierName = json['supplier_name'];
    assetLocation = json['asset_location'];
    assetImage = json['asset_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['asset_history_id'] = assetHistoryId;
    data['serial_no'] = serialNo;
    data['pdi_no'] = pdiNo;
    data['asset_id'] = assetId;
    data['godown_id'] = godownId;
    data['godown_name'] = godownName;
    data['asset_model_id'] = assetModelId;
    data['asset_model_name'] = assetModelName;
    data['installer_id'] = installerId;
    data['installer_name'] = installerName;
    data['farmer_id'] = farmerId;
    data['status'] = status;
    data['brand_id'] = brandId;
    data['brand_name'] = brandName;
    data['supplier_id'] = supplierId;
    data['supplier_name'] = supplierName;
    data['asset_location'] = assetLocation;
    data['asset_image'] = assetImage;
    return data;
  }
}
