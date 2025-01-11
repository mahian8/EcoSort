import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // Set HomePage as the default page
    );
  }
}

// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Tracks active tab
  final List<Widget> _pages = [
    HomeContent(),
    ResourcesPage(),
    HistoryPage(),
    SettingsPage()
  ];

  final List<Color> _pageColors = [
    Color(0xFFCCE8CF), // Light green for Home
    Color(0xFFDDE7F3), // Light blue for Resources
    Color(0xFFF7E5CC), // Light peach for History
    Color(0xFFF6F6F6), // Light gray for Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _pageColors[_currentIndex],
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF5B403A), // Dark brown for active icon
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update active tab index
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book), label: 'Resources'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

// Home Content
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Sarah!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Ready to sort waste today?',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Image.network(
                'https://example.com/home_page_illustration.jpg', // Replace with actual illustration URL
                height: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// History Page
class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Monthly Summary',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('127\nItems Sorted',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              Text('78%\nRecyclable',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            ],
          ),
          const Divider(height: 20, thickness: 1),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text('Plastic Bottle'),
                  subtitle: Text('Today, 2:30 PM'),
                  trailing: Text('Recyclable'),
                ),
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text('Food Waste'),
                  subtitle: Text('Today, 1:15 PM'),
                  trailing: Text('Compost'),
                ),
                ListTile(
                  leading: Icon(Icons.restore),
                  title: Text('Cardboard Box'),
                  subtitle: Text('Yesterday, 2:20 PM'),
                  trailing: Text('Recyclable'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Resources Page
class ResourcesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Learn about waste management',
                style: TextStyle(fontSize: 24)),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: ListTile(
              title: const Text('Tips for Sorting Waste'),
              subtitle: const Text(
                  'Learn the basics of waste sorting and make a positive impact on the environment'),
              onTap: () {
                // Link to Article Page
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: const ListTile(
              title: Text('City Recycling Initiative'),
              subtitle: Text('Learn about local recycling programs'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: const ListTile(
              title: Text('Community Composting'),
              subtitle: Text('Join neighborhood composting efforts'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}

// Settings Page

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Top Background
          Container(
            height: 180,
            color: Color(0xFF6C4A3A), // Brown header background
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Top Section with Logout Icon
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 150,
                      color: Color(0xFF6C4A3A),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Add logout functionality here
                        },
                      ),
                    ),
                  ],
                ),
                // Profile Picture Section
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/profile_image.jpg'), // Replace with your image
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Sarah Johnson",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Settings Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Account Settings
                      const SizedBox(height: 20),
                      const Text(
                        "Account Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SettingItem(
                        title: "Update Profile",
                        subtitle: "Change your account profile",
                        onTap: () {},
                      ),
                      SettingItem(
                        title: "Delete Account",
                        subtitle: "Permanently remove your account",
                        textColor: Colors.red,
                        onTap: () {},
                      ),
                      // Notification Settings
                      const SizedBox(height: 20),
                      const Text(
                        "Notifications Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ToggleItem(
                        title: "Reminders",
                        subtitle: "Get notified about upcoming events",
                      ),
                      ToggleItem(
                        title: "Updates",
                        subtitle: "Receive news and announcements",
                      ),
                      // App Preferences
                      const SizedBox(height: 20),
                      const Text(
                        "App Preferences",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ToggleItem(
                        title: "Dark Mode",
                        subtitle: "Switch to dark theme",
                      ),
                      SettingItem(
                        title: "Language",
                        subtitle: "English",
                        onTap: () {},
                      ),
                      // Support Section
                      const SizedBox(height: 20),
                      const Text(
                        "Support",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SettingItem(
                        title: "Send Feedback",
                        subtitle: "Help us improve",
                        onTap: () {},
                      ),
                      SettingItem(
                        title: "Contact Support",
                        subtitle: "Get help with issues",
                        onTap: () {},
                      ),
                      SettingItem(
                        title: "User Manual",
                        subtitle: "",
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color textColor;
  final VoidCallback onTap;

  const SettingItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.textColor = Colors.black,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class ToggleItem extends StatefulWidget {
  final String title;
  final String subtitle;

  const ToggleItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  _ToggleItemState createState() => _ToggleItemState();
}

class _ToggleItemState extends State<ToggleItem> {
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(widget.subtitle),
      trailing: Switch(
        value: isToggled,
        onChanged: (value) {
          setState(() {
            isToggled = value;
          });
        },
      ),
    );
  }
}

// Utility Widgets
class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color? titleColor;

  SettingsTile({
    required this.title,
    required this.subtitle,
    this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class ToggleTile extends StatelessWidget {
  final String title;
  final String subtitle;

  ToggleTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: true, onChanged: (bool value) {}),
    );
  }
}

class HistoryTile extends StatelessWidget {
  final String title;
  final String subtitle;

  HistoryTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
