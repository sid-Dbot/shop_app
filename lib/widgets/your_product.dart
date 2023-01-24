import 'package:flutter/material.dart';

class YourProduct extends StatelessWidget {
  String imgUrl;
  String name;

  YourProduct({required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
      title: Text(name),
      trailing: Row(children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.yellow.shade900,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red.shade900,
            )),
      ]),
    );
  }
}
