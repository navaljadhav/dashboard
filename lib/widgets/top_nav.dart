import 'package:dashboard/constants/custom_text.dart';
import 'package:dashboard/constants/style.dart';
import 'package:dashboard/helpers/responsiveness.dart';
import 'package:flutter/material.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      elevation: 0,
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: const [
                SizedBox(
                    child: Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(
                    Icons.dashboard,
                    size: 28,
                  ),
                )),
              ],
            )
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      title: Row(
        children: [
          Visibility(
              child: CustomText(
            text: "Dash",
            color: lightGrey,
            fontWeight: FontWeight.bold,
            size: 20,
          )),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(.7),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  height: 12,
                  width: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: dark, width: 2)),
                ),
              ),
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          const SizedBox(
            width: 24,
          ),
          CustomText(
            text: "Naval",
            color: lightGrey,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Container(
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(2),
                child: CircleAvatar(
                  child: Icon(
                    Icons.person_outline,
                    color: dark,
                  ),
                  backgroundColor: light,
                ),
              )),
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: light,
    );
