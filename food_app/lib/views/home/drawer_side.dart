import 'package:flutter/material.dart';
import 'package:food_app/views/my_profile/my_profile.dart';
import 'package:food_app/views/review_cart/review_cart.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile({IconData? icon, String? title, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title.toString(),
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          width: 100,
          color: Color(0xffd1ad17),
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.redAccent,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Welcome Guest"),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                              height: 30,
                              child: OutlineButton(
                                onPressed: () {},
                                child: Text(
                                  " Login ",
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    width: 2,
                                  ),
                                ),
                              ))
                        ])
                  ],
                ),
              ),
              listTile(icon: Icons.home_outlined, title: " Home", onTap: () {}),
              listTile(
                  icon: Icons.shop_outlined,
                  title: " Review Cart",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReviewCart(),
                      ),
                    );
                  }),
              listTile(
                  icon: Icons.person_outlined,
                  title: " My Profile",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyProfile(),
                      ),
                    );
                  }),
              listTile(
                  icon: Icons.notifications_outlined,
                  title: " Notifications",
                  onTap: () {}),
              listTile(
                  icon: Icons.format_quote_outlined,
                  title: " FAQs",
                  onTap: () {}),
              listTile(
                  icon: Icons.copy_outlined,
                  title: " Raise a complain",
                  onTap: () {}),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Contact Support"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(" Call Us: "),
                        SizedBox(width: 10),
                        Text(" + 019111111111"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    ),
                    Row(
                      children: [
                        Text(" Mail Us: "),
                        SizedBox(width: 10),
                        Text(" raya@gmail.com"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
