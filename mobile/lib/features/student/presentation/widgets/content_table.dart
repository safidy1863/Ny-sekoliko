part of '../student_screen.dart';

class ContentTable extends StatelessWidget {
  ContentTable({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

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
    return TabBarView(controller: tabController, children: [
      ListView.builder(
        padding: const EdgeInsets.only(bottom: 10),
        itemCount: seances.length,
        itemBuilder: (context, index) {
          return SessionItem(
            session: seances[index],
            teacher: "avec Mr William",
            period: "09h00 - 10h30",
            isCurrentSession: index == 1,
          );
        },
      ),
      SingleChildScrollView(
        child: Container(
          height: 650,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              DataTable(
                columnSpacing: 5,
                horizontalMargin: 10,
                dataRowHeight: 80,
                headingRowHeight: 30,
                columns: [
                  _dataColumnItem(""),
                  _dataColumnItem("7:30"),
                  _dataColumnItem("9:00"),
                  _dataColumnItem("10:30"),
                  _dataColumnItem("12:00")
                ],
                rows: [
                  _dataRow([
                    _dataCellFirst("L",context),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                  ]),
                  _dataRow([
                    _dataCellFirst("M",context),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                  ]),
                  _dataRow([
                    _dataCellFirst("M",context),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                  ]),
                  _dataRow([
                    _dataCellFirst("J",context),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                  ]),
                  _dataRow([
                    _dataCellFirst("V",context),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                  ]),
                  _dataRow([
                    _dataCellFirst("S",context),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                    _dataCell("Bonjour"),
                  ]),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
  DataColumn _dataColumnItem(String label) {
    return DataColumn(
        label: label == ""
            ? SizedBox(width: 0, child: Text(label))
            : SizedBox(
          width: 150,
          child: Text(label),
        ));
  }

  DataRow _dataRow(List<DataCell> cells) {
    return DataRow(cells: cells);
  }

  DataCell _dataCellFirst(String text, BuildContext context) {
    return DataCell(
      Text(text, style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),),
    );
  }
  DataCell _dataCell(String text) {
    return DataCell(
      SessionEdtItem()
    );
  }
}
