import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:spots/features/pages/auth_pages/auth_page.dart';
import 'package:spots/features/pages/home_page.dart';
import 'package:spots/features/pages/maps_page.dart';
import 'package:spots/features/pages/profile_page.dart';
import 'package:spots/features/pages/search_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int _selectedIndex = 0;
  bool _isAuthenticated = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  // Function to check if the user is authenticated
  void _checkAuthentication() async {
    User? user = FirebaseAuth.instance.currentUser;

    // Simulate loading delay for splash screen experience
    await Future.delayed(Duration(seconds: 2));

    if (user != null) {
      // If the user is authenticated, show the main app (with navigation bar)
      setState(() {
        _isAuthenticated = true;
        _isLoading = false;
      });
    } else {
      // If not authenticated, navigate to the authentication page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    }
  }

  _getBody() {
    switch (_selectedIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const MapsPage();
      case 2:
        return const SearchPage();
      case 3:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  _getBottomBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.mapMarker,
                text: 'Maps',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Loading spinner
        ),
      );
    }
    return Scaffold(
      bottomNavigationBar: _getBottomBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Expanded(child: _getBody())],
      ),
    );
  }
}
