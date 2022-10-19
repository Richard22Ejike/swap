
import 'package:flutter/material.dart';

import '../../../common/widgets/custembutton.dart';
import '../../../common/widgets/textFormField.dart';

import '../../../constants/GlobalVariables.dart';
import '../authService/authService.dart';
import '../widgets/animation.dart';
import 'authScreen.dart';

class registerScreen extends StatefulWidget {
  static const String routeName = '/register-screen';
  const registerScreen({Key? key}) : super(key: key);

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {


  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

 void navigateToAuthScreen() {
    Navigator.pushNamed(context, AuthScreen.routeName);
  }

 void signUpUser(){
  authService.signUpUser(
    context: context,
     email: _emailController.text, 
     password: _passwordController.text,
     name: _nameController.text,);
 }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(

        body: Stack(
            children: <Widget>[
              Container(
                height: size.height - 200,
                color: GlobalVariables.primaryColor,
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                top: keyboardOpen ? -size.height / 4.1 : 0.0,
                child: WaveWidget(
                  size: size,
                  yOffset: size.height / 3.0,
                  color: GlobalVariables.backgroundColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '\n Create Account',
                      style: TextStyle(
                        color: GlobalVariables.backgroundColor,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),

                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CustomTextField(
                        hintText: 'Name',
                        prefixIconData: Icons.person_add,
                        controller: _nameController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        hintText: 'Email',
                        prefixIconData: Icons.email_outlined,
                        controller: _emailController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      CustomTextField(
                        prefixIconData: Icons.password_outlined,
                        hintText: 'Password',
                        suffixIconData: Icons.remove_red_eye,
                        controller: _passwordController,
                      ),
                
                      const SizedBox(
                        height: 20.0,
                      ),
                      CustomButton(
                        text: 'Register',
                        color: GlobalVariables.primaryColor,
                        onTap: () {  
                          if(_signUpFormKey.currentState!.validate()){
                            signUpUser();
                           
                          }
                        },
                
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Already have an account ?',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          const SizedBox(width: 10.0),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/auth-screen');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: GlobalVariables.primaryColor,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 120,
                      )
                    ],
                  ),
                ),
              ),

            ]
        )
    );
  }
}

