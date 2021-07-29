
import 'package:flutter/material.dart';

import 'helper/sharepref.dart';
import 'view/books/books.dart';
import 'view/entertainment/entertainment.dart';
import 'view/home/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int _pageIndex = 0;
  PageController? _pageController;

  List<Widget> tabPages = [
    Screen1(),
    Books(),
    Entertainment(),
  ];

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Acropolis"),
          FlatButton(onPressed: (){
            AppSharedPref.removeemail();
             Navigator.of(context).pushReplacementNamed('/login');
          }, child: Text("Logout",style: TextStyle(color: Colors.white),))
        ],
      ),
      
      ),
 bottomNavigationBar: BottomNavigationBar(
   selectedItemColor: Colors.green,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon(Icons.home), title: Text("Apps")),
          BottomNavigationBarItem(icon: Icon(Icons.book_online), title: Text("Books")),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), title: Text("Entertainment")),
        ],

      ),     
        body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }
   void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController!.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.easeInOut);
  }
  
}

