import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/cart_provider.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/screens/detail_page.dart';
import 'package:shopping_app/screens/items_page.dart';
import 'package:shopping_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double startedAt = 0;
  double dragHeight = 140;
  double scale0 = 1;
  double scale1 = 1;
  double scale2 = 1;

  @override
  Widget build(BuildContext context) {
    var w = context.watch<CartProvider>();
    var sH = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Builder(builder: (context) {
        log(dragHeight.toString());

        scale0 = dragHeight <= 140
            ? 1
            : dragHeight >= 290
                ? 0
                : 1 - ((dragHeight - 140) / 150);
        scale1 = dragHeight <= 140
            ? 1
            : dragHeight >= 340
                ? 0
                : 1 - ((dragHeight - 140) / 200);

        scale2 = dragHeight <= 140
            ? 1
            : dragHeight >= 540
                ? 0
                : 1 - ((dragHeight - 140) / 400);

        return Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: dragHeight <= 139 ? 140 : dragHeight,
              child: ItemsPage(
                onItemTap: (model) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(model: model),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: sH - (dragHeight < 139 ? 140 : dragHeight),
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 30,
                  right: 30,
                  bottom: MediaQuery.paddingOf(context).bottom,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Opacity(
                            opacity: 1 - scale1,
                            child: const FittedBox(
                              child: Text(
                                "Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Transform.scale(
                              scale: 1 - scale2,
                              child: Opacity(
                                opacity: 1 - scale2,
                                child: RawScrollbar(
                                  thumbColor: Colors.red,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          itemCount: w.cartedItems.length,
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(height: 10),
                                          itemBuilder: (context, index) {
                                            ItemModel m = w.cartedItems[index];
                                            return ListTile(
                                              minLeadingWidth: 70,
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(m.image),
                                              ),
                                              title: Text(
                                                m.brand,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              subtitle: Text(
                                                m.name,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              trailing: Text(
                                                "\$${m.price}",
                                                style: TextStyle(
                                                  fontSize: 22,
                                                  color: AppColors.greyColor
                                                      .withOpacity(.5),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        ListTile(
                                          minLeadingWidth: 70,
                                          leading: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(.3),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Iconsax.car,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                          title: const Text("Delivery",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          trailing: Text(
                                            "\$30",
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: AppColors.greyColor
                                                  .withOpacity(.5),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 70,
                                          leading: const SizedBox(),
                                          title: Text(
                                            "All orders of \$40 or more qualify for FREE delivery.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: AppColors.greyColor),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12),
                                            child: LinearProgressIndicator(
                                              color: AppColors.primaryColor,
                                              backgroundColor: AppColors
                                                  .greyColor
                                                  .withOpacity(.4),
                                              value: .7,
                                            ),
                                          ),
                                          trailing: const SizedBox(),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total:",
                                              style: TextStyle(
                                                color: AppColors.greyColor,
                                                fontSize: 24,
                                              ),
                                            ),
                                            Text(
                                              "\$${(w.total + 40).toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        FractionallySizedBox(
                                          widthFactor: 1,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                foregroundColor:
                                                    AppColors.darkColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20)),
                                            onPressed: () {},
                                            child: const Text(
                                              "Next",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onPanUpdate: (_) {
                        int dy = _.globalPosition.dy.toInt();
                        dragHeight = sH - dy + startedAt;
                        setState(() {});
                      },
                      onPanEnd: (_) {
                        startedAt = 0;
                      },
                      onPanStart: (_) {
                        log("Started at ${_.localPosition.dy}");
                        startedAt = _.localPosition.dy;
                      },
                      dragStartBehavior: DragStartBehavior.down,
                      child: SizedBox(
                        height: 80,
                        child: Row(
                          children: [
                            Opacity(
                              opacity: scale1,
                              child: const Text(
                                "Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: Opacity(
                                  opacity: scale0,
                                  child: ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: w.cartedItems.length,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 10),
                                    itemBuilder: (context, index) {
                                      ItemModel m = w.cartedItems[index];
                                      return Transform.translate(
                                        offset: Offset(
                                          0,
                                          1 -
                                              ((1 - scale2) *
                                                      (w.cartedItems.length -
                                                          index)) *
                                                  40,
                                        ),
                                        child: Hero(
                                          tag: Key("${m.id}_carted"),
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: Image.asset(m.image),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            if (w.cartedItems.isNotEmpty)
                              Transform.scale(
                                scale: scale1,
                                child: Opacity(
                                  opacity: scale0,
                                  child: Container(
                                    padding: const EdgeInsets.all(28),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      "${w.cartedItems.length}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
