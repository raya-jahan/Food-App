import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/views/home/drawer_side.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget listTile({IconData? icon, String? title}) {
    return Column(children: [
      Divider(
        height: 1,
      ),
      ListTile(
        leading: Icon(icon),
        title: Text(title.toString()),
        trailing: Icon(Icons.arrow_forward_ios),
      )
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          title: Text(" My Profile",
              style: TextStyle(
                fontSize: 18,
                color: textColor,
              )),
        ),
        drawer: DrawerSide(),
        body: Stack(children: [
          Column(
            children: [
              Container(
                height: 130,
                color: primaryColor,
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    " Raya Jahan",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(" rayajahan@gmail.com"),
                                ],
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 15,
                                  child: Icon(Icons.edit, color: primaryColor),
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    listTile(icon: Icons.shop_outlined, title: "My Orders"),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Delivery Address"),
                    listTile(
                        icon: Icons.person_outlined, title: "Refer a friend"),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & COnditions"),
                    listTile(
                        icon: Icons.policy_outlined, title: "Privacy policy"),
                    listTile(icon: Icons.add_chart, title: "About"),
                    listTile(
                        icon: Icons.exit_to_app_outlined, title: "Log Out"),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20),
            child: CircleAvatar(
                radius: 70,
                backgroundColor: primaryColor,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80"),
                  radius: 55,
                  backgroundColor: scaffoldBackgroundColor,
                )),
          )
        ]));
  }
}
