import 'package:flutter/material.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/features/shared/widgets/main_page_header.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  static const String route = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeMode _currentThemeMode = ThemeMode.light;
  bool _notificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
    _loadNotificationStatus();
  }

  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentThemeMode = (prefs.getBool('isDarkMode') ?? false)
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  void _toggleThemeMode(ThemeMode themeMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentThemeMode = themeMode;
    });
    prefs.setBool('isDarkMode', themeMode == ThemeMode.dark);
  }

  void _loadNotificationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
    });
  }

  void _toggleNotifications(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = value;
    });
    prefs.setBool('notificationsEnabled', value);
  }

  void _changeLocation() {
    // Add logic to change location (e.g., show dialog or navigate to location settings page)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Location'),
          content: Text('Select a new location.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _changeTimeZone() {
    // Add logic to change time zone (e.g., show dialog or navigate to time zone settings page)
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Time Zone'),
          content: Text('Select a new time zone.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showTermsAndConditions() {
    // Add logic to navigate to terms and conditions page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainPageHeader(
            icon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barsettings,
              size: FlickyAnimatedIconSizes.large,
              isSelected: true,
            ),
            title: 'My Settings',
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _toggleThemeMode(ThemeMode.light),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Light mode button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Light Mode',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () => _toggleThemeMode(ThemeMode.dark),
              style: ElevatedButton.styleFrom(
                primary: Colors.green[800], // Dark mode button color
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text(
                'Dark Mode',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(), // Divider line
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SwitchListTile(
              title: Text('Notifications'),
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
              activeColor: Colors.green, // Notification switch color when turned on
            ),
          ),
          Divider(), // Divider line
          ListTile(
            title: Text('Change Location'),
            onTap: _changeLocation,
            subtitle: Text('Change your current location'),
            trailing: Icon(Icons.location_on),
          ),
          Divider(), // Divider line
          ListTile(
            title: Text('Change Time Zone'),
            onTap: _changeTimeZone,
            subtitle: Text('Change your current time zone'),
            trailing: Icon(Icons.access_time),
          ),
          
          ListTile(
            title: Text('Terms and Conditions'),
            onTap: _showTermsAndConditions,
            subtitle: Text('View terms and conditions'),
            trailing: Icon(Icons.info),
          ),
        
        ],
      ),
    );
  }
}

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Center(
        child: Text('Terms and Conditions content goes here.'),
      ),
    );
  }
}