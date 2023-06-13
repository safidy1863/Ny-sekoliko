import 'package:flutter/material.dart';
import 'package:mobile/features/lists/presentation/widgets/student_item.dart';

class ListTable extends StatelessWidget {
  const ListTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
    );
  }
}
