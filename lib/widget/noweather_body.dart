import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child:  Center(
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather☁️ stert',
             
              style: TextStyle(fontSize: 30,color: Colors.white),
            ),
            Text(
              'searching now 🔍',
              style:  TextStyle(fontSize: 30,color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
