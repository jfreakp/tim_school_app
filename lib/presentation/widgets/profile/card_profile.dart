import 'package:flutter/material.dart';

class CardProfile extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final IconData icon; 

  const CardProfile({super.key, this.title, this.subTitle, required this.icon});
  
  
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(icon),
              title: title != null? Text(title!):null,
              subtitle: subTitle != null? Text(subTitle!):null,
            ),
          ],
        ),
    );
  }
}