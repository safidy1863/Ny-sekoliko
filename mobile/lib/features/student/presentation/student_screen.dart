import 'package:flutter/material.dart';
import '/core/presentation/widgets/custom_app_bar_with_image.dart';
import '/core/presentation/widgets/custom_drawer.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWithImage(
        currentUser: AssetImage(
          "assets/images/user.jpg",
        ),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bonjour délégué Mialy R.",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text("Date : 06/06/2023",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        )),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TabBar(controller: _tabController, tabs: const [
              Tab(
                text: "Aujourd'hui",
              ),
              Tab(
                text: "Cette semaine",
              )
            ],
              labelStyle: Theme.of(context).textTheme.bodySmall,
              labelColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
