import 'package:flutter/material.dart';
import 'package:news_akr23/view/detail_view.dart';

class NewsContainer extends StatefulWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;
  final String newsCnt;

  NewsContainer({
    Key? key,
    required this.imgUrl,
    required this.newsHead,
    required this.newsDes,
    required this.newsUrl,
    required this.newsCnt,
  }) : super(key: key);

  @override
  _NewsContainerState createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeInAnimation,
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color(0xFFCE93D8), // Light purple
                // Color(0xFF757575), // Gray
                Color(0xFF8B00FF), // Purple color
                Color(0xFFCCCCCC),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              FadeInImage.assetNetwork(
                height: 300,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                placeholder: "assets/img/placeholder.jfif",
                image: widget.imgUrl,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Text(
                      widget.newsHead.length > 90
                          ? "${widget.newsHead.substring(0, 90)}"
                          : widget.newsHead,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Schyler',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.newsDes,
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      widget.newsCnt != '--'
                          ? widget.newsCnt.length > 250
                              ? widget.newsCnt.substring(0, 250)
                              : " ${widget.newsCnt.toString().substring(0, widget.newsCnt.length - 15)}.............."
                          : widget.newsCnt,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailViewScreen(newsUrl: widget.newsUrl),
                          ),
                        );
                      },
                      // child: Text("Read More"),
                      // Set gray as the button

                      child: Text(
                        "Read More",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 33, 32, 32)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}







// class NewsContainer extends StatefulWidget {
//   final String imgUrl;
//   final String newsHead;
//   final String newsDes;
//   final String newsUrl;
//   final String newsCnt;

//   NewsContainer({
//     Key? key,
//     required this.imgUrl,
//     required this.newsHead,
//     required this.newsDes,
//     required this.newsUrl,
//     required this.newsCnt,
//   }) : super(key: key);

//   @override
//   _NewsContainerState createState() => _NewsContainerState();
// }

// class _NewsContainerState extends State<NewsContainer>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeInAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//     _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeIn,
//       ),
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeInAnimation,
//       child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             color: Color.fromARGB(
//                 255, 183, 77, 202), // Set light purple as the background color
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 10),
//               FadeInImage.assetNetwork(
//                 height: 300,
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//                 placeholder: "assets/img/placeholder.jfif",
//                 image: widget.imgUrl,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(height: 30),
//                     Text(
//                       widget.newsHead.length > 90
//                           ? "${widget.newsHead.substring(0, 90)}"
//                           : widget.newsHead,
//                       style: TextStyle(
//                         fontSize: 23,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Text(
//                       widget.newsDes,
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: const Color.fromARGB(255, 11, 11, 11),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       widget.newsCnt != '--'
//                           ? widget.newsCnt.length > 250
//                               ? widget.newsCnt.substring(0, 250)
//                               : " ${widget.newsCnt.toString().substring(0, widget.newsCnt.length - 15)}.............."
//                           : widget.newsCnt,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 DetailViewScreen(newsUrl: widget.newsUrl),
//                           ),
//                         );
//                       },
//                       // child: Text("Read More"),
//                       // Set gray as the button

//                       child: Text("Read More"),
//                       style: ElevatedButton.styleFrom(
//                         primary: Color(0xFF757575),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           )),
//     );
//   }
// }







/////////=----------------------------------
// class NewsContainer extends StatelessWidget {
//   String imgUrl;
//   String newsHead;
//   String newsDes;
//   String newsUrl;
//   String newsCnt;

//   NewsContainer(
//       {super.key,
//       required this.imgUrl,
//       required this.newsCnt,
//       required this.newsHead,
//       required this.newsDes,
//       required this.newsUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 10),
//           FadeInImage.assetNetwork(
//               height: 300,
//               width: MediaQuery.of(context).size.width,
//               fit: BoxFit.cover,
//               placeholder: "assets/img/placeholder.jfif",
//               image: imgUrl),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   newsHead.length > 90
//                       ? "${newsHead.substring(0, 90)}"
//                       : newsHead,
//                   style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   newsDes,
//                   style: TextStyle(fontSize: 14, color: Colors.black38),
//                 ),
//                 Text(
//                   newsCnt != '--'
//                       ? newsCnt.length > 250
//                           ? newsCnt.substring(0, 250)
//                           : " ${newsCnt.toString().substring(0, newsCnt.length - 15)}.............."
//                       : newsCnt,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   DetailViewScreen(newsUrl: newsUrl)));
//                     },
//                     child: Text("Read More")),
//               ),
//             ],
//           ),
//           // SizedBox(
//           //   height: 10,
//           // ),
//         ],
//       ),
//     );
//   }
// }


//----------------------






























// =-----------------------
// import 'package:flutter/material.dart';
// // import 'package:news_akr23/view/detail_view.dart';
// import 'package:url_launcher/url_launcher.dart';


// class NewsContainer extends StatefulWidget {
//   final String imgUrl;
//   final String newsHead;
//   final String newsDes;
//   final String newsUrl;
//   final String newsCnt;

//   NewsContainer({
//     Key? key,
//     required this.imgUrl,
//     required this.newsHead,
//     required this.newsDes,
//     required this.newsUrl,
//     required this.newsCnt,
//   }) : super(key: key);

//   @override
//   _NewsContainerState createState() => _NewsContainerState();
// }

// class _NewsContainerState extends State<NewsContainer>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _fadeInAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 500),
//     );
//     _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeIn,
//       ),
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _openUrl() async {
//     final uri = Uri.parse(widget.newsUrl);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       throw 'Could not launch ${widget.newsUrl}';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _fadeInAnimation,
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFFCE93D8), // Light purple
//               Color(0xFF757575), // Gray
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 10),
//             FadeInImage.assetNetwork(
//               height: 300,
//               width: MediaQuery.of(context).size.width,
//               fit: BoxFit.cover,
//               placeholder: "assets/img/placeholder.jfif",
//               image: widget.imgUrl,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 25),
//                   Text(
//                     widget.newsHead.length > 90
//                         ? "${widget.newsHead.substring(0, 90)}"
//                         : widget.newsHead,
//                     style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 101, 10, 4),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     widget.newsDes,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Text(
//                     widget.newsCnt != '--'
//                         ? widget.newsCnt.length > 200
//                             ? widget.newsCnt.substring(0, 200)
//                             : " ${widget.newsCnt.toString().substring(0, widget.newsCnt.length - 15)}.............."
//                         : widget.newsCnt,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                     SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//               Spacer(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: ElevatedButton(
//                       onPressed: _openUrl,
//                       child: Text("Read More"),
//                     ),
//                   ),
//                   // )
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           )),
//     );
//   }
// }






