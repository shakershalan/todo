import 'package:flutter/material.dart';
import 'package:untitled4/components/custom_text_filled.dart';
import 'package:untitled4/mytheme.dart';

import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';
  var usernameController = TextEditingController();
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.whiteColor,
      body: Stack(children: [
        Image(
          image: AssetImage(
            "assets/images/background.png",
          ),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        SingleChildScrollView(
          child: Form(
            key:formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                  ),
                  CustomTextFilled(
                    label: "user name",
                    controller: usernameController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter user name';
                      }

                      return null;
                    },
                  ),
                  CustomTextFilled(
                    label: "email address",
                    textInputType: TextInputType.emailAddress,
                    controller: emailAddressController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter email address';
                      }   bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if(!emailValid){
                        return "please enter valid email";
                      }

                      return null;
                    },
                  ),
                  CustomTextFilled(
                    label: "password",
                    textInputType: TextInputType.number,
                    controller: passwordController,
                    isPassword: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter password';
                      }
                      if(text.length < 6 ){
                        return 'password should be at least 6 chars';
                      }
                      return null;
                    },
                  ),
                  CustomTextFilled(
                    label: "confirmation password",
                    textInputType: TextInputType.number,
                    controller: confirmationController,
                    isPassword: true,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter confirmation password';
                      }
                      if(text != passwordController.text){
                        return "password doesn't match";
                      }

                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10)
                      ),
                        onPressed: (){
                      register();

                    }, child: Text('Register',style: Theme.of(context).textTheme.titleLarge,)),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context,LoginScreen.routeName);
                  },
                      child:  Text("Already have an account",style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 18
                      ),)
                  )
                ],
              )),
        ),
      ]),
    );
  }

  void register() {
    if(formKey.currentState?.validate()== true){

    }
  }
}
