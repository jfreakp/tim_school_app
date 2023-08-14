import 'package:flutter/material.dart';

class StudentListInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  const StudentListInfo(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 180),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
