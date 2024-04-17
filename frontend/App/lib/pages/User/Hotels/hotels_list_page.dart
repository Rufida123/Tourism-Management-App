import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_app/pages/User/Hotels/hotel_details_page.dart';

class HotelsListPage extends StatelessWidget {
  HotelsListPage({super.key});
  final List<Hotel> hotels = [
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 2',
        rating: 4.0,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
    Hotel(
        name: 'Hotel 1',
        rating: 4.5,
        city: 'Damascus',
        imageUrl: 'assets/7xm.xyz505070.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Find Hotel',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Search for a Hotel',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      // Defines the appearance of the border when TextFormField is enabled
                      borderSide:
                          BorderSide(color: Color(0xff5FCEB6), width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Defines the appearance of the border when TextFormField is focused
                      borderSide:
                          BorderSide(color: Color(0xff5FCEB6), width: 2.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:
                          Colors.white, // Set the fill color of the container
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.menu, size: 40, color: Color(0xff5FCEB6)),
                        SizedBox(width: 8),
                        Text(
                          'Add Filter',
                          style: TextStyle(
                              color: Color(0xff5FCEB6),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              height: 800,
              child: ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  return HotelsListItem(hotel: hotels[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HotelsListItem extends StatelessWidget {
  final Hotel hotel;

  HotelsListItem({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    hotel.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Color(0xff5FCEB6)),
                          Text('${hotel.city}'),
                          SizedBox(width: 100),
                          Icon(Icons.star, color: Colors.amber),
                          Text('${hotel.rating}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HotelDetailsPage()));
              },
              child: Text(
                'Show Details',
                style: TextStyle(
                  color: Color(0xff5FCEB6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Hotel {
  String name;
  double rating;
  String imageUrl;
  String city;
  Hotel(
      {required this.imageUrl,
      required this.name,
      required this.rating,
      required this.city});
}
