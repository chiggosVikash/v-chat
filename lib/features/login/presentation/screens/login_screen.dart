import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:v_chat/features/login/presentation/providers/verify_phone_provider.dart';
import 'package:v_chat/features/login/presentation/widgets/login_as_google_w.dart';
import 'package:v_chat/features/login/presentation/widgets/login_as_phone_w.dart';
import 'package:v_chat/features/login/presentation/widgets/login_button_w.dart';
import 'package:v_chat/features/login/presentation/widgets/logo_w.dart';
import 'package:v_chat/features/login/presentation/widgets/verify_button_w.dart';
import 'package:v_chat/utils/extensions/context_extension.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeAddress = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const LogoW(),
              SizedBox(height: context.height * .1),
              LoginAsPhoneW(
                  phoneController: _phoneController,
                  otpController: _otpController,
                  nameController: _nameController,
                  surnameController: _surnameController),
              const SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  final verificationData = ref.watch(verifyPhoneNoProvider);
                  if (verificationData.value == null ||
                      verificationData.value!.otp == null) {
                    return VerifyButtonW(
                      phone: "+91${_phoneController.text.trim()}",
                    );
                  }
                  return const LoginButton();
                },
              ),
              SizedBox(
                height: context.height * .02,
              ),
              const LoginAsGoogleW()
            ],
          ),
        ),
      ),
    );
  }
}
