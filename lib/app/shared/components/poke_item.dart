import 'package:flutter/material.dart';

class PokeItem extends StatelessWidget {
  final Color? color;
  final Widget? image;
  final int? index;
  final String? name;

  const PokeItem({
    Key? key,
    this.color,
    this.image,
    this.index,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.red,
        ),
        child: Stack(
          children: [
            this.image!,
          ],
        ),
      ),
    );
  }
}
