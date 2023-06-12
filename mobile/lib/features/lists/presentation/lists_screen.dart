import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/presentation/widgets/custom_textfield.dart';
import 'package:mobile/features/lists/presentation/widgets/student_item.dart';
import '/core/utils/constants/app_color.dart';

class ListsScreen extends StatefulWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  State<ListsScreen> createState() => _ListsScreenState();
}

class _ListsScreenState extends State<ListsScreen> {

  late TextEditingController searchInput;

  @override
  void initState() {
    searchInput = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 18,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Liste d'appel",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
            Text(
              "Intéraction homme machine",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Términer",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColor.greenPrimary,
                    ),
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
                      size: 14.sp,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Date : 06/06/2023",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
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
                      size: 14.sp,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Niveau L1",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
             CustomTextField(
                hintText: "Recherche",
                isDense: true,
                controller: searchInput,
                onChanged: (String value) {
                  print(value);
                },
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: Colors.grey,
                )),
            const SizedBox(
              height: 5,
            ),
            Wrap(
              children: [
                Row(
                  children: [
                    Container(
                      width: 10.sp,
                      height: 10.sp,
                      decoration: const BoxDecoration(
                          color: AppColor.greenPrimary, shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "80 étudiants présent(e)s",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 10.sp,
                      height: 10.sp,
                      decoration: BoxDecoration(
                          color: AppColor.redPrimary.withOpacity(0.6),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "80 étudiants absent(e)s",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "N°",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    "Matr",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
                Expanded(
                    child: Text(
                  "Nom et prénoms",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                )),
                Text(
                  "Prés",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Abs",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(
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
