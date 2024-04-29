import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_gallary/common/common_widget.dart';
import 'package:image_gallary/model/image_data.dart';

class ImageDetailsPage extends StatefulWidget {
  const ImageDetailsPage({super.key, required this.index});

  final int index;

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CommonWidgets.arrowBack(),
          ),
        ),
        title: Text(ImageModel.images[widget.index]["category"]!),
        titleTextStyle: CommonWidgets.appBarTitleTextStyle(),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.white,
          )
        ],
        backgroundColor: const Color(0xFF2CAB00),
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return portraitView(orientation);
            } else {
              return landscapeView(orientation);
              // return Container();
            }
          },
        ),
      ),
    );
  }

  Widget portraitView(Orientation orientation) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [_selectedImage()],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.00, vertical: 10.00),
                  child: Text(
                    ImageModel.images[widget.index]["title"]!,
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        letterSpacing: 0.5),
                  ),
                )
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.00, vertical: 10.00),
                  child: Text(
                    ImageModel.images[widget.index]["desc"]!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontFamily: "Poppins", letterSpacing: 0.5),
                  ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.00),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 51,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2CAB00),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            letterSpacing: 0.5,
                          ),
                          elevation: 15,
                        ),
                        child: const Text("See More")),
                  ),
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.00),
                  child: Text(
                    "Suggestions",
                    style: TextStyle(
                        color: Color(0xFF2CAB00),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        letterSpacing: 0.5),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                _relatedImage(orientation),
                _relatedImage(orientation),
              ],
            )
          ],
        ));
  }

  Widget landscapeView(Orientation orientation) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: 298,
                margin: const EdgeInsets.only(top: 15.00, left: 20.00),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.50),
                    spreadRadius: 0,
                    blurRadius: 35,
                    offset: const Offset(5, 12),
                    blurStyle: BlurStyle.normal,
                  ),
                ]),
                child: _selectedImage(),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.00, vertical: 20.00),
                        child: Text(
                          ImageModel.images[widget.index]["category"]!,
                          style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              letterSpacing: 0.5),
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.00, vertical: 00.00),
                        child: Text(
                          ImageModel.images[widget.index]["desc"]!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontFamily: "Poppins", letterSpacing: 0.5),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.00),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: 51,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2CAB00),
                                foregroundColor: Colors.white,
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: "Poppins",
                                    letterSpacing: 0.5),
                                elevation: 15,
                              ),
                              child: const Text("See More")),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30.00, bottom: 20.00),
                        child: Text(
                          "Suggestions",
                          style: TextStyle(
                              color: Color(0xFF2CAB00),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              letterSpacing: 0.5),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _relatedImage(orientation),
                        _relatedImage(orientation),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Container _selectedImage() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 325,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: NetworkImage(ImageModel.images[widget.index]["url"]!),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.25), BlendMode.darken),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, 10),
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      alignment: Alignment.bottomLeft,
    );
  }

  Container _relatedImage(Orientation orientation) {
    Random random = Random();
    int randomIndex = random.nextInt(ImageModel.images.length);
    return Container(
        width: (orientation == Orientation.portrait)
            ? MediaQuery.of(context).size.width * 0.45
            : MediaQuery.of(context).size.width * 0.22,
        height: 180,
        margin: (orientation == Orientation.portrait)
            ? const EdgeInsets.only(top: 20.0, bottom: 10.00)
            : const EdgeInsets.only(bottom: 10.00),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
            image:
                NetworkImage(ImageModel.images[randomIndex]['url'].toString()),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.25), BlendMode.darken),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 10),
              blurStyle: BlurStyle.normal,
            )
          ],
        ),
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text(
            ImageModel.images[randomIndex]['category'].toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ));
  }
}
