import 'food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant(this.name, this.waitTime, this.distance, this.label, this.logoUrl,
      this.desc, this.score, this.menu);
  static Restaurant generateRestaurant() {
    return Restaurant(
      'Food4Grab',
      '20 - 30 min',
      '2.4km',
      'F4G Avenue',
      'assets/images/res_logo.png',
      'We aim to serve!',
      4.7,
      {
        'Recommend': Food.generateRecommendFoods(),
        'Popular': Food.generatePopularFoods(),
        'Noodles': [
          Food(
              'assets/images/dish2.png',
              'Low fat',
              'Sai Ua Samun Phrai',
              '50 min',
              4.8,
              '325 kcal',
              18,
              1,
              [
                {
                  'Noodle': 'assets/images/ingre1.png',
                },
                {
                  'Shrimp': 'assets/images/ingre2.png',
                },
                {
                  'Egg': 'assets/images/ingre3.png',
                },
                {
                  'Scallion': 'assets/images/ingre4.png',
                },
              ],
              'blah blah blah',
              highLight: false),
          Food(
              'assets/images/dish3.png',
              'Cheesy Goodness',
              'Macaroni',
              '50 min',
              4.8,
              '325 kcal',
              15,
              1,
              [
                {
                  'Noodle': 'assets/images/ingre1.png',
                },
                {
                  'Shrimp': 'assets/images/ingre2.png',
                },
                {
                  'Egg': 'assets/images/ingre3.png',
                },
                {
                  'Scallion': 'assets/images/ingre4.png',
                },
              ],
              'Simply put, ramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodles and a selection of meats or vegetable often topped with a boiled egg.',
              highLight: false),
        ],
        'Pizza': [
          Food(
              'assets/images/dish4.png',
              'Cheesy Delight',
              'Cheese Pizza',
              '50 min',
              4.8,
              '325 kcal',
              13,
              1,
              [
                {
                  'Noodle': 'assets/images/ingre1.png',
                },
                {
                  'Shrimp': 'assets/images/ingre2.png',
                },
                {
                  'Egg': 'assets/images/ingre3.png',
                },
                {
                  'Scallion': 'assets/images/ingre4.png',
                },
              ],
              'Simply put, ramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodles and a selection of meats or vegetable often topped with a boiled egg.',
              highLight: false),
          Food(
              'assets/images/dish3.png',
              'Cheesy Goodness',
              'Macaroni',
              '50 min',
              4.8,
              '325 kcal',
              15,
              1,
              [
                {
                  'Noodle': 'assets/images/ingre1.png',
                },
                {
                  'Shrimp': 'assets/images/ingre2.png',
                },
                {
                  'Egg': 'assets/images/ingre3.png',
                },
                {
                  'Scallion': 'assets/images/ingre4.png',
                },
              ],
              'Simply put, ramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodles and a selection of meats or vegetable often topped with a boiled egg.',
              highLight: false),
          Food(
              'assets/images/dish4.png',
              'Cheesy Delight',
              'Cheese Pizza',
              '50 min',
              4.8,
              '325 kcal',
              13,
              1,
              [
                {
                  'Noodle': 'assets/images/ingre1.png',
                },
                {
                  'Shrimp': 'assets/images/ingre2.png',
                },
                {
                  'Egg': 'assets/images/ingre3.png',
                },
                {
                  'Scallion': 'assets/images/ingre4.png',
                },
              ],
              'Simply put, ramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodles and a selection of meats or vegetable often topped with a boiled egg.',
              highLight: false),
          Food(
              'assets/images/dish3.png',
              'Cheesy Goodness',
              'Macaroni',
              '50 min',
              4.8,
              '325 kcal',
              15,
              1,
              [
                {
                  'Noodle': 'assets/images/ingre1.png',
                },
                {
                  'Shrimp': 'assets/images/ingre2.png',
                },
                {
                  'Egg': 'assets/images/ingre3.png',
                },
                {
                  'Scallion': 'assets/images/ingre4.png',
                },
              ],
              'Simply put, ramen is a Japanese noodle soup, with a combination of a rich flavoured broth, one of a variety of types of noodles and a selection of meats or vegetable often topped with a boiled egg.',
              highLight: false),
        ],
      },
    );
  }
}
