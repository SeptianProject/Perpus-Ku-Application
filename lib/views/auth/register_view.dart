import 'package:flutter/material.dart';
import 'package:perpus_digital/controllers/auth/register_controller.dart';
import 'package:perpus_digital/views/auth/login_view.dart';
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

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => RegisterController();

  Widget build(context, RegisterController controller) {
    controller.view = this;
    return Scaffold(
        backgroundColor: const Color(0xffFEFEFE),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50), child: AppbarCustom()),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          const SizedBox(height: 10),
          const TextTitle(text: 'Selamat Datang!'),
          const SizedBox(height: 10),
          const SizedBox(
              width: 300,
              child: TextSub(
                  text: 'Isi formulir pendaftaran untuk membuat akun baru.')),
          const SizedBox(height: 50),
          SizedBox(
              width: 320,
              child: Form(
                  key: controller.formKey,
                  child: Column(children: [
                    RTextField(
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        validator: Validator.name,
                        label: 'Masukkan nama anda',
                        preffixIcon: Icons.person_4),
                    const SizedBox(height: 20),
                    RTextField(
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.email,
                        label: 'Masukkan email',
                        preffixIcon: Icons.alternate_email_outlined),
                    const SizedBox(height: 20),
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
                        onPressed: () => controller.register(),
                        style:
                            controller.isSignup ? buttonStyleSign : buttonStyle,
                        child: controller.isSignup
                            ? const CircularProgressIndicator()
                            : textRegis)
                  ]))),
          const SizedBox(height: 40),
          const RowDivider(),
          const SizedBox(height: 40),
          RBlueContainer(
              height: 300,
              text: 'Sudah punya akun?',
              textLink: 'Segera Login',
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginView())))
        ]))));
  }
}
