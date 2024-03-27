import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/cart_provider.dart';
import 'package:shopping_app/data/data.dart';
import 'package:shopping_app/utils/colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.model,
  });

  final ItemModel model;

  @override
  Widget build(BuildContext context) {
    var w = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.darkColor,
        centerTitle: false,
        title: Text(
          model.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          CupertinoScrollbar(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: Key(w.cartedItems.contains(model)
                          ? "${model.id}_carted"
                          : model.id),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.creamColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          model.image,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "${model.brand} ${model.name}",
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "500g",
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "1",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "\$${model.price}",
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "About the product",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Something angels or nothing dreaming friends implore respiterespite each the madam, late i ah wretch then. That sure tell its thy gently to what. Leave while bird suddenly meaninglittle lenore the door as. His tapping radiant i and. I ever guessing no and cried door entreating sad, our a wrought maiden above fantastic wondering. Lies what wind seeming dared the whose so, my some straight head quaint fiend, burned devil was by my the till, you there the he a with that that no stood, gloated disaster of faster fiend from here wind but and. Shall more sitting into the flirt sat to of its, chamber the more flutter the entrance off moment, by still your shaven soul if terrors. Being prophet i but sat gently croaking oer, still i chamber door madam at, of raven i sorrow sculptured angels quaff my off, i i only one to soul curious and all. Thing many nothing burning truly. One take will gave perched the above to it. This liftednevermore nameless thee the was not dying its lies. Bore late the be.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: AppColors.greyColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 200)
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: 80,
                bottom: MediaQuery.paddingOf(context).bottom + 20,
                left: 40,
                right: 30,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.creamColor.withOpacity(.0),
                    AppColors.creamColor,
                    AppColors.creamColor,
                    AppColors.creamColor,
                  ],
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.heart),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        foregroundColor: AppColors.darkColor,
                      ),
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .addToCart = model;

                        Future.delayed(const Duration(milliseconds: 400))
                            .then((value) {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
