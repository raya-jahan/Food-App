import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget singleProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: Color(0xffcbcbcb),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                'https://images.unsplash.com/photo-1571091655789-405eb7a3a3a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJ1cmdlcnxlbnwwfHwwfHw%3D&w=1000&q=80'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Delicious burger',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' 50\$/ 5gram '
                    ' Yummy Burger',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 30,
                          width: 10,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.yellowAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                ' 50 Gram',
                                style: TextStyle(fontSize: 10),
                              )),
                              Expanded(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                            height: 30,
                            width: 10,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.yellowAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 15,
                                ),
                                Text(
                                  '1',
                                ),
                                Icon(
                                  Icons.add,
                                  size: 15,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),

                  //
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(Icons.search, size: 17, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d181),
              child: Icon(Icons.shop, size: 17, color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80')),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' Fast Food'),
                  Text(
                    ' View All',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                singleProducts(),
                singleProducts(),
                singleProducts(),
              ]

                  //Pasta
                  // Container(
                  //   height: 400,
                  //   width: 250,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xffcbcbcb),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         flex: 2,
                  //         child: Image.network(
                  //             'https://media.gettyimages.com/photos/spaghetti-with-tomato-sauce-shot-on-rustic-wooden-table-picture-id1166258781?s=612x612'),
                  //       ),
                  //       Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 10, vertical: 5),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 ' Delicious pasta',
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 ' 50\$/ 5gram '
                  //                 ' Yummy pasta',
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                 ),
                  //               ),

                  //               Row(
                  //                 children: [
                  //                   Expanded(
                  //                     child: Container(
                  //                       padding: EdgeInsets.only(left: 5),
                  //                       height: 30,
                  //                       width: 10,
                  //                       decoration: BoxDecoration(
                  //                         border: Border.all(
                  //                             color: Colors.yellowAccent),
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                       ),
                  //                       child: Row(
                  //                         children: [
                  //                           Expanded(
                  //                               child: Text(
                  //                             ' 50 Gram',
                  //                             style: TextStyle(fontSize: 10),
                  //                           )),
                  //                           Expanded(
                  //                             child: Icon(
                  //                               Icons.arrow_drop_down,
                  //                               size: 20,
                  //                               color: Colors.red,
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Expanded(
                  //                     child: Container(
                  //                         height: 30,
                  //                         width: 10,
                  //                         decoration: BoxDecoration(
                  //                           border: Border.all(
                  //                               color: Colors.yellowAccent),
                  //                           borderRadius:
                  //                               BorderRadius.circular(10),
                  //                         ),
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.center,
                  //                           children: [
                  //                             Icon(
                  //                               Icons.remove,
                  //                               size: 15,
                  //                             ),
                  //                             Text(
                  //                               '1',
                  //                             ),
                  //                             Icon(
                  //                               Icons.add,
                  //                               size: 15,
                  //                             )
                  //                           ],
                  //                         )),
                  //                   ),
                  //                 ],
                  //               ),

                  //               //
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  // //Pizza
                  // Container(
                  //   height: 400,
                  //   width: 250,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xffcbcbcb),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         flex: 2,
                  //         child: Image.network(
                  //             'https://images.unsplash.com/photo-1628840042765-356cda07504e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVwcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8&w=1000&q=80'),
                  //       ),
                  //       Expanded(
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 10, vertical: 5),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 ' Delicious pizza',
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //               Text(
                  //                 ' 50\$/ 5gram '
                  //                 ' Yummy Pizza',
                  //                 style: TextStyle(
                  //                   color: Colors.black,
                  //                 ),
                  //               ),

                  //               Row(
                  //                 children: [
                  //                   Expanded(
                  //                     child: Container(
                  //                       padding: EdgeInsets.only(left: 5),
                  //                       height: 30,
                  //                       width: 10,
                  //                       decoration: BoxDecoration(
                  //                         border: Border.all(
                  //                             color: Colors.yellowAccent),
                  //                         borderRadius:
                  //                             BorderRadius.circular(10),
                  //                       ),
                  //                       child: Row(
                  //                         children: [
                  //                           Expanded(
                  //                               child: Text(
                  //                             ' 50 Gram',
                  //                             style: TextStyle(fontSize: 10),
                  //                           )),
                  //                           Expanded(
                  //                             child: Icon(
                  //                               Icons.arrow_drop_down,
                  //                               size: 20,
                  //                               color: Colors.red,
                  //                             ),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 5,
                  //                   ),
                  //                   Expanded(
                  //                     child: Container(
                  //                         height: 30,
                  //                         width: 10,
                  //                         decoration: BoxDecoration(
                  //                           border: Border.all(
                  //                               color: Colors.yellowAccent),
                  //                           borderRadius:
                  //                               BorderRadius.circular(10),
                  //                         ),
                  //                         child: Row(
                  //                           mainAxisAlignment:
                  //                               MainAxisAlignment.center,
                  //                           children: [
                  //                             Icon(
                  //                               Icons.remove,
                  //                               size: 15,
                  //                             ),
                  //                             Text(
                  //                               '1',
                  //                             ),
                  //                             Icon(
                  //                               Icons.add,
                  //                               size: 15,
                  //                             )
                  //                           ],
                  //                         )),
                  //                   ),
                  //                 ],
                  //               ),

                  //               //
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('  Healthy Food'),
                  Text(
                    ' View All',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singleProducts(),
                  singleProducts(),
                  singleProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
