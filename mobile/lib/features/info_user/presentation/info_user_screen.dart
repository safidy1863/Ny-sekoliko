import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/presentation/widgets/custom_app_bar_simple.dart';
import 'package:mobile/core/presentation/widgets/custom_button.dart';
import 'package:mobile/core/utils/constants/app_color.dart';
import 'package:mobile/features/info_user/presentation/widgets/info_textField.dart';
import 'widgets/avatar_user.dart';

class InfoUserScreen extends StatelessWidget {
  const InfoUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSimple(title: "Votre profile",leadingPressed: () {
        context.pop();
      }),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 70,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const AvatarUser(),
                  const InfoTextField(
                    label: "Niveau",
                    value: "Licence 1",
                    readOnly: true,
                  ),
                  const InfoTextField(
                    label: "Numéro matricule",
                    value: "2247",
                    readOnly: true,
                  ),
                  const InfoTextField(
                    label: "Parcours",
                    value: "Génie Logiciel et Base de données",
                    readOnly: true,
                  ),
                  const InfoTextField(
                    label: "Téléphone",
                    value: "034 57 067 89",
                  ),
                  const InfoTextField(
                    label: "Date de naissance",
                    value: "14 Août 2002",
                  ),
                  const InfoTextField(
                    label: "Sexe",
                    value: "Homme",
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 120, maxHeight: 40),
                      child: CustomButton(
                          label: Text(
                            "Modifications",
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          onPressed: () {}),
                    ),
                  )
                ],
              )),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.copyright,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          "Copyright 2023",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey,
                                  ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
