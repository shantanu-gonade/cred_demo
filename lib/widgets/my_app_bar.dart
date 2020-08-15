import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../controllers/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08 +
          MediaQuery.of(context).padding.top,
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NeumorphicBackButton(
              onPressed: () async {
                Provider.of<PageControllerApp>(context, listen: false)
                    .setCurrentIndex(-1);
                await Provider.of<PageControllerApp>(context, listen: false)
                    .hideSheet();
              },
              padding: EdgeInsets.all(10),
              style: NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 8,
                disableDepth: true,
                intensity: 0.3,
                shadowLightColorEmboss: Colors.green[50],
                lightSource: LightSource.topLeft,
                color: NeumorphicColors.decorationWhiteColor(
                  Colors.green[50],
                  intensity: 0.98,
                ),
              ),
            ),
            Consumer<PageControllerApp>(
              builder: (context, value, child) {
                return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: value.currentIndex != -1 ? 1 : 0,
                    child: child);
              },
              child: NeumorphicButton(
                padding: EdgeInsets.all(0),
                style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 8,
                  disableDepth: true,
                  intensity: 0.3,
                  shadowLightColorEmboss: Colors.green[50],
                  lightSource: LightSource.topLeft,
                  color: NeumorphicColors.decorationWhiteColor(
                    Colors.green[50],
                    intensity: 0.98,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.check_circle_outline,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
