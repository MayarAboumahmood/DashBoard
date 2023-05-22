import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashboard/constant/theme.dart';
import 'package:side_navigation/side_navigation.dart';
import '../../../constant/font.dart';
import '../../../constant/sizes.dart';
import '../../widget/hoverButton.dart';
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
            child: views.elementAt(selectedIndex),
          ),
        ],
      ),
    );
  }

  List<Widget> views = [
    Center(
      child: HomeIcons(),
    ),
    const Center(
      child: Text('Account'),
    ),
    const Text('setting'),
    // HoverButton(
    //     ontap: () {
    //       controller.showSettingsDialog();
    //     },
    //     mywidth: 100,
    //     myheight: 100,
    //     child: const Text('what the fuck settign')),
  ];
  Future<dynamic> showSettingsDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Setting(),
        );
      },
    );
  }
}
