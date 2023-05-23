import 'package:flutter/material.dart';

import '../../../constant/sizes.dart';

class Home extends StatelessWidget {
  Home({super.key});
  GetDeviceType getDeviceType = GetDeviceType();
  @override
  Widget build(BuildContext context) {
    Sizes size = Sizes(context);
    return Scaffold(
      body: Row(
        children: [
          //the first child should be the slide drawer.
          GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: getDeviceType.getDevicetype(context) == 'computer'
                ? 4
                : getDeviceType.getDevicetype(context) == 'tablet'
                    ? 3
                    : 2,
            children: <Widget>[
              Container(
                height: size.bigButtonHeight,
                width: size.bigButtonWidht,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.buttonRadius)),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.teal[300],
                child: const Text('Sound of screams but the'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
