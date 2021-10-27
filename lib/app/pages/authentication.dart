import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedevassignment/app/controllers/auth_controller.dart';
import 'package:wedevassignment/app/widgets/custom_button.dart';
import 'package:wedevassignment/app/widgets/custom_text_field.dart';
import 'package:wedevassignment/others/helper/snack.dart';
import 'package:wedevassignment/others/helper/string_validator.dart';


class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  final _validators = CValidator();
  final _controller = AuthController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool isRegister = false;
  bool authLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: Get.height,
            padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
            child: Stack(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),

                      CTextField(
                        controller: _nameController,
                        labelText: 'Name',
                        hintText: 'Enter your name',
                        validator: _validators.nameValidator,
                      ),
                      SizedBox(height: 12),
                      if(isRegister)CTextField(
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        validator: _validators.emailValidator,
                      ),
                      SizedBox(height: 12),
                      CTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: 'Your password',
                        passField: true,
                        validator: _validators.passwordValidator,
                      ),


                      SizedBox(height: 40),


                      CButton(
                        loading: authLoading,
                        onTap: authLoading ? (){} : () async{
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              authLoading = true;
                            });

                            if(isRegister){
                              final error = await _controller.register(_nameController.text, _emailController.text, _passwordController.text);
                              if(!error){
                                setState(() {
                                  isRegister = false;
                                });
                                Snack.top(title: 'Success', message: 'Please login to continue');
                              }
                            }else{
                              await _controller.login(_nameController.text, _passwordController.text);
                            }

                            setState(() {
                              authLoading = false;
                            });
                          }
                        },
                        title: isRegister ? 'Sign up' : 'Sign in',
                        onPrimary: Colors.black,
                      ),
                    ],
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 24,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: isRegister ? 'Already have an account? ' : 'Don\'t have account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff171518),
                            fontSize: 16
                        ),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = (){
                                if(!authLoading){
                                  setState(() {
                                    isRegister = !isRegister;
                                  });
                                }
                              },
                              text: isRegister ? 'Sign in' : 'Sign up',
                              style: TextStyle(
                                  decoration: TextDecoration.underline
                              )
                          )
                        ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}