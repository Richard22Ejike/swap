import 'package:flutter/material.dart';

import '../../../common/widgets/custembutton.dart';
import '../../../common/widgets/textFormField.dart';

import '../../../constants/GlobalVariables.dart';
import '../authService/authService.dart';
import '../widgets/animation.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final AuthService authService = AuthService();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

   void signInUser(){
  authService.signInUser(
    context: context,
     email: _emailController.text, 
     password: _passwordController.text,
    );
 }






  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(

      body: Stack(
        children: <Widget>[
            Container(
            height: size.height - 100,
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
                    'Welcome to Swap\n          Login',
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
              key: _signInFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  CustomTextField(
                    hintText: 'Email',
                    prefixIconData: Icons.email_outlined,
                    controller: _emailController,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CustomTextField(
                        prefixIconData: Icons.password_outlined,
                        hintText: 'Password',
                        suffixIconData: Icons.remove_red_eye,
                        controller: _passwordController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: GlobalVariables.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    text: 'Login',
                    color: GlobalVariables.primaryColor,
                                        onTap: () {  
                            if(_signInFormKey.currentState!.validate()){
                              signInUser();
                             
                            }
                          },
                  
            
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'New to Swap ?',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      const SizedBox(width: 10.0),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/register-screen');
                        },
                        child: const Text(
                          'Register',
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

