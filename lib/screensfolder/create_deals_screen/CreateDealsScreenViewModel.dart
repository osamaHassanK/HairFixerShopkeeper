import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairfixxer_shopkeeper/Utilities/FirestoreDbRerences.dart';
import 'package:hairfixxer_shopkeeper/auth/app_colors.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CreateDealsScreenViewModel extends GetxController {
  var isClicked = false.obs;
  RxInt? originalPrice = 0.obs;
  RxInt? discountedPrice = 0.obs;
  RxString? dealName = ''.obs;
  RxList<dynamic> servicesList=[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void showMultiSelect(BuildContext context, List<String> services,oldSelectedServices,Function(dynamic selectedServices) onSelect) async {
   List<String>? olddSelectedServices=oldSelectedServices as List<String>?;
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          selectedColor: AppColor.APP_YELLOW_COLOR.withOpacity(0.3),
          confirmText: Text(
            'DONE',
            style: TextStyle(color: AppColor.APP_YELLOW_COLOR, fontSize: 16),
          ),
          cancelText: Text(
            'CANCEL',
            style: TextStyle(color: AppColor.APP_YELLOW_COLOR, fontSize: 16),
          ),
          items: services
              .map((values) => MultiSelectItem<String>(values, values))
              .toList(),
          initialValue: olddSelectedServices,
          listType: MultiSelectListType.CHIP,
          onConfirm: (values) {

            onSelect(values);
          },
        );
      },
    );
  }

  Future uploadDealInfo(

      Map<String, dynamic> dealMap) {
    return firestoreShopDealsCollectionRef.add(dealMap);
  }


  Future updateData(Map<String,dynamic>map,String docId){
    return firestoreShopDealsCollectionRef.doc(docId).update(map);


  }


}
