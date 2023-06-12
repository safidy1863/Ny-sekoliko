import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';

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

  bool present = true;


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
                borderRadius: BorderRadius.circular(5.r)
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Text(widget.matriculate,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                    ),),
                  ),
                  Expanded(
                    child: Text(widget.name,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                    ),),
                  ),
                  GFCheckbox(
                    onChanged: (value) {},
                    value: present,
                    size: 18.sp,
                    activeBgColor: AppColor.greenPrimary,
                    activeBorderColor: Colors.transparent,
                    activeIcon: Icon(Icons.check, color: Colors.white,size: 14.sp,),
                  ),
                  GFCheckbox(
                    onChanged: (value) {},
                    value: present,
                    size: 18.sp,
                    activeBgColor: AppColor.redPrimary.withOpacity(0.7),
                    activeBorderColor: Colors.transparent,
                    activeIcon: Icon(Icons.close, color: Colors.white,size: 14.sp,),
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
