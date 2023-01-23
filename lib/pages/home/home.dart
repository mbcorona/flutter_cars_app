import 'package:cars_app/constants.dart';
import 'package:cars_app/models/car_model.dart';
import 'package:cars_app/widgets/cars_carrousel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.drag_handle,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          "https://www.thehenryford.org/images/default-source/explore/henry-ford.jpg?Status=Master&sfvrsn=6ed62e01_2",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: padding),
                      const Text(
                        'Hi, Henry',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const CarsCarrousel(
                  title: 'Sedans',
                  cars: sedans,
                ),
                const SizedBox(height: padding),
                const CarsCarrousel(
                  title: 'Suvs',
                  cars: suvs,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
