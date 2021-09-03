import 'package:blue/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum LinkType { PHONE, MAP }

class DetailedView extends StatelessWidget {
  final String image;
  final locationLink;
  final phoneNumber;
  DetailedView(this.image, {this.phoneNumber, this.locationLink});

  @override
  Widget build(BuildContext context) {
    launchWhatsapp() async {
      var whatsappUrl = "https://wa.me/+91$phoneNumber?text=Hey!";
      if (await canLaunch(whatsappUrl)) {
        launch(whatsappUrl);
      }
    }

    return Scaffold(
      floatingActionButton: phoneNumber != null
          ? GestureDetector(
              onTap: () {
                launchWhatsapp();
              },
              child: Image.asset(
                'assets/images/whatsapp_ic.png',
                height: 90,
                width: 90,
              ),
            )
          : null,
      //  backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Center(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          )),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         locationLink != null
          //             ? Expanded(
          //                 child: Expanded(
          //                     child: ActionButton(
          //                   title: 'Location',
          //                   onPressed: () async {
          //                     String url = locationLink;
          //                     if (await canLaunch(url)) {
          //                       await launch(url);
          //                     } else {
          //                       throw 'Could not launch $url';
          //                     }
          //                   },
          //                 )),
          //               )
          //             : Container(
          //                 height: 0,
          //               ),
          //         SizedBox(
          //           width: 10,
          //         ),
          //         phoneNumber != null
          //             ? Expanded(
          //                 child: ActionButton(
          //                 title: 'Contact',
          //                 onPressed: () async {
          //                   String url = 'tel: $phoneNumber';
          //                   if (await canLaunch(url)) {
          //                     await launch(url);
          //                   } else {
          //                     throw 'Could not launch $url';
          //                   }
          //                 },
          //               ))
          //             : Container(
          //                 height: 0,
          //               )
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  ActionButton({this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.location_history_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
