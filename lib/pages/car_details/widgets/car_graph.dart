part of '../car_details.dart';

class CarGraph extends StatefulWidget {
  const CarGraph({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<CarGraph> createState() => _CarGraphState();
}

class _CarGraphState extends State<CarGraph> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 2500), vsync: this)..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              6,
              (index) => Text(
                ((5 - index) * 10).toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        CustomPaint(
          size: Size(widget.size.width * .8, 200),
          painter: GraphPainter(animation: _animationController),
        ),
      ],
    );
  }
}

class GraphPainter extends CustomPainter {
  GraphPainter({
    required this.animation,
  }) : super(repaint: animation);

  final Animation animation;

  final steps = [30, 80, 50, 100, 165, 130, 160];

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..color = Colors.blue;

    final xSegment = size.width ~/ steps.length;
    path.moveTo(0, size.height);
    for (var i = 0; i < steps.length; i++) {
      path.lineTo(xSegment * (i + 1), size.height - steps[i]);
    }

    canvas.drawPath(path, paint);

    var path2 = Path();
    final value = Curves.easeInOut.transform(animation.value);
    path2.addRect(Rect.fromLTRB(size.width * value, 0, size.width, size.height));
    var paint2 = Paint()
      ..strokeWidth = 5
      ..color = Colors.white;

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
