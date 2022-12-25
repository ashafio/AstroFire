import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';

class emailVerify extends StatefulWidget {

  @override
  State<emailVerify> createState() => _emailVerifyState();
}

class _emailVerifyState extends State<emailVerify> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();


  void sendOTP() async {
    EmailAuth emailAuth =  new EmailAuth(sessionName: "Sample session");
    var res = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5,
    );
    if(res){

    }
  }


  void verifyOTP() {
    print(EmailAuth.validate(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.value.text));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Verify Email"),
      ),
      body: Column(
        children: [
          Image.asset(
            "assets/img/astrologo.png",
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      labelText: "email",
                      suffixIcon: TextButton(
                        child: Text("Send OTP"),
                        onPressed: () {  },
                      )
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
          ),

        ],
      ),
    );
  }
}
