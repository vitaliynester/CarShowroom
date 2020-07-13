import 'package:carshowroom/Views/Client/carlistpage.dart';
import 'package:carshowroom/Views/Client/menupage.dart';
import 'package:carshowroom/Views/Client/scorepage.dart';
import 'package:carshowroom/views/Client/settings.dart';
import 'package:flutter/material.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart' as st;

class ClientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: st.ShiftingTabBar(
            color: Color(0xFF2e3747),
            brightness: Brightness.dark,
            tabs: [
              st.ShiftingTab(icon: Icon(Icons.home), text: "Меню"),
              st.ShiftingTab(icon: Icon(Icons.directions_car), text: "Аренда"),
              st.ShiftingTab(icon: Icon(Icons.history), text: "Счета"),
              st.ShiftingTab(icon: Icon(Icons.settings), text: "Настройки"),
            ],
          ),
          body: TabBarView(
            children: [
              MenuPage(),
              CarListPage(),
              ScorePage(),
              SettingPage()
            ],
          ),
        ),
      ),
    );
  }
}
