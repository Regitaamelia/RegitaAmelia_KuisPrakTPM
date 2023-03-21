import 'package:flutter/material.dart';
import 'package:regitaamelia_kuistmp/detail_menu.dart';
import 'coffee_menu.dart';

class ListMenu extends StatefulWidget {
  const ListMenu({Key? key}) : super(key: key);

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  String pesanKirim = "Data yang dikirimkan";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("List Menu"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final CoffeeMenu dataCoffeeMenu = coffeeList[index];
          return Card(
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailMenu(
                      coffeeMenuTerima: dataCoffeeMenu,
                    );
                  }));
                },
                child: Row(
                  children: [
                    ClipRRect(
                      child: SizedBox(
                        height: 120,
                        width: 160,
                        child: Image.network(dataCoffeeMenu.imageUrls[0],
                            fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 350.0),
                        ),
                        Text('${dataCoffeeMenu.name}',
                            style: TextStyle(
                                fontSize: 26, fontStyle: FontStyle.italic)),
                        Text('${dataCoffeeMenu.price}'),
                      ],
                    ),
                  ],
                )),
          );
        },
        // perulangan
        itemCount: coffeeList.length,
      ),
    ));
  }
}
