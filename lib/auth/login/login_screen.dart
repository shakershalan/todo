import 'package:flutter/material.dart';
import 'package:untitled4/Home/home_screen.dart';

import '../../components/custom_text_filled.dart';
import '../../mytheme.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';
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
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                  ),
                  CustomTextFilled(
                    label: "email address",
                    textInputType: TextInputType.emailAddress,
                    controller: emailAddressController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'please enter email address';
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid) {
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
                      if (text.length < 6) {
                        return 'password should be at least 6 chars';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10)),
                        onPressed: () {
                          Login();
                        
                        },
                        child: Text(
                          'Log in',
                          style: Theme.of(context).textTheme.titleLarge,
                        )),
                  ),
                 SizedBox(height: MediaQuery.of(context).size.height*.12,),
                  Row(

                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*.16,),
                      Text("Don't have an account?",style: Theme.of(context).textTheme.titleSmall,),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.routeName);
                          },
                          child: Text("SignUp",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),

                    ],
                  )
                ],
              )),
        ),
      ]),
    );
  }
  void Login() {
    if(formKey.currentState?.validate()== true){

    }
  }
}
