import 'package:amazing_app.v1/page/aboutus.dart';
import 'package:amazing_app.v1/page/commitee.dart';
import 'package:amazing_app.v1/page/song.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [Aboutus(), Commitee(), Song()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentSCreen = Song();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentSCreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: currentTab == 0 ? Colors.green : Colors.grey,
        child: Icon(
          Icons.audiotrack_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            currentSCreen = Song();
            currentTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentSCreen = Commitee();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people,
                            color: currentTab == 1 ? Colors.green : Colors.grey,
                          ),
                          Text(
                            'Our Committee',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Colors.green
                                    : Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentSCreen = Aboutus();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.history,
                            color: currentTab == 2 ? Colors.green : Colors.grey,
                          ),
                          Text(
                            'About Us',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Colors.green
                                    : Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
