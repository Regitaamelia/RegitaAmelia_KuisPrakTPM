import 'package:flutter/material.dart';
import 'list_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'coffee_menu.dart';

class DetailMenu extends StatefulWidget {
  final CoffeeMenu coffeeMenuTerima;

  const DetailMenu({
    Key? key,
    // required this.pesanTerima,
    required this.coffeeMenuTerima,
  }) : super(key: key);

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("${widget.coffeeMenuTerima.name}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: 230,
              padding: const EdgeInsets.all(12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(widget.coffeeMenuTerima.imageUrls[0]),
                  Image.network(widget.coffeeMenuTerima.imageUrls[1]),
                  Image.network(widget.coffeeMenuTerima.imageUrls[2]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text('Name :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.name),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Text('Description :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.description),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text('Price :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.price),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text('Ingredients :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.ingredients[0]),
            Text(widget.coffeeMenuTerima.ingredients[1]),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text('Nutrition :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.nutrition),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text('Review Average :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.reviewAverage),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text('Review Count :',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(widget.coffeeMenuTerima.reviewCount),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            ElevatedButton(
                onPressed: () {
                  _launchURL('${widget.coffeeMenuTerima.linkStore}');
                },
                child: Text("Link Store")),
          ],
        ),
      ),
    ));
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
