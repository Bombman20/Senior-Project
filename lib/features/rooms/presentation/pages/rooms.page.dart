import 'package:flutter/material.dart';
import 'package:home_automation_app/features/shared/widgets/flicky_animated_icons.dart';
import 'package:home_automation_app/features/shared/widgets/main_page_header.dart';
import 'package:home_automation_app/features/shared/widgets/warning_message.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/styles/flicky_icons_icons.dart';

class RoomsPage extends StatelessWidget {
  static const String route = '/rooms';

  const RoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainPageHeader(
            icon: FlickyAnimatedIcons(
              icon: FlickyAnimatedIconOptions.barrooms,
              size: FlickyAnimatedIconSizes.large,
              isSelected: true,
            ),
            title: 'My Rooms',
          ),
          RoomButton(
            roomName: 'Bedroom 1',
            onTap: () => _showRoomPopup(context, 'Bedroom 1'),
          ),
          RoomButton(
            roomName: 'Bedroom 2',
            onTap: () => _showRoomPopup(context, 'Bedroom 2'),
          ),
          RoomButton(
            roomName: 'Kitchen',
            onTap: () => _showRoomPopup(context, 'Kitchen'),
          ),
          RoomButton(
            roomName: 'Living Room',
            onTap: () => _showRoomPopup(context, 'Living Room'),
          ),
          RoomButton(
            roomName: 'Bathroom',
            onTap: () => _showRoomPopup(context, 'Bathroom'),
          ),
          
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add logic to add a new room
                // For now, let's just print a message
                print('Adding a new room...');
              },
              child: Text('Add New Room'),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showRoomPopup(BuildContext context, String roomName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(roomName),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to add devices
                      Navigator.of(context).pop();
                    },
                    child: Text('Add Devices'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add logic to control devices
                      Navigator.of(context).pop();
                    },
                    child: Text('Control Devices'),
                  ),
                ],
              ),
            ],
          ),
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
}

class RoomButton extends StatelessWidget {
  final String roomName;
  final VoidCallback onTap;

  const RoomButton({
    Key? key,
    required this.roomName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(roomName),
      onTap: onTap,
    );
  }
}