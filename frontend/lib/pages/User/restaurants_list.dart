import 'package:flutter/material.dart';

class RestaurantsList extends StatelessWidget {
  RestaurantsList({super.key});
  final List<Restaurant> restaurants = [
    Restaurant(
        name: 'Restaurant 1',
        rating: 4.5,
        imageUrl: 'assets/7xm.xyz472146.jpg'),
    Restaurant(
        name: 'Restaurant 2',
        rating: 4.0,
        imageUrl: 'assets/7xm.xyz472146.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantListItem(restaurant: restaurants[index]);
        },
      ),
    );
  }
}

class RestaurantListItem extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantListItem({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              restaurant.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text('${restaurant.rating}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Restaurant {
  String name;
  double rating;
  String imageUrl;
  Restaurant(
      {required this.imageUrl, required this.name, required this.rating});
}
