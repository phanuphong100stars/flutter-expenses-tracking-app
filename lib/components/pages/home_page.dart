import 'package:expenses_tracking_app/configs/theme_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ThemeConfig.backgroundDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 200,
              color: ThemeConfig.primaryLight,
              child: const Text('For Graph'),
            ),
            Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 100,
                child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    shrinkWrap: true,
                    childAspectRatio: 2 / 3,
                    // mainAxisExtent: 100,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(
                        color: ThemeConfig.primaryLight,
                        height: 100,
                        child: const Text(' State 1'),
                      ),
                      Container(
                        color: ThemeConfig.primaryLight,
                        height: 100,
                        child: const Text(' State 2'),
                      ),
                      Container(
                        color: ThemeConfig.primaryLight,
                        height: 100,
                        child: const Text(' State 3'),
                      )
                    ])),
            Container(
              alignment: Alignment.center,
              color: ThemeConfig.primaryLight,
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              child: const Text('Tab Menu'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(children: [
                Container(
                  color: ThemeConfig.primaryLight,
                  width: double.infinity,
                  height: 40,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  color: ThemeConfig.primaryLight,
                  width: double.infinity,
                  height: 40,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  color: ThemeConfig.primaryLight,
                  width: double.infinity,
                  height: 40,
                ),
                Container(
                  color: ThemeConfig.primaryLight,
                  width: double.infinity,
                  height: 40,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  color: ThemeConfig.primaryLight,
                  width: double.infinity,
                  height: 40,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 10,
                ),
                Container(
                  color: ThemeConfig.primaryLight,
                  width: double.infinity,
                  height: 40,
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
