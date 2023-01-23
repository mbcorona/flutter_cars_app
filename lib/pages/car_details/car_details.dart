import 'package:cars_app/constants.dart';
import 'package:cars_app/models/car_model.dart';
import 'package:cars_app/widgets/app_box.dart';
import 'package:flutter/material.dart';

part 'widgets/car_graph.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({
    super.key,
    required this.title,
    required this.car,
  });

  final String title;
  final Car car;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const tweeDuration = Duration(milliseconds: 900);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            _appBar(tweeDuration, size),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder<double>(
                duration: tweeDuration,
                tween: Tween(begin: 1, end: 0),
                curve: Curves.easeOut,
                builder: (context, value, _) {
                  return Transform.translate(
                    offset: Offset(0, 500 * value),
                    child: Container(
                      height: size.height * .6,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(padding),
                              child: Text(
                                '${car.brand.toUpperCase()} ${car.model.toUpperCase()}',
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _leftSideSpecs(value, size),
                                _rightSideSpecs(value, size),
                              ],
                            ),
                            const Divider(
                              thickness: 1,
                              height: padding * 2,
                              indent: padding,
                              endIndent: padding,
                            ),
                            const Text('GAS MILLAGE (MPG)'),
                            CarGraph(size: size)
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 100,
              bottom: size.height * .61,
              child: Hero(
                tag: car.model,
                child: Image.asset(car.image),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _rightSideSpecs(double value, Size size) {
    return Expanded(
      child: Transform.translate(
        offset: Offset(200 * value + 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: size.width / 2 - padding / 2,
              child: AppBox(
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'YEAR OF ISSUE\n',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '${car.year}',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: padding),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: padding * 2),
                child: Text(
                  '${car.topSpeed}\n${car.engine}\n${car.power}',
                  style: const TextStyle(height: 2, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.end,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded _leftSideSpecs(double value, Size size) {
    return Expanded(
      child: Transform.translate(
        offset: Offset(-200 * value - 10, 0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: size.width / 2 - padding / 2,
              child: AppBox(
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'COST\n',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '\$${car.price}',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: padding),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: padding * 2),
                child: Text(
                  'Top speed (Mph)\nEngine\nPower',
                  style: TextStyle(height: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TweenAnimationBuilder<double> _appBar(Duration tweeDuration, Size size) {
    return TweenAnimationBuilder<double>(
      duration: tweeDuration,
      tween: Tween(begin: 1, end: 0),
      curve: Curves.easeOut,
      builder: (context, double value, _) {
        return Transform.translate(
          offset: Offset(0, -500 * value),
          child: Container(
            height: size.height * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.blueGrey.withOpacity(.3),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.chevron_left)),
                        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.threesixty_rounded),
              ],
            ),
          ),
        );
      },
    );
  }
}
