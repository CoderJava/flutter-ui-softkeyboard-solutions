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

class Design2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Design 2'),
      ),
    );
  }
}

