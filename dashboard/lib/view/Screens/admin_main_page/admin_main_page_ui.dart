import 'package:dashboard/view/widget/hoverButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:side_navigation/side_navigation.dart';
import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../home_icons/home_icons.dart';
import '../setting/setting_page.dart';
import 'admin_main_page_controller.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GetDeviceType getDeviceType = GetDeviceType();
  HomeController controller = Get.find();
  @override
  void initState() {
    controller.setContext(context);
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      backgroundColor: Get.isDarkMode ? backGroundDarkColor : skinColorWhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home page',
          style: TextStyle(
              color: Get.isDarkMode ? skinColorWhite : backGroundDarkColor,
              fontSize: size.appBarTextSize,
              fontFamily: jostFontFamily,
              fontWeight: FontWeight.w100),
        ),
        backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: Row(
        children: [
          SideNavigationBar(
            header: const SideNavigationBarHeader(
                image: Icon(Icons.person),
                title: Text('Title widget'),
                subtitle: Text('Subtitle widget')),
            footer: const SideNavigationBarFooter(label: Text('Footer label')),
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            theme: SideNavigationBarTheme(
              backgroundColor: Get.isDarkMode ? darkPrimaryColor : primaryColor,
              togglerTheme: SideNavigationBarTogglerTheme.standard(),
              itemTheme: SideNavigationBarItemTheme.standard(),
              dividerTheme: SideNavigationBarDividerTheme.standard(),
            ),
          ),
          Expanded(
            child: controller.views.elementAt(selectedIndex),
          ),
          // TextButton(
          //     onPressed: () {
          //       controller.showSettingsDialog();
          //     },
          //     child: Text('setting'))
        ],
      ),
    );
  }

  // List<Widget> views = [];
  // views = [
  //   Center(
  //     child: HomeIcons(),
  //   ),
  //   const Center(
  //     child: Text('Account'),
  //   ),
  //   HoverButton(
  //       ontap: () {
  //         controller.showSettingsDialog();
  //       },
  //       mywidth: 100,
  //       myheight: 100,
  //       child: const Text('what the fuck settign')),
  // ];
}
