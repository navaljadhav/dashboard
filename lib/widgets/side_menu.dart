import 'package:dashboard/constants/custom_text.dart';
import 'package:dashboard/constants/style.dart';
import 'package:dashboard/controllers/controllers.dart';
import 'package:dashboard/helpers/responsiveness.dart';
import 'package:dashboard/routing/routes.dart';
import 'package:dashboard/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    const Padding(
                      padding: EdgeInsets.only(right: 23),
                      child: Icon(Icons.dashboard, size: 20),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                    Divider(color: lightGrey.withOpacity(.1)),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: sideMenuItems
                          .map((itemName) => SideMenuItem(
                                itemName: itemName == AuthenticationPageRoute
                                    ? "Log Out"
                                    : itemName,
                                onTap: () {
                                  if (itemName == AuthenticationPageRoute) {
                                    //todo; go to auth page
                                  }
                                  if (!menuController.isActive(itemName)) {
                                    menuController.changeActiveItemTo(itemName);
                                    if (ResponsiveWidget.isSmallScreen(
                                        context)) {
                                      Get.back();
                                      //todo: goto itemName route
                                    }
                                  }
                                },
                              ))
                          .toList(),
                    ),
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
