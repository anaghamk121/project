import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.darT';
import 'package:project/6%20grid%20product%20item.dart';
import 'package:provider/provider.dart';
import '6 product.dart';
import '7 provider.dart';
import '8 cart provider.dart';
import '8 cart screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ ChangeNotifierProvider(
      create: (BuildContext context) => Plants()),
  ChangeNotifierProvider(
  create: (BuildContext context) => Cart()),
    /*child: ChangeNotifierProvider(
      create: (BuildContext context) => Plants(),*/
     ], child: MaterialApp(routes: {
       '/Cart' :(context) => CartScreen(),
  },
        home: mainshoppingscreen(),
      ),
    ),
  );
}

class mainshoppingscreen extends StatefulWidget {
  static const id = '/mainshoppingscreen';

  // static const id = '/detailspage';
  mainshoppingscreen({Key? key}) : super(key: key);

  @override
  State<mainshoppingscreen> createState() => _mainshoppingscreenState();
}

class _mainshoppingscreenState extends State<mainshoppingscreen> {
  bool showfav = false;
/*
  final List<Plant> indoorplants = [
    Plant(
        id: "1",
        title: "Aglaonema Queen Plant",
        scientificname: "Aglaonema modestum",
        image:
            'https://media.istockphoto.com/id/1263431301/photo/aglaonema-maria-houseplant-cuttings-in-a-red-glass-vase-in-front-of-a-white-wall-chinese.jpg?s=612x612&w=0&k=20&c=2T9TXgR8kpCXG6SGQJHE4Sy1YPfHSmHhArI_ZcAm0Zw=',
        description:
            "Aglaonema silver queen has attractive, silvery-green, lance-shaped leaves."
            " The marbled darker green color allows this Chinese Evergreen to tolerate some degree of shade. The leaves tend to grow in an upright manner",
        price: 265),
    Plant(
      id: "2",
      title: 'Peace Lily',
      scientificname: 'Spathiphyllum',
      image:
          'https://www.ugaoo.com/cdn/shop/products/GroPot.jpg?v=1704867612&width=375',
      description:
          "The bigger cousin of the beautiful peace lily, the Spathiphyllum Sensation is one of the most loved peace lily varieties in the world. "
          "In addition to its majestic white flowers, it has large, glossy, oblong leaves that are excellent air purifiers. The best part is its ease of growth and low-maintenance nature which makes it a perfect choice for first-time gardeners.",
      price: 200,
    ),
    Plant(
      id: "3",
      title: "Algerian Ivy",
      scientificname: "Hedera canariensis",
      image:
          "https://hips.hearstapps.com/hmg-prod/images/english-ivy-hedera-marengo-w-3-6488ad58cace8.jpg?crop=1xw:1xh;center,top&resize=980:*",
      description:
          "This fast-growing evergreen has thick, shiny, deep green, lobed leaves with reddish stems. New growth is a light green color. ",
      price: 499,
    ),
    Plant(
      id: "4",
      title: "Blue Star Fern",
      scientificname: "Phlebodium aureum blue",
      image:
          'https://www.ugaoo.com/cdn/shop/products/LagosPlanter-Grey_f26c8dee-c8ce-4e1a-bec7-86006f560c98.jpg?v=1680418283&width=375',
      description:
          "Ferns as houseplants tend to be one of the trickier species to make thrive due to our dry, centrally heated homes. However, the Blue Star Fern is one of the easiest houseplant ferns there is and it is a real stunner.",
      price: 299,
    ),
    Plant(
        id: "5",
        title: "Jade Plant Mini",
        scientificname: 'Crassula ovata Minima',
        image:
            'https://www.ugaoo.com/cdn/shop/products/LagosPlanter-Grey_f26c8dee-c8ce-4e1a-bec7-86006f560c98.jpg?v=1680418283&width=375',
        description:
            'Crassula ovata is a common houseplant that is usually called jade plant, or less frequently referred to as friendship plant, money plant, or silver dollar plant.',
        price: 699),
    Plant(
        id: "6",
        title: "Yucca Sliver Plant",
        scientificname: 'Yucca Elephantipes',
        image:
            "https://www.ugaoo.com/cdn/shop/files/AImage_0356aa2c-8ed4-4355-973e-782cf61028c2.jpg?v=1702460741&width=375",
        description:
            'Elevate your indoor and outdoor spaces with the enchanting Silver Yucca Plant, a botanical masterpiece that effortlessly blends elegance with resilience. With its striking architectural presence and minimal care requirements, the Silver Yucca Plant is the perfect choice for both seasoned plant enthusiasts and beginners alike. ',
        price: 264),
    Plant(
        id: "7",
        title: "Broken Heart Plant",
        scientificname: 'monstera adansonii',
        image:
            "https://www.ugaoo.com/cdn/shop/files/small-atlantis-midnight-blue-broken-heart-plant-32517995724932.jpg?v=1688732267&width=375",
        description:
            'The Broken Heart Plant transcends its role as a houseplant. It serves as a powerful reminder of emotional healing and resilience through plants. Many individuals find solace in nurturing this plant, as it symbolizes the mending of a broken heart.',
        price: 89),
    Plant(
        id: "8",
        title: "Peperomia Green Plant",
        scientificname: 'Peperomia obstusifolia',
        image:
            "https://www.ugaoo.com/cdn/shop/products/LagosPlanter-Mocca_0ade021a-89b8-4814-93d9-2d7381decd99.jpg?v=1693639925&width=375",
        description:
            'The Peperomia Green is a great houseplant. It is low maintenance, looks beautiful and purifies air. An ornamental plant with succulent like fleshy, thick green leaves that adapts and grows very well in a variety of conditions. ',
        price: 199),
    Plant(
        id: "9",
        title: "Snake Plant-Golden Hahnii",
        scientificname: "Dracaena trifasciata",
        image:
            "https://www.ugaoo.com/cdn/shop/products/AtlantisPlanter-Teal_3edaf641-904e-485f-9d80-e11293f26546.jpg?v=1680435202&width=375",
        description:
            "Snake plant also known as Dracaena trifasciata or Sansevieria is a hardy plant of Asparagaceae having long dark green leaves that is the native to west Africa. It is also believed to have air purifying properties.",
        price: 160),
    Plant(
        id: "10",
        title: "Stromanthe Triostar Plant",
        scientificname: "Stromanthe sanguinea",
        image:
            "https://www.ugaoo.com/cdn/shop/products/Krish12Planter-Ivory_3f18466a-68f8-4763-8a18-fe58269b0f6a.jpg?v=1681551837&width=375",
        description:
            "It is a common houseplant in temperate climates, valued for its striking variegated leaves with purple undersides. It can grow outside in a humid tropical climate, but needs light shade in the afternoon and must be protected from high winds.[2]",
        price: 359)
  ];
*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Let's plant"),
          actions: [PopupMenuButton(
              onSelected: (int selectedVal){
            if (selectedVal == 0){
              setState(() {
                showfav = true;
              });
            }
            if (selectedVal == 1){
              setState(() {
                showfav = false;
              });
            }
    },icon:  Icon(Icons.favorite),
              itemBuilder:(_){
            return [
              PopupMenuItem(child: Text("favorites"),value: 0,),
              PopupMenuItem(child: Text("remove filters"),value: 1,)
            ];
          }),IconButton(onPressed: (){Navigator.of(context).pushNamed(CartScreen.id);},
            icon: Icon(Icons.shopping_cart_checkout),
  )],
        ),
        body: PlantsGrid(
          isfav :showfav,
        ),
      ),
    );
  }
}

class PlantsGrid extends StatelessWidget {
  const PlantsGrid({
    Key? key, required this.isfav,
  }) : super(key: key);
  final bool isfav;

  @override
  Widget build(BuildContext context) {
    final plantDate = Provider.of<Plants>(context);
    final indoorPlants =  isfav ? plantDate. favoritePlants:plantDate.indoorPlants;
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30),
      itemBuilder: (context, index) {
        return ChangeNotifierProvider<Plant>.value(value: indoorPlants[index],
     // (create: (BuildContext context) => indoorPlants[index],
        child:
            gridproductitem(
              /*  id: indoorPlants[index].id,
            title: indoorPlants[index].title,
            image: indoorPlants[index].image,*/
                ));
      },
      itemCount: indoorPlants.length,
    );
  }
}
