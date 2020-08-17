import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildScrollView'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Design 1'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Design1Page()));
              },
            ),
            RaisedButton(
              child: Text('Design 2'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Design2Page()));
              },
            ),
            RaisedButton(
              child: Text('Design 3'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return Design3Page();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Design1Page extends StatefulWidget {
  @override
  _Design1PageState createState() => _Design1PageState();
}

class _Design1PageState extends State<Design1Page> {
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var heightScreen = mediaQueryData.size.height;
    var paddingTop = mediaQueryData.padding.top;
    var paddingBottom = mediaQueryData.padding.bottom;
    return Scaffold(
      body: Stack(
        // bungkus dengan widget SingleChildScrollView dan ConstrainedBox dengan maxHeight = heightScreen
        children: [
          Image.asset(
            'assets/img_sunset.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 16,
              top: paddingTop,
              right: 16,
              bottom: paddingBottom > 0 ? paddingBottom : 16,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(36),
                          ),
                        ),
                        padding: EdgeInsets.all(24),
                        child: Image.asset(
                          'assets/img_location_marker.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Discover new place\nyou will love',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: isRememberMe,
                                  onChanged: (value) => setState(() => isRememberMe = !isRememberMe),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('Remember me'),
                            ],
                          ),
                          Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: RaisedButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            // do login
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Design2Page extends StatefulWidget {
  @override
  _Design2PageState createState() => _Design2PageState();
}

class _Design2PageState extends State<Design2Page> {
  final controllerSearch = TextEditingController();
  final listHotels = <Hotel>[
    Hotel(
      'The London West Hollywood',
      '1020 North San Vicente Boulevard',
      'assets/hotel_1.jpg',
      4.5,
      2243,
      200,
    ),
    Hotel(
      'Hotel Casa del Mar',
      '1910 Ocean Way, Santa Monica',
      'assets/hotel_2.jpg',
      4.7,
      1379,
      175,
    ),
    Hotel(
      'Viceroy L\'Ermitage Beverly Hills',
      '9291 Burton Way, Beverly Hills',
      'assets/hotel_3.jpg',
      4.2,
      1089,
      170,
    ),
    Hotel(
      'Shutters on the Beach',
      '1 Pico Blvd, Santa Monica',
      'assets/hotel_4.jpg',
      4.0,
      2025,
      180,
    ),
    Hotel(
      'Kimpton La Peer Hotel',
      '627 N La Peer Dr, Hollywood Barat',
      'assets/hotel_5.jpg',
      4.5,
      214,
      250,
    ),
    Hotel(
      'The NoMad Hotel Los Angeles',
      '649 S Olive St, Los Angeles',
      'assets/hotel_6.jpg',
      3.8,
      205,
      217,
    ),
    Hotel(
      'SLS Hotel Beverly Hills',
      '465 S. La Cienega Boulevard, Los Angeles',
      'assets/hotel_7.jpg',
      4.0,
      2365,
      195,
    ),
    Hotel(
      'Waldorf Astoria Beverly Hills',
      '9850 Wilshire Boulevard, Beverly Hills',
      'assets/hotel_8.jpg',
      4.5,
      697,
      300,
    ),
    Hotel(
      'Hotel Bel-Air',
      '701 Stone Canyon Rd, Los Angeles',
      'assets/hotel_9.jpg',
      4.5,
      830,
      270,
    ),
    Hotel(
      'The Peninsula Beverly Hills',
      '9882 Santa Monica Blvd, Beverly Hills',
      'assets/hotel_10.jpg',
      4.8,
      1052,
      350,
    ),
  ];
  final listSearchHotels = <Hotel>[];

  @override
  void initState() {
    listSearchHotels.addAll(listHotels);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var paddingTop = mediaQueryData.padding.top;
    var paddingBottom = mediaQueryData.padding.bottom;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.red,
              padding: EdgeInsets.only(
                top: paddingTop,
              ),
              height: 256,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Search Hotels',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controllerSearch,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Hotel Search',
                                isDense: true,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                              textInputAction: TextInputAction.search,
                              onChanged: (value) {
                                var keyword = controllerSearch.text.trim();
                                if (keyword.isEmpty) {
                                  listSearchHotels.clear();
                                  listSearchHotels.addAll(listHotels);
                                  setState(() {});
                                }
                              },
                              onSubmitted: (value) {
                                listSearchHotels.clear();
                                if (value.isEmpty) {
                                  listSearchHotels.addAll(listHotels);
                                  return;
                                }
                                for (var elementHotel in listHotels) {
                                  if (elementHotel.name.toLowerCase().contains(value.trim().toLowerCase())) {
                                    listSearchHotels.add(elementHotel);
                                  }
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 128,
                    height: 42,
                    child: RaisedButton(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        var keyword = controllerSearch.text;
                        listSearchHotels.clear();
                        if (keyword.isEmpty) {
                          listSearchHotels.addAll(listHotels);
                          return;
                        }
                        for (var elementHotel in listHotels) {
                          if (elementHotel.name.toLowerCase().contains(keyword.trim().toLowerCase())) {
                            listSearchHotels.add(elementHotel);
                          }
                        }
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: listSearchHotels.isNotEmpty
                  ? ListView.builder(
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16,
                        bottom: paddingBottom > 0 ? paddingBottom : 16,
                        right: 16,
                      ),
                      itemBuilder: (context, index) {
                        var itemHotel = listHotels[index];
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image.asset(
                                  itemHotel.photo,
                                  width: 96,
                                  height: 96,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 96,
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        itemHotel.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        itemHotel.address,
                                        style: Theme.of(context).textTheme.caption,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: _buildWidgetRatingBar(
                                                itemHotel.rating,
                                                itemHotel.review,
                                                context,
                                              ),
                                            ),
                                            Text(
                                              '\$' + itemHotel.price.toString() + '/night',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: listSearchHotels.length,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/img_not_found.png',
                          width: double.infinity,
                        ),
                        Text('Hm, We couldn\'t find the hotel you were looking for'),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetRatingBar(double rating, int review, BuildContext context) {
    var ratingInt = rating.toInt();
    var isHalf = rating % ratingInt > 0;
    var listWidgets = <Widget>[];
    final iconSize = 16.0;
    final colorRating = Colors.orange;
    for (var number = 1; number <= 5; number++) {
      if (number - 1 == ratingInt) {
        if (isHalf) {
          listWidgets.add(
            Icon(
              Icons.star_half,
              color: colorRating,
              size: iconSize,
            ),
          );
        } else {
          listWidgets.add(
            Icon(
              Icons.star,
              color: Colors.grey,
              size: iconSize,
            ),
          );
        }
      } else if (number <= ratingInt) {
        listWidgets.add(
          Icon(
            Icons.star,
            color: colorRating,
            size: iconSize,
          ),
        );
      } else {
        listWidgets.add(
          Icon(
            Icons.star,
            color: Colors.grey,
            size: iconSize,
          ),
        );
      }
    }
    listWidgets.add(
      Text(
        '$review Reviews',
        style: Theme.of(context).textTheme.caption,
      ),
    );
    return Row(
      children: listWidgets,
    );
  }
}

class Design3Page extends StatefulWidget {
  @override
  _Design3PageState createState() => _Design3PageState();
}

class _Design3PageState extends State<Design3Page> {
  final listUsers = <User>[
    User('assets/user_1.jpg', 'Anastasiya Pavlolva', false),
    User('assets/user_2.jpg', 'Joseph Gonzalez', false),
    User('assets/user_3.jpg', 'Stefan Stefancik', false),
    User('assets/user_4.jpg', 'Amir Mohammad HP', false),
    User('assets/user_5.jpg', 'Alexandru Zdrobau', false),
    User('assets/user_6.jpg', 'Matheus Ferrero', false),
    User('assets/user_7.jpg', 'Valerie Elash', false),
    User('assets/user_8.jpg', 'Sam Burriss', false),
    User('assets/user_9.jpg', 'Joel Mott', false),
    User('assets/user_10.jpg', 'Isaac Castillejos', false),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var paddingBottom = mediaQueryData.padding.bottom;
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
        bottom: paddingBottom > 0 ? paddingBottom : 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(999),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Share question',
            style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Divider(color: Colors.grey),
          Container(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                var itemUser = listUsers[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      itemUser.isChecked = !itemUser.isChecked;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: !itemUser.isChecked
                                    ? null
                                    : Border.all(
                                        color: Colors.red,
                                        width: 2,
                                      ),
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  itemUser.photo,
                                  width: 64,
                                  height: 64,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: !itemUser.isChecked ? Colors.white : Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: !itemUser.isChecked
                                    ? Container()
                                    : Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 72,
                          child: Text(
                            itemUser.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption.copyWith(color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: listUsers.length,
            ),
          ),
          Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Add note (optional)',
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
            child: SizedBox(
              width: double.infinity,
              height: 42,
              child: RaisedButton(
                child: Text('Send', style: TextStyle(color: Colors.white),),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {
                  // TODO: do something in here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Hotel {
  final String name;
  final String address;
  final String photo;
  final double rating;
  final int review;
  final int price;

  Hotel(
    this.name,
    this.address,
    this.photo,
    this.rating,
    this.review,
    this.price,
  );
}

class User {
  final String photo;
  final String name;
  bool isChecked;

  User(this.photo, this.name, this.isChecked);
}
