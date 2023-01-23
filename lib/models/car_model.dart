class Car {
  const Car({
    required this.image,
    required this.brand,
    required this.model,
    required this.year,
    required this.price,
    required this.topSpeed,
    required this.engine,
    required this.power,
  });

  final String image;
  final String brand;
  final String model;
  final int year;
  final int price;
  final int topSpeed;
  final String engine;
  final int power;
}

const sedans = [
  Car(
    image: 'assets/ford_mustang.png',
    brand: 'Ford',
    model: 'Mustang',
    year: 2022,
    price: 27470,
    topSpeed: 230,
    engine: '5.0L V8',
    power: 310,
  ),
  Car(
    image: 'assets/mustang_shelby.png',
    brand: 'Ford',
    model: 'Mustang Shelby',
    year: 2022,
    price: 45470,
    topSpeed: 430,
    engine: '5.0L V8',
    power: 410,
  ),
];

const suvs = [
  Car(
    image: 'assets/ford_escape.png',
    brand: 'Ford',
    model: 'Escape',
    year: 2022,
    price: 35470,
    topSpeed: 180,
    engine: '2.0L',
    power: 200,
  ),
  Car(
    image: 'assets/ford_bronco.png',
    brand: 'Ford',
    model: 'Bronco',
    year: 2022,
    price: 39000,
    topSpeed: 230,
    engine: '3.0L',
    power: 410,
  ),
  Car(
    image: 'assets/mach_e.png',
    brand: 'Ford',
    model: 'Mustang Mach E',
    year: 2022,
    price: 39000,
    topSpeed: 230,
    engine: '3.0L',
    power: 410,
  ),
];
