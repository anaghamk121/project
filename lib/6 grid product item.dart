import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';
import 'package:project/6%20product.dart';
import 'package:project/7%20details%20page.dart';
import 'package:provider/provider.dart';

class gridproductitem extends StatelessWidget {
  const gridproductitem({
    Key? key,
    //required this.id,required this.title,required this.image
  }) : super(key: key);

//final String id,title,image;
  @override
  Widget build(BuildContext context) {
  //  final plant = Provider.of<Plant>(context);
    return Consumer<Plant>(builder: (context, plant, _) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: GridTile(
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  detailspage.id,
                  arguments: plant.id,
                );
              },
              child: Image.network(plant.image)),
          footer: GridTileBar(
            title: Text(
              plant.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
            backgroundColor: Colors.grey,
            leading: IconButton(
              icon: plant.isfavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                plant.toggleIsFav();
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ),
      );
    });
  }
}
