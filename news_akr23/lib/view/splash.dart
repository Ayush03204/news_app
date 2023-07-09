// import 'package:flutter/material.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       color: Color.fromARGB(255, 231, 80, 209),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(
//             'assets/img/nlogoo.png',
//             height: 250,
//             width: 300,
//           ),
//           SizedBox(
//             height: 150,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 50),
//             child: Column(
//               children: [
//                 Text(
//                   'Be In the Know, Anywhere You Go: The Ultimate News App for Todays Connected World.',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 18,
//                       // fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.italic,
//                       color: Colors.white),
//                 ),
//                 SizedBox(height: 15),
//                 Text(
//                   '                    Developed -by Ayush',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF8B00FF), // Purple color
              Color(0xFFCCCCCC), // Gray color
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/nlogoo.png',
              height: 250,
              width: 300,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Column(
                children: [
                  Text(
                    'Be In the Know, Anywhere You Go: The Ultimate News App for Today\'s Connected World.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '                         ~Developed by Ayush',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                       fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
