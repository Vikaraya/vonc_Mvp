import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vonc/view/pages/Shopping_cart_page.dart';
import 'package:vonc/view/pages/bell.dart';
import 'package:vonc/view/pages/favourite_page.dart';
import 'package:vonc/view/pages/home_screen.dart';
import 'package:vonc/view/pages/user_settings.dart';
//import 'package:vonc/view/pages/vonc_io.dart';

class VoncMainScreen extends StatefulWidget {
  const VoncMainScreen({super.key, user});

  @override
  State<VoncMainScreen> createState() => _VoncMainScreenState();
}

class _VoncMainScreenState extends State<VoncMainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const FavouritePage(),
    // const VoncIo(),
    const ShoppingCartPage(),
    const UserSettings(),
  ];

  final List<Widget> _navigationItem = [
    const Icon(
      Icons.home_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.favorite_border_outlined,
      color: Colors.white,
    ),
    // Image(
    //   image: AssetImage("assets/icons/vonc_io_main-removebg-preview.png"),
    //   fit: BoxFit.fill,
    //   height: 50,
    //   width: 50,
    // ),
    const Icon(
      Icons.shopping_cart_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.person_outline_rounded,
      color: Colors.white,
    ),
  ];

  //late final GoogleSignInAccount user;

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(
                colors: [
                  Color(0xff000000),
                  Color(0xff3533cd),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/img/V_O_n_C_Logo crop-min.png",
                height: 30,
                width: 50,
              ),
              const SizedBox(
                width: 2,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.542,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(
                    wordSpacing: 2,
                    height: 30,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      gapPadding: 0,
                      borderSide: BorderSide(
                        color: Colors.white10,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.search,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 15,
                          )),
                    ),
                    hintText: "",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bell()),
                  );
                },
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 2,
              ),
              Image.asset(
                "assets/icons/vonc wathsapp logo crop.png",
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            backgroundColor: Colors.transparent,
            color: Colors.indigoAccent,
            index: _currentIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                  setState(() {
                    _currentIndex = 0;
                  });
                  break;
                case 1:
                  setState(() {
                    _currentIndex = 1;
                  });
                  break;
                case 2:
                  setState(() {
                    _currentIndex = 2;
                  });
                  break;
                case 3:
                  setState(() {
                    _currentIndex = 3;
                  });
                  break;
                // case 4:
                //   setState(() {
                //     _currentIndex = 4;
                //   });
              }
            },
            items: _navigationItem),
        body: _screens[_currentIndex],
      ),
    );
  }
}
