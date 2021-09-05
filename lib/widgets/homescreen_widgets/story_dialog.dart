// import 'package:blue/screens/detailed_view.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:blue/model/image_model.dart';

// class StoryDialog extends StatelessWidget {
//   final StoryModel imageModel;
//   final Function onNextTap;
//   final Function onPreviousTap;
//   StoryDialog(this.imageModel, {this.onNextTap, this.onPreviousTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       color: Colors.black,
//       child: Stack(
//         children: [
//           Align(
//             alignment: Alignment.topCenter,
//             child: LinearProgressIndicator(),
//           ),
//           Center(
//             child: Stack(
//               children: [
//                 CachedNetworkImage(
//                   imageUrl: imageModel.subImg,
//                   fit: BoxFit.cover,
//                 ),
//               ],
//             ),
//           ),
//           Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.white),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Icons.close,
//                         size: 18,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//           Row(
//             children: [
//               Flexible(
//                   child: GestureDetector(
//                 onTap: onPreviousTap,
//                 child: Container(),
//               )),
//               Flexible(
//                   child: GestureDetector(
//                 onTap: onNextTap,
//                 child: Container(),
//               ))
//             ],
//           ),
//           imageModel.knowMoreImg != null && imageModel.knowMoreImg.isNotEmpty
//               ? Padding(
//                   padding: const EdgeInsets.all(30),
//                   child: Align(
//                     alignment: Alignment.bottomCenter,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => DetailedView(
//                                   imageModel.knowMoreImg,
//                                   locationLink: imageModel.location,
//                                   phoneNumber: imageModel.phoneNumber,
//                                 )));
//                       },
//                       child: Container(
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 10),
//                           child: Text(
//                             'Know More',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.blueGrey,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }
// }
