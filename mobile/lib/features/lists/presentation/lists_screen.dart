import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/features/lists/presentation/widgets/student_item.dart';
import '/core/utils/constants/app_color.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Liste d'appel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "Intéraction homme machine",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Términer",
                style: TextStyle(color: AppColor.greenPrimary, fontSize: 14.sp),
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.grey,
                      size: 16.sp,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Date : 06/06/2023",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.grade,
                      color: Colors.grey,
                      size: 16.sp,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Niveau L1",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    )
                  ],
                )
              ],
            ),
            // TODO : Search textField
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                          color: AppColor.greenPrimary, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "80 étudiants présent(e)s",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                          color: AppColor.redPrimary, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "80 étudiants absent(e)s",
                      style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text("N°"),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 50,
                  child: Text("Matr"),
                ),
                Expanded(child: Text("Nom et prénoms")),
                Text("Prés"),
                SizedBox(
                  width: 10,
                ),
                Text("Abs"),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return StudentItem(
                    name: "RAKOTONIRINA Mialy",
                    matriculate: "2243",
                    number: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
