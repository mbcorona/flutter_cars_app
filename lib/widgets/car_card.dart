import 'package:cars_app/constants.dart';
import 'package:cars_app/models/car_model.dart';
import 'package:flutter/material.dart';

class CarCard extends StatefulWidget {
  static const double height = 200;
  const CarCard({
    super.key,
    required this.car,
    this.onTap,
  });

  final Car car;
  final VoidCallback? onTap;

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  final animationDuration = const Duration(milliseconds: 1500);
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          animate = !animate;
          if (animate) {
            Future.delayed(animationDuration, () {
              setState(() {
                animate = false;
              });
            });
          }
        });
        Future.delayed(
          const Duration(milliseconds: 600),
          widget.onTap?.call,
        );
      },
      child: SizedBox(
        height: CarCard.height,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: padding,
              bottom: padding,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              left: padding,
              right: 0,
              bottom: 0,
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  color: const Color(0xFF192129),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: '${widget.car.brand} ${widget.car.model}, ${widget.car.year}\n',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: '\$${widget.car.price}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ]),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_right_alt_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 60,
              child: Hero(
                tag: widget.car.model,
                child: TweenAnimationBuilder<double>(
                  key: Key(animate.toString()),
                  duration: animationDuration,
                  tween: Tween(begin: animate ? 0 : 1, end: 1),
                  builder: (context, double value, _) {
                    return Transform.scale(
                      scale: (2 - const ElasticOutCurve(.5).transform(value)).clamp(.8, 1),
                      child: Image.asset(
                        widget.car.image,
                        height: CarCard.height - 70,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
