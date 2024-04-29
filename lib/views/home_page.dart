import 'package:flutter/material.dart';
import 'package:image_gallary/common/common_widget.dart';
import 'package:image_gallary/model/image_data.dart';
import 'package:image_gallary/views/details_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CommonWidgets.arrowBack(),
        ),
        title: const Text("Image Gallery"),
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
        child: imageBuilder(),
      ),
    );
  }

  Widget imageBuilder() {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return GridView.builder(
          padding: const EdgeInsets.all(15.00),
          itemCount: ImageModel.images.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait ? 2 : 4),
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageDetailsPage(index: index)));
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: NetworkImage(ImageModel.images[index]["url"]!),
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
                  // decoration: ContainerTheme.getContainerBoxDecoration(
                  //     cards: cards, index: index),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    child: Text(
                      ImageModel.images[index]['category'].toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
