import 'package:data_fetch_getx_mvc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductTile extends StatelessWidget {
  final Products products;

  const ProductTile(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    products.image.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {}, 
                        icon: products.rating != null
                        ?Icon(Icons.favorite_rounded)
                        :Icon(Icons.favorite_border)),
                    ))
              ],
            ),
            SizedBox(height: 8,),
            Text(
              products.title.toString(),
              maxLines: 2,
              style: TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("4",
                  style: TextStyle(color: Colors.white),),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Text('\$${products.price}',
            style: TextStyle(fontSize: 32, fontFamily: 'avenir'),),
          ],
        ),
      ),
    );
  }
}
