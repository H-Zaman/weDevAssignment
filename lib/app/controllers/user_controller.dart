import 'package:get/get.dart';
import 'package:wedevassignment/app/data/user_model.dart';

class UserController extends GetxController{

  late String userToken;


  Rx<Rxn<User>> _userData = Rxn<User>().obs;
  User get user => _userData.value.value!;
}