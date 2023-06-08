import 'package:data_fetch_getx_mvc/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/product_card.dart';

class Homepage extends StatelessWidget {
  final ProductsController productsController = Get.put(ProductsController());
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Fluppy',
                    style: TextStyle(
                        fontFamily: 'arial',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.grid_view)),
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (productsController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productsController.productsList.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return ProductTile(productsController.productsList[index]);
                },
                staggeredTileBuilder: ((index) => StaggeredTile.fit(1)),
              );
            }
          }))
        ],
      ),
    );
  }
}
