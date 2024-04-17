import 'package:flutter/material.dart';
import 'package:tourism_app/pages/User/Hotels/hotels_list_page.dart';

class HomePage extends StatelessWidget {
  late Color myColor;
  late Size mediaSize;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
            image: const AssetImage("assets/7xm.xyz505070.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              myColor.withOpacity(0.2),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(0, 201, 228, 228),
          body: SingleChildScrollView(
            child: Column(
              children: [_buildTop(), _buildBottom(context)],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.access_time_rounded),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildBottom(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
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
            child: _buildForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCircle(Color.fromARGB(255, 160, 220, 211), Icons.flight,
                context, () {}),
            _buildCircle(
              Colors.yellow,
              Icons.hotel,
              context,
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelsListPage()));
              },
            ),
            _buildCircle(const Color.fromARGB(255, 179, 99, 194),
                Icons.restaurant, context, () {}),
            _buildCircle(const Color.fromARGB(255, 82, 154, 213),
                Icons.local_attraction, context, () {}),
          ],
        ),
        SizedBox(height: 8),
        Text(
          "Highest Rated hotels :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPlaceItem("assets/7xm.xyz505070.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 4.0),
              _buildPlaceItem("assets/7xm.xyz505070.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 3.0),
              _buildPlaceItem("assets/7xm.xyz505070.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 3.5),
              _buildPlaceItem("assets/7xm.xyz505070.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 4.5),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Highest Rated Restaurants :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPlaceItem("assets/7xm.xyz472146.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 4.5),
              _buildPlaceItem("assets/7xm.xyz472146.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 4.0),
              _buildPlaceItem("assets/7xm.xyz472146.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 3.5),
              _buildPlaceItem("assets/7xm.xyz472146.jpg", "FourSeason",
                  Icons.location_on, 'Damascus', Icons.star, 4.2),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Place to Visit :",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPlaceItem("assets/308 Palmyra  (Syria).jpeg", "Palmyra",
                  Icons.location_on, 'Damascus', Icons.star, 4.5),
              _buildPlaceItem("assets/308 Palmyra  (Syria).jpeg", "Palmyra",
                  Icons.location_on, 'Damascus', Icons.star, 4.0),
              _buildPlaceItem("assets/308 Palmyra  (Syria).jpeg", "Palmyra",
                  Icons.location_on, 'Damascus', Icons.star, 3.8),
              _buildPlaceItem("assets/308 Palmyra  (Syria).jpeg", "Palmyra",
                  Icons.location_on, 'Damascus', Icons.star, 4.8),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircle(Color color, IconData iconData, BuildContext context,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildPlaceItem(String imagePath, String name, IconData locatioIcon,
      String city, IconData StarIcon, double rating) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                imagePath,
                width: 150,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontSize: 16),
            ),
            Row(
              children: [
                Icon(
                  locatioIcon,
                  color: Colors.grey,
                  size: 20,
                ),
                Text('$city'),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  StarIcon,
                  color: Colors.yellow,
                  size: 20,
                ),
                Text('$rating'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      height: 200,
      width: mediaSize.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Welcome to",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 2,
                ),
              ),
              Text(
                " Syria",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
