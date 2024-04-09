import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:missing_finder1/ui/home/listOfMissigPersons/ListOfMissing.dart';
import 'package:missing_finder1/ui/home/searchTab/SearchScreen.dart';
import 'package:missing_finder1/ui/widgets/ButtonWidget.dart';
import 'package:missing_finder1/ui/home/Report/ReportScreen.dart';
import 'package:missing_finder1/ui/home/volunteer/VolunteerScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      width: 150.w,
                      image: AssetImage('assets/images/logo.png'),
                      // alignment: Alignment.topLeft
                    ),
                  ),
                ],
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Farida Sadek'),
                  accountEmail: Text('faridaSadek@gmail.com'),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                ListTile(
                  title: Text('Change Possword',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete Account',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Language',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('About',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  onTap: () => null,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log out',
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  onTap: () => null,
                ),
              ],
            ),
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            const Text('Welcome to Missing finder',
                style: TextStyle(
                    color: Color(0xFFA81A1A),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const Text(
              'Our app operates on a simple premise to \n'
              'aggregate and analyze diverse datasets \n'
              'related to missing persons cases using \nadvanced AI algorithms.',
              style: TextStyle(
                  color: Color(0xFFEAA8A8),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SearchScreen.routeName);
                    },
                    child: ButtonWidget(text: 'Search the missing person')),
                Expanded(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, ListOfMissing.routeName);
                        },
                        child: ButtonWidget(
                          text: 'List of found persons',
                        ))),
              ],
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, ListOfMissing.routeName);
                },
                child: Center(
                    child: ButtonWidget(text: 'List of missing persons'))),
          ]),
        ));
  }
}
