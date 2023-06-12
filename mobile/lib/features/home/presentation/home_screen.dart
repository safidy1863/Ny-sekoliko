import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:mobile/features/home/presentation/widgets/session_item.dart';
import 'widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  List<String> seances = [
    "Interaction Homme- machine",
    "Algorithme",
    "Oracle database",
    "Interaction Homme- machine",
    "Algorithme",
    "Oracle database"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey, size: 30.sp),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: GFAvatar(
              backgroundImage: const AssetImage(
                "assets/images/user.jpg",
              ),
              shape: GFAvatarShape.square,
              borderRadius: BorderRadius.circular(8.r),
              size: GFSize.SMALL,
            ),
          )
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bonjour délégué Mialy R.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black
                  )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Date : 06/06/2023",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                        )
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Séances",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                )
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                itemCount: seances.length,
                itemBuilder: (context, index) {
                  return SessionItem(session: seances[index], teacher: "avec Mr William", period: "09h00 - 10h30",isCurrentSession: index == 1,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
