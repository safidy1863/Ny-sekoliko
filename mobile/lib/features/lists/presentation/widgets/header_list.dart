import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/presentation/widgets/custom_textfield.dart';
import 'package:mobile/core/utils/constants/app_color.dart';

class HeaderList extends StatefulWidget {
  const HeaderList({Key? key}) : super(key: key);

  @override
  State<HeaderList> createState() => _HeaderListState();
}

class _HeaderListState extends State<HeaderList> {
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
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dateAndLevel(),
              const SizedBox(
                height: 5,
              ),
              _searchField(),
              const SizedBox(
                height: 5,
              ),
              _statisticOfPresent()
            ],
          )
        : Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_dateAndLevel(), _searchField()],
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: _statisticOfPresent(),
              ),
            ],
          );
  }

  Widget _dateAndLevel() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
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
          mainAxisSize: MainAxisSize.min,
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
    );
  }

  Widget _searchField() {
    return CustomTextField(
        hintText: "Recherche",
        isDense: true,
        controller: searchInput,
        onChanged: (String value) {
          print(value);
        },
        prefixIcon: const Icon(
          Icons.search_outlined,
          color: Colors.grey,
        ));
  }

  Widget _statisticOfPresent() {
    return Wrap(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
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
          mainAxisSize: MainAxisSize.min,
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
    );
  }
}
