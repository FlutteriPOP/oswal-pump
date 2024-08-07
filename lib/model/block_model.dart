class BlockModel {
  BlockModel({
    required this.message,
    required this.status,
    required this.data,
  });

  final String? message;
  final String? status;
  final List<Block> data;

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    return BlockModel(
      message: json["message"],
      status: json["status"],
      data: json["data"] == null
          ? []
          : List<Block>.from(json["data"]!.map((x) => Block.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": data.map((x) => x.toJson()).toList(),
      };
}

class Block {
  Block({
    required this.blockId,
    required this.blockCode,
    required this.blockName,
  });

  final String? blockId;
  final String? blockCode;
  final String? blockName;

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      blockId: json["block_id"],
      blockCode: json["block_code"],
      blockName: json["block_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "block_id": blockId,
        "block_code": blockCode,
        "block_name": blockName,
      };
}
