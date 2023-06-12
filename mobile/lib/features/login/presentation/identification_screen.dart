import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

import '/core/presentation/widgets/custom_button.dart';
import '/core/presentation/widgets/custom_textfield.dart';
import '/core/utils/constants/app_color.dart';
import '/core/utils/constants/route_path.dart';
import '/core/utils/enums/load_status.dart';
import '/core/utils/validation/ValidationForm.dart';
import 'bloc/auth_bloc.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({Key? key}) : super(key: key);

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  bool isChecked = true;
  bool showPassword = false;
  late TextEditingController nameInput;
  late TextEditingController passwordInput;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameInput = TextEditingController();
    passwordInput = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameInput.dispose();
    passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(
              height: 120.h,
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 130.w,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Identifiez-vous",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.status.isSuccess) {
                  _showSnackBar();
                  print(state.currentUser);
                  context.go(RoutePath.home);
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: "Nom ou ID",
                      controller: nameInput,
                      validator: ValidationBuilder(locale: ValidationForm())
                          .required()
                          .maxLength(50)
                          .build(),
                    ),
                    CustomTextField(
                      hintText: "Mot de passe",
                      controller: passwordInput,
                      isPassword: !showPassword,
                      textInputType: TextInputType.visiblePassword,
                      validator: ValidationBuilder(locale: ValidationForm())
                          .required()
                          .maxLength(50)
                          .build(),
                      suffixIcon: TextButton(
                          style: const ButtonStyle(
                            overlayColor: MaterialStatePropertyAll<Color>(
                                Colors.transparent),
                          ),
                          onPressed: () => setState(() {
                                showPassword = !showPassword;
                              }),
                          child: Icon(
                            !showPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GFCheckbox(
                  onChanged: (value) {},
                  size: 20.sp,
                  activeBgColor: AppColor.greenPrimary,
                  value: isChecked,
                  activeIcon: Icon(
                    Icons.check,
                    size: 16.sp,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text(
                    "Se souvenir de moi",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                  ),
                )
              ],
            ),
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return CustomButton(
                  label: state.status.isLoading
                      ? const SpinKitWave(
                          color: Colors.white,
                          size: 14,
                          duration: Duration(milliseconds: 1200),
                        )
                      : Text(
                          "S'identifier",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(LoginEvent(
                            name: nameInput.text,
                            password: passwordInput.text,
                          ));
                    }
                  });
            }),
            SizedBox(
              height: 20,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "J'ai oublié mon mot de passe",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSnackBar() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.all(0.0),
      content: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColor.greenPrimary, AppColor.greenSecondary],
          ),
        ),
        child: Text(
          'Rebonjour, bienvenue dans Ny Sekoliko !',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
