import 'package:get/get.dart';
import 'package:wedevassignment/app/controllers/user_controller.dart';
import 'package:wedevassignment/app/pages/profile_page.dart';
import 'package:wedevassignment/app/repositories/authRepo.dart';
import 'package:wedevassignment/others/helper/snack.dart';

class AuthController{

  final _repo = AuthRepo();

  Future<void> login(String name, String password) async{

    final _res = await _repo.login(name, password);

    if(_res.error){
      Snack.showError(message: _res.message);
    }else{

      UserController _userController = Get.find();
      _userController.userToken = _res.data['token'];

      Get.offAll(()=>ProfilePage());
    }

  }

  Future<bool> register(String name, String email, String password) async{

    final _res = await _repo.register(name, email, password);

    if(_res.error){
      Snack.showError(message: _res.message);
    }

    return _res.error;
  }

}