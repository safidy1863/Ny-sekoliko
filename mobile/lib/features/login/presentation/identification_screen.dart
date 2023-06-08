import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile/core/presentation/widgets/custom_button.dart';
import 'package:mobile/core/presentation/widgets/custom_textfield.dart';
import 'package:mobile/core/utils/constants/app_color.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({Key? key}) : super(key: key);

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  bool isChecked = true;

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
            const CustomTextField(hintText: "Nom ou ID"),
            const CustomTextField(hintText: "Mot de passe"),
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
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            CustomButton(
                label: Text(
                  "S'identifier",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                  ),
                ),
                onPressed: () {}),
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
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
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
}
