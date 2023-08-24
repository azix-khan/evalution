import 'package:evalution/ui/posts/post_screen.dart';
import 'package:evalution/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/round_button.dart';
import 'login_with_phone_number.dart';

// ignore: must_be_immutable
class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({super.key, required this.verificationId});

  final String verificationId;

  final auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final verificationCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: verificationCodeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone_android_outlined),
                hintText: '6 digit code',
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.deepPurple,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RoundButton(
              title: 'Verify',
              loading: loading,
              onTap: () async {
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: verificationCodeController.text.toString());

                setState(() {
                  loading = true;
                });
                try {
                  await auth.signInWithCredential(credential);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostScreen(),
                    ),
                  );
                } catch (e) {
                  Utils().toastMessage(
                    e.toString(),
                  );
                  setState(
                    () {
                      loading = false;
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
