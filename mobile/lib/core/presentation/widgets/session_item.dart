import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '/core/utils/constants/route_path.dart';
import '/core/utils/constants/app_color.dart';

class SessionItem extends StatelessWidget {
  const SessionItem({
    super.key,
    required this.session,
    required this.teacher,
    required this.period,
    this.isCurrentSession = false,
  });

  final String session;
  final String teacher;
  final String period;
  final bool isCurrentSession;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutePath.lists);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          gradient: isCurrentSession
              ? const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:  [
              AppColor.greenSecondary,
              AppColor.greenPrimary,
              AppColor.greenSecondary,
              AppColor.greenPrimary,
            ]) :
              LinearGradient(
              colors:  [
              AppColor.greenPrimary.withOpacity(0.42),
            AppColor.greenPrimary.withOpacity(0.42),
            ]
          ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(session,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    )),
            Text(
              teacher,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.7), fontSize: 10),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.7),),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Row(
                    children: [
                       Icon(
                        Icons.access_time_outlined,
                        color: Colors.white.withOpacity(0.7),
                        size: 12,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        period,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600
                            ),
                      ),
                    ],
                  ),
                ),
                isCurrentSession
                    ? const Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.white,
                        size: 14,
                      )
                    : const SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }
}
