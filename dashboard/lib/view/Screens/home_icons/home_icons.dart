import 'package:flutter/material.dart';

import '../../../constant/sizes.dart';

// ignore: must_be_immutable
class HomeIcons extends StatelessWidget {
  HomeIcons({Key? key}) : super(key: key);

  GetDeviceType getDeviceType = GetDeviceType();

  @override
  Widget build(BuildContext context) {
    // Sizes size = Sizes(context);
    return Scaffold(
        body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Adjust the number of columns as desired
      ),
      itemCount: cards.length,
      padding: EdgeInsets.all(16), // Add padding around the grid
      itemBuilder: (BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(
                  cards[index]['image'],
                ),
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {},
                ),
              ),
              Text(
                cards[index]['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    ));
  }

  List<Map<String, dynamic>> cards = [
    {
      'title': 'Events',
      'image':
          'https://images.pexels.com/photos/2747449/pexels-photo-2747449.jpeg?cs=srgb&dl=pexels-wolfgang-2747449.jpg&fm=jpg', // Asset path
    },
    {
      'title': 'Stock',
      'image':
          'https://thumbs.dreamstime.com/b/various-bottles-alcoholic-beverages-bar-shelf-179726715.jpg', // Asset path
    },
    {
      'title': 'Manage workers',
      'image':
          'https://sevenrooms.com/wp-content/uploads/2022/01/bar-manager-768x510.jpg', // Image URL
    },
    // Add more books with their titles and images
  ];
}
