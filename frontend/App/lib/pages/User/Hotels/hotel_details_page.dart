import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:tourism_app/components/rating_dialog.dart';

class HotelDetailsPage extends StatelessWidget {
  HotelDetailsPage({super.key});
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    double hotelRating = 4.5;
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_buildTop(context), _buildBottom(context, hotelRating)],
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    final PageController pageController = PageController();
    final int pageCount = 3;
    return Column(
      children: [
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: PageIndicatorContainer(
            align: IndicatorAlign.bottom,
            length: pageCount,
            indicatorSpace: 10.0,
            padding: const EdgeInsets.all(10),
            indicatorColor: Colors.grey,
            indicatorSelectorColor: Color.fromARGB(255, 8, 145, 125),
            shape: IndicatorShape.circle(size: 8),
            child: PageView(
              controller: pageController,
              children: <Widget>[
                Image.asset("assets/7xm.xyz505070.jpg", fit: BoxFit.cover),
                Image.asset("assets/7xm.xyz472146.jpg", fit: BoxFit.cover),
                Image.asset("assets/308 Palmyra  (Syria).jpeg",
                    fit: BoxFit.cover),
                // Add more images as needed
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottom(BuildContext context, double rating) {
    return Container(
      color: Color.fromARGB(255, 220, 243, 237),
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hotel Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  FavoriteButton()
                ],
              ),
              InkWell(
                onTap: () {
                  showRatingDialog(context, (newRating) {
                    print('User rated: $newRating');
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text('$rating'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Description:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  'ttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt'),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false; // Initial favorite status

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: isFavorite
          ? Colors.red
          : null, // Color the heart red if it's a favorite
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite; // Toggle the favorite status
        });
        // Add additional logic if needed, such as updating a list or saving the status
      },
    );
  }
}
