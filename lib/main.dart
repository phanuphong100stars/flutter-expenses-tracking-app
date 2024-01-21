import 'package:expenses_tracking_app/components/pages/home_page.dart';
import 'package:expenses_tracking_app/configs/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
// import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  // TabController? _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const String assetName = 'assets/logo.svg';
    final Widget svgIcon = SvgPicture.asset(assetName, semanticsLabel: 'Logo');

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          // color: Colors.white,
          height: 40,
          child: svgIcon,
        ),

        actions: [
          IconButton(
              icon: Icon(
                Icons.newspaper,
                color: ThemeConfig.textColor,
              ),
              onPressed: () {})
        ],
        // centerTitle: true,
        backgroundColor: ThemeConfig.backgroundDark,
        toolbarHeight: 80,
        // titleSpacing: 10.0,
      ),
      bottomNavigationBar: MotionTabBar(
          controller: _motionTabBarController,
          initialSelectedTab: "Home",
          useSafeArea: true,
          labels: const ["Home", "Spending", "Calender", 'Account'],
          icons: const [
            Icons.home,
            Icons.monetization_on,
            Icons.calendar_month,
            Icons.people_alt,
          ],
          badges: const [null, null, null, null],
          tabSize: 50,
          tabBarHeight: 55,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          tabIconColor: ThemeConfig.primary,
          tabIconSize: 28.0,
          tabIconSelectedSize: 26.0,
          tabSelectedColor: ThemeConfig.primaryDark,
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              // _tabController!.index = value;
              _motionTabBarController!.index = value;
            });
          }),
      body: TabBarView(
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _motionTabBarController,
        children: <Widget>[
          Container(
            color: ThemeConfig.backgroundDark,
            child: const HomePage(),
          ),
          Container(
            color: ThemeConfig.backgroundDark,
            child: Text('Spending',
                style: TextStyle(color: ThemeConfig.textColor)),
          ),
          Container(
            color: ThemeConfig.backgroundDark,
            child: Text('Calender',
                style: TextStyle(color: ThemeConfig.textColor)),
          ),
          Container(
            color: ThemeConfig.backgroundDark,
            child:
                Text('Profile', style: TextStyle(color: ThemeConfig.textColor)),
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 20),
      //   child: FloatingActionButton.extended(
      //     label: const Text(
      //       'New Tracking',
      //     ),
      //     elevation: 4,
      //     icon: const Icon(Icons.add),
      //     onPressed: () {},
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
