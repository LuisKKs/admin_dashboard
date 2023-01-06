import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../datatables/reetas_data.dart';
import '../../models/model_recetas.dart';
import '../../providers/carousel_provider.dart';

class DashboardView extends StatefulWidget {
  final Receta? carruselImages;
  const DashboardView({
    Key? key,
    this.carruselImages,
  }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      drawer: const Drawer(),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Carreras",
            selectionColor: Colors.black,
            style: CustomLabels.h3,
          ),
          const SizedBox(height: 20),
          CarouselSlider.builder(
            itemCount: carruselImages.length,
            itemBuilder: (context, index, realIndex) {
              // ignore: unused_local_variable
              final carruselImage = carruselImages[index];
              return CardImages(
                carruselImages: carruselImages[index],
              );
            },
            options: CarouselOptions(
              height: 450.0,
              autoPlay: true,
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class CardImages extends StatelessWidget {
  final Receta carruselImages;
  const CardImages({Key? key, required this.carruselImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            carruselImages.copy();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CarruProvider(
                          carruselImages: carruselImages,
                        )));
          },
          child: FadeInImage(
            placeholder: const AssetImage("assets/loader.gif"),
            image: AssetImage(carruselImages.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
