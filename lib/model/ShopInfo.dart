
class Shop {
  String? _shopId;
  String? _shopName;
  String? _shopAddress;
  String? _shopContactNo;
  String? _shopImgUrl;
  String? _shopOpeningTiming;
  String? _shopClosingTiming;


  Shop(this._shopId, this._shopName, this._shopAddress, this._shopContactNo,
      this._shopImgUrl,
      this._shopOpeningTiming, this._shopClosingTiming);

  String? get shopClosingTiming => _shopClosingTiming;

  String? get shopOpeningTiming => _shopOpeningTiming;

  String? get shopImgUrl => _shopImgUrl;

  String? get shopAddress => _shopAddress;

  String? get shopName => _shopName;

  String? get shopId => _shopId;


  String? get shopContactNo => _shopContactNo;

  Shop.fromJson(Map<String, Object?> json) {
    shopId:
    json['shopId']! as String;
    shopName:
    json['shopName']! as String;
    contactNo:
    json['contactNo']! as String;
    shopAddress:
    json['shopAddress']! as String;
    shopImgUrl:
    json['shopImgUrl']! as String;
    shopOpeningTiming:
    json['shopOpeningTiming']! as String;
    shopClosingTiming:
    json['shopClosingTiming']! as String;
  }


  Map<String, Object?> toJson() {
    return {
      'shopId': _shopId,
      'shopName': _shopName,
      'shopAddress': _shopAddress,
      'shopContactNo': _shopContactNo,
      'shopImgUrl': _shopImgUrl,
      'shopOpeningTiming': _shopOpeningTiming,
      'shopClosingTiming': _shopClosingTiming,
    };


// Shop(this.shopId, this.shopName, this.shopAddress, this.shopImgUrl,
//     this.shopOpeningTiming, this.shopClosingTiming);

  }
}
