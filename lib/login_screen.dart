import 'package:flutter/material.dart';
import 'package:workout_tracker/constant/app_color.dart';
import 'package:workout_tracker/database/db_user.dart';
import 'package:workout_tracker/home_screen.dart';
import 'package:workout_tracker/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = "/login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisibility = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            buildBackground(),
            Container(color: Colors.black26),
            buildLayer(),
          ],
        ),
      ),
    );
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.cream2,
                ),
              ),
              height(12),
              Text(
                "Login to access your account",
                style: TextStyle(fontSize: 14, color: AppColor.cream2),
              ),
              height(24),
              buildTitle("Email Address"),
              height(12),
              buildTextField(
                hintText: "Enter your email",
                controller: emailController,
              ),
              height(16),
              buildTitle("Password"),
              height(12),
              buildTextField(
                hintText: "Enter your password",
                isPassword: true,
                controller: passwordController,
              ),
              height(12),

              height(24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () async {
                    final userData = await DbUser.login(
                      emailController.text,
                      passwordController.text,
                    );

                    if (userData != null) {
                      // PreferenceHandler.saveLogin(true);

                      print('data ada ${userData.toJson()}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login successful")),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Email atau password salah")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.cream2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.hitam1,
                    ),
                  ),
                ),
              ),
              height(48),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 12, color: AppColor.cream2),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blueGrey,

                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/banner6.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildTextField({
    String? hintText,
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      style: TextStyle(color: AppColor.hitam1, fontWeight: FontWeight.normal),
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        filled: true,
        fillColor: AppColor.cream2,
        suffixIcon:
            isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isVisibility = !isVisibility;
                    });
                  },
                  icon: Icon(
                    isVisibility ? Icons.visibility_off : Icons.visibility,
                    color: AppColor.cream2,
                  ),
                )
                : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: AppColor.cream2,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
