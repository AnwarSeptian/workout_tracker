import 'package:flutter/material.dart';
import 'package:workout_tracker/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.valueCheck});
  static const String id = "login_screen";
  final bool? valueCheck;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// final passwordController - TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool valueCheck = false;
  @override
  void initState() {
    super.initState();
    valueCheck = widget.valueCheck ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffffff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 16),
              buildLogin(),
              SizedBox(height: 30),
              buildWelcome(),
              SizedBox(height: 16),
              buildSignin(),
              SizedBox(height: 32),
              buildEmail(),
              SizedBox(height: 20),
              buildFieldemail(),
              SizedBox(height: 24),
              buildPassword(),
              SizedBox(height: 20),
              buildFieldpassword(),
              buildForgotpassword(),
              SizedBox(height: 14),
              buildButtonlogin(),
              SizedBox(height: 12),
              buildSignup(),
              buildOrsignwith(),
              SizedBox(height: 16),
              buildGoogleandfacebook(),
              SizedBox(height: 16),
              buildJoinus(),
              SizedBox(height: 16),
              buildSyarat(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSyarat() {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Text(
          "Saya menyetujui semua persyaratan yang berlaku",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  SizedBox buildButtonlogin() {
    return SizedBox(
      height: 56,
      width: 327,
      child: ElevatedButton(
        onPressed:
            _isChecked
                ? () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    HomeScreen.id,
                    (route) => false,
                  );
                }
                : null,

        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff283FB1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),

        child: Text(
          "Login",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Row buildJoinus() {
    return Row(
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
        TextButton(
          onPressed: _isChecked ? () {} : null,

          child: Text(
            "Join Us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xffEA9459),
            ),
          ),
        ),
      ],
    );
  }

  Row buildGoogleandfacebook() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            width: 155,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFAFAFA),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/iconGoogle (1).png",
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),

                  Text("Google", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: SizedBox(
            height: 48,
            width: 155,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFAFAFA),
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/btnSigninwithFb (1).png",
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),

                  Text("Facebook", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildOrsignwith() {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Color(0xffF2F2F2), thickness: 4, endIndent: 14),
        ),
        Text(
          "Or Sign In With",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
        ),
        Expanded(
          child: Divider(color: Color(0xffF2F2F2), thickness: 4, indent: 14),
        ),
      ],
    );
  }

  Row buildSignup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: "Don't have an account?",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ),

        TextButton(
          onPressed: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xffEA9459),
            ),
          ),
        ),
      ],
    );
  }

  Align buildForgotpassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: TextStyle(
            color: Color(0xffEA9459),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  TextField buildFieldpassword() {
    return TextField(
      onChanged: (value) {
        print(value);
        setState(() {});
      },
      onSubmitted: (value) {
        print(value);
      },
      obscureText: true,
      obscuringCharacter: "•",
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        suffixIcon: Icon(Icons.visibility_off, color: Color(0xff888888)),
      ),
    );
  }

  Text buildPassword() {
    return Text.rich(
      TextSpan(
        text: "Password",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
      ),
    );
  }

  TextField buildFieldemail() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
    );
  }

  Column buildEmail() {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: "Email Address",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Column buildSignin() {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: "Sign In your account",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Row buildWelcome() {
    return Row(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Column buildLogin() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 30),
            SizedBox(
              height: 28,
              width: 135,
              child: Row(
                children: [
                  InkWell(
                    splashColor: Colors.black12,
                    onTap: () {},

                    child: Icon(
                      Icons.navigate_before_sharp,
                      color: Color(0xff262626),
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 24),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
