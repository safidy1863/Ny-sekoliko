import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '/core/utils/constants/app_color.dart';

class StudentItem extends StatefulWidget {
  const StudentItem({
    super.key,
    required this.name,
    required this.matriculate,
    required this.number,
  });

  final int number;
  final String matriculate;
  final String name;

  @override
  State<StudentItem> createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  bool present = false;
  bool absent = false;
  late TwilioFlutter twilioFlutter;

  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
      accountSid: "ACe3174b7b1a09f685062d352874f32aa8",
      authToken: "a8abb0041e86038e7cbb7b7a534b95d8",
      twilioNumber: "+13614507867",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text(
            widget.number.toString(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: AppColor.grayPrimary,
                  borderRadius: BorderRadius.circular(5.r)),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(
                      widget.matriculate,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.name,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                  GFCheckbox(
                    onChanged: (value) {
                      if (present) {
                        setState(() {
                          present = false;
                        });
                      } else {
                        setState(() {
                          present = true;
                          absent = false;
                        });
                      }
                      print("present $value");
                    },
                    value: present,
                    size: 18.sp,
                    activeBgColor: AppColor.greenPrimary,
                    activeBorderColor: Colors.transparent,
                    activeIcon: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ),
                  GFCheckbox(
                    onChanged: (value) {
                      if (absent) {
                        setState(() {
                          absent = false;
                        });
                      } else {
                        setState(() {
                          absent = true;
                          present = false;
                        });
                        twilioFlutter.sendSMS(
                            toNumber: "+261346397518",
                            messageBody: "Vous êtes absent aujourd'hui");
                      }
                      print("false $value");
                    },
                    value: absent,
                    size: 18.sp,
                    activeBgColor: AppColor.redPrimary.withOpacity(0.7),
                    activeBorderColor: Colors.transparent,
                    activeIcon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
