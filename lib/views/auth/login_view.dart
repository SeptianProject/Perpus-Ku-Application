import 'package:flutter/material.dart';
import 'package:perpus_digital/controllers/auth/login_controller.dart';
import 'package:perpus_digital/widgets/appbar.dart';
import 'package:perpus_digital/widgets/button/elevated_button.dart';
import 'package:perpus_digital/widgets/button/styleform.dart';
import 'package:perpus_digital/widgets/button/text_button.dart';
import 'package:perpus_digital/widgets/component/blue_container.dart';
import 'package:perpus_digital/widgets/component/row_divider.dart';
import 'package:perpus_digital/widgets/formField/text_field.dart';
import 'package:perpus_digital/widgets/formField/validator.dart';
import 'package:perpus_digital/widgets/text/text_sub.dart';
import 'package:perpus_digital/widgets/text/text_title.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => LoginController();

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Scaffold(
        backgroundColor: const Color(0xffFEFEFE),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: AppbarCustom()),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 10),
            const TextTitle(text: 'Selamat Datang!'),
            const SizedBox(height: 10),
            const TextSub(text: 'Silakan masuk untuk akses penuh.'),
            const SizedBox(height: 60),
            SizedBox(
                width: 320,
                child: Form(
                    key: controller.formKey,
                    child: Column(children: [
                      RTextField(
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.email,
                          label: 'Masukkan email',
                          preffixIcon: Icons.alternate_email_outlined),
                      const SizedBox(height: 25),
                      RTextField(
                          obscureText: controller.obscured,
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: Validator.password,
                          label: 'Masukkan password',
                          preffixIcon: Icons.lock_outline,
                          suffixIcon: GestureDetector(
                              onTap: controller.toggleObscured,
                              child: Icon(
                                  controller.obscured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xff444444),
                                  size: 22))),
                      const SizedBox(height: 50),
                      RButton(
                          onPressed: () => controller.login(),
                          style: controller.isSignin
                              ? buttonStyleSign
                              : buttonStyle,
                          child: controller.isSignin
                              ? const CircularProgressIndicator()
                              : textLogin),
                    ]))),
            const SizedBox(height: 60),
            const RowDivider(),
            const SizedBox(height: 60),
            const RBlueContainer(height: 340),
          ],
        ))));
  }
}
