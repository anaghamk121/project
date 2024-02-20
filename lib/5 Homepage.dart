import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/6%20main%20shopping%20screen.dart';

import 'main.dart';

//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   /// hive initialisation
//   await Hive.initFlutter();
//   await Hive.openBox('task_box');
//   runApp(MaterialApp(
//         useInheritedMediaQuery: true,
//         debugShowCheckedModeBanner: false,
//         home:
//         mainscreen(),
//   ));
// }

class mainscreen extends StatefulWidget {
  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  var screen = [
   // MyHomePage(),
    //tools(),
    //review(),
    //cart(),
    //profile(),
  ];
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            // expandedHeight: 150,
            backgroundColor: Colors.white,
            //floating: true,
            //pinned: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                    )),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => notification()));
                  },
                  icon: Icon(
                    Icons.notification_add,
                    color: Colors.green,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wishlist()));
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ))
            ],
            bottom: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Container(
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadiusDirectional.circular(150)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Find your buddy",
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.keyboard_voice_outlined,
                        color: Colors.white,
                      ),
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                screen[index],
              ],
            )
          ]))
        ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[700],
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.black12,
          currentIndex: index,
          onTap: (tapindex) {
            setState(() {
              index = tapindex;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => mainshoppingscreen()));
                  },
                  icon: Icon(Icons.home_rounded),
                ),
                label: "home",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => review()));
                  },
                  icon: Icon(Icons.add),
                ),
                label: "Review",
                backgroundColor: Colors.green),
            /*  BottomNavigationBarItem(icon: IconButton(onPressed: ()
            {Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>cart()));},
              icon:Icon( Icons.shopping_cart),),label: "Cart",
                backgroundColor: Colors.green),*/
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Profile()));
                  },
                  icon: Icon(Icons.account_circle),
                ),
                label: "Profile",
                backgroundColor: Colors.green),
          ],
        )
        /*bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,

        backgroundColor: Colors.green[800],
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.water_drop_outlined, title: "Tools"),
          TabItem(icon: Icons.add, title: "Add"),
          TabItem(icon: Icons.shopping_cart, title: "cart"),
          TabItem(icon: Icons.account_circle, title: "Profile"),
        ],
        initialActiveIndex: 1,
        onTap: (int i) => print('click index=$i'),
      ),*/
        );
  }
}
