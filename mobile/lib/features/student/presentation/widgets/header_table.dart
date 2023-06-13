part of '../student_screen.dart';

class HeaderTable extends StatelessWidget {
  const HeaderTable({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorWeight: 3,
      indicatorColor: AppColor.bluePrimary,
      indicatorSize: TabBarIndicatorSize.label,
      labelPadding: EdgeInsets.zero,
      labelStyle: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: FontWeight.w600),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black.withOpacity(0.5),
      tabs: const [
        Tab(
          text: "Aujourd'hui",
          height: 20,
        ),
        Tab(
          text: "Cette semaine",
          height: 20,
        )
      ],
    );
  }
}
