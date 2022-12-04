import 'package:flutter/material.dart';
import '/ui/screens/jenis_limbah/master_menu_screen.dart';

import '../screens/neraca/menu_neraca_screen.dart';
import '/ui/screens/dashboard_screen.dart';

import '/ui/screens/notifikasi_screen.dart';
import '/ui/screens/setting_screen.dart';
import '/ui/theme.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyBottomNavigationBarState();
  }
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar

  final Map<Widget, IconData> _screens = {
    const DashboardScreen(): Icons.home,
    const MasterMenuScreen(): Icons.delete,
    const MenuNeracaScreen(): Icons.monitor_weight,
    const NotifikasiScreen(): Icons.notifications,
    const SettingScreen(): Icons.settings,
  };

  final List<String> bottomNavBarTitle = [
    'Home',
    'Master',
    'Neraca',
    'Notifikasi',
    'Pengaturan'
  ];
  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //specify the location of the FAB
      floatingActionButton: fabWidget(), extendBody: true,
      bottomNavigationBar: bottomAppBarWidget(), resizeToAvoidBottomInset: true,
    );
  }

  Widget fabWidget() {
    return MediaQuery.of(context).viewInsets.bottom == 0.0
        ? FloatingActionButton(
            heroTag: UniqueKey(),
            elevation: 20,
            backgroundColor: kPrimaryColor, //FAB color
            child: Container(
              margin: const EdgeInsets.all(defaultMargin / 2),
              child: Icon(selectedIndex == 0 ? Icons.add : Icons.home),
            ),
            onPressed: () {
              setState(() {
                if (selectedIndex == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MasterMenuScreen()),
                  );
                } else {
                  selectedIndex = 0; //to update the animated container
                }
              });
            },
          )
        : const SizedBox();
  }

  Widget bottomAppBarWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(defaultCircular * 2),
          topLeft: Radius.circular(defaultCircular * 2)),
      child: BottomAppBar(
        color: kGreyColor,
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar

        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: 5, horizontal: defaultMargin),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget(1),
              buttonWidget(2),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              buttonWidget(3),
              buttonWidget(4),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWidget(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, //kalau tidak pakai ini rusak
      children: [
        IconButton(
          //update the bottom app bar view each time an item is clicked
          onPressed: () {
            updateTabSelection(index);
          },
          iconSize: 27.0,
          icon: Icon(
            _screens.values.elementAt(index),
            //darken the icon if it is selected or else give it a different color
            color: selectedIndex == index ? kPrimaryColor : kDarkGreyColor,
          ),
        ),
        Text(
          bottomNavBarTitle[index],
          style: greenTextStyle.copyWith(
              color: selectedIndex == index ? kPrimaryColor : kDarkGreyColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        )
      ],
    );
  }

  Widget screensWidget() {
    switch (selectedIndex) {
      case 1:
        {
          return _screens.keys.elementAt(1);
        }

      case 2:
        {
          return _screens.keys.elementAt(2);
        }

      case 3:
        {
          return _screens.keys.elementAt(3);
        }

      case 4:
        {
          return _screens.keys.elementAt(4);
        }

      default:
        {
          return _screens.keys.elementAt(0);
        }
    }
  }
}
