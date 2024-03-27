import 'package:flutter/material.dart';
import 'package:shopping_app/common/scale_button.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/utils/colors.dart';

class ItemGrid extends StatefulWidget {
  const ItemGrid({super.key, required this.m, required this.onItemSelect});

  final ItemModel m;
  final void Function(ItemModel m) onItemSelect;

  @override
  State<ItemGrid> createState() => _ItemGridState();
}

class _ItemGridState extends State<ItemGrid> {
  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: () {
        widget.onItemSelect(widget.m);
      },
      child: Container(
        width: double.infinity,
        height: 270,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Center(
                    child: Hero(
                        tag: Key(widget.m.id),
                        child: Image.asset(widget.m.image)))),
            const SizedBox(height: 30),
            Text(
              "\$${widget.m.price}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "${widget.m.brand} ${widget.m.name}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '500g',
              style: TextStyle(
                color: AppColors.greyColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
