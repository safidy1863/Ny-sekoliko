import 'package:flutter/material.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.label,
    this.value,
    this.readOnly = false,
  });

  final String label;
  final String? value;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black.withOpacity(0.5)),
          ),
          TextFormField(
            initialValue: value,
            readOnly: readOnly,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Colors.black),
            decoration: InputDecoration(
              hintText: label.toLowerCase(),
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.black.withOpacity(0.3)),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              isDense: true,
              isCollapsed: true,
            ),
          )
        ],
      ),
    );
  }
}
