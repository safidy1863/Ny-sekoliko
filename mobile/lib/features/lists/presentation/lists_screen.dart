import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/lists/presentation/widgets/header_list.dart';
import 'package:mobile/features/lists/presentation/widgets/list_table.dart';
import '/core/utils/constants/app_color.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double width = MediaQuery.of(context).size.width;
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
              onPressed: () {
              },
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
        width: width,
        height: double.infinity,
        child: Column(
          children: const [
            HeaderList(),
            SizedBox(
              height: 10,
            ),
            Expanded(child: ListTable())
          ],
        )
      ),
    );
  }
}
