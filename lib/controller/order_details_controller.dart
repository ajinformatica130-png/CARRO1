import 'package:tochegandodelivery/model/order_model.dart';
import 'package:tochegandodelivery/model/user_model.dart';
import 'package:tochegandodelivery/utils/fire_store_utils.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getArgument();
    getUser();
    super.onInit();
  }

  Rx<UserModel> userModel = UserModel().obs;

  Rx<OrderModel> orderModel = OrderModel().obs;

  getArgument() async {
    dynamic argumentData = Get.arguments;
    if (argumentData != null) {
      orderModel.value = argumentData['orderModel'];
    }
    update();
  }

  getUser() async {
    await FireStoreUtils.getUserProfile(FireStoreUtils.getCurrentUid()).then((value) {
      if (value != null) {
        userModel.value = value;
      }
    });
  }
}
