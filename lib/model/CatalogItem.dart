import 'package:get/get.dart';

class CatalogItem {

  String? _catalogItemName;
  String? _catalogItemPrice;
  String? _catalogItemCategory;
  String? _catalogItemImgUrl;
  var createdAt;

  CatalogItem(this._catalogItemName,
      this._catalogItemPrice,
      this._catalogItemCategory,
      this._catalogItemImgUrl,this.createdAt);
  CatalogItem.withOneLessArg(this._catalogItemName,
      this._catalogItemPrice,
      this._catalogItemCategory,
      this._catalogItemImgUrl);

//----Getters----//
  String? get catalogItemName => _catalogItemName;

String? get catalogItemPrice => _catalogItemPrice;

String? get catalogItemCategory => _catalogItemCategory;

  String? get catalogItemImgUrl => _catalogItemImgUrl;




  CatalogItem.fromJson(Map<String, Object?> json) {
    catalogItemName:
    json['catalogItemName']! as String;
    catalogItemPrice:
    json['catalogItemPrice']! as String;
    catalogItemCategory:
    json['catalogItemCategory']! as String;
    catalogItemImgUrl:
    json['catalogItemImgUrl']! as String;
  }

  Map<String, Object?> toJson() {
    return {
      'catalogItemName': _catalogItemName,
      'catalogItemPrice': _catalogItemPrice,
      'catalogItemCategory': _catalogItemCategory,
      'catalogItemImgUrl': _catalogItemImgUrl,
      'createdAt': createdAt
    };

// Shop(this.shopId, this.shopName, this.shopAddress, this.shopImgUrl,
//     this.shopOpeningTiming, this.shopClosingTiming);
  }
}
