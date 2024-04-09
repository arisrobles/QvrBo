import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HYDROGAS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'QvrBo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
           Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    width: 36,
    height: 36,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage('QvrBo.png'), // Updated asset path
        fit: BoxFit.cover,
      ),
    ),
  ),
),

            Text(title),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50, // Height of the navigation buttons row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavButton(title: 'Inns', icon: Icons.hotel),
                NavButton(title: 'Transient', icon: Icons.place),
                NavButton(title: 'Cottages', icon: Icons.house),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 10), // Add bottom margin here
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your destination...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavIconButton(icon: Icons.search, text: 'Search', onPressed: () => print('Search')),
            NavIconButton(icon: Icons.bookmark, text: 'Saved', onPressed: () => print('Saved')),
            NavIconButton(icon: Icons.book, text: 'Booking', onPressed: () => print('Booking')),
            NavIconButton(icon: Icons.person, text: 'Profile', onPressed: () => print('Profile')),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final IconData icon;

  NavButton({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // Handle navigation
        print('Navigating to: $title');
      },
      icon: Icon(icon),
      label: Text(
        title,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class NavIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  NavIconButton({required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 35, // Constrain the height of the IconButton
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
        ),
        SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
