import 'dart:ui';

import 'package:cars_app/constants.dart';
import 'package:cars_app/models/car_model.dart';
import 'package:cars_app/pages/car_details/car_details.dart';
import 'package:cars_app/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarsCarrousel extends StatefulWidget {
  const CarsCarrousel({
    Key? key,
    required this.title,
    required this.cars,
  }) : super(key: key);

  final String title;
  final List<Car> cars;

  @override
  State<CarsCarrousel> createState() => _CarsCarrouselState();
}

class _CarsCarrouselState extends State<CarsCarrousel> {
  late PageController _pageController;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .75);
    _pageController.addListener(onScroll);
  }

  void onScroll() {
    setState(() {
      _page = _pageController.page!;
    });
  }

  void openDetails(Car car) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (_, animation, animation2) {
          return FadeTransition(
            opacity: animation,
            child: CarDetails(
              title: widget.title,
              car: car,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.removeListener(onScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('See all'),
              )
            ],
          ),
        ),
        SizedBox(
          height: CarCard.height,
          child: PageView(
            controller: _pageController,
            children: List.generate(
              widget.cars.length,
              (index) => Transform.scale(
                scale: lerpDouble(1, .9, (_page - index).abs()),
                child: CarCard(
                  car: widget.cars[index],
                  onTap: () => openDetails(widget.cars[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
