import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/program_listing_screen.dart';
import '../screens/login_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // DRAWER HEADER
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFF7A00),
                  Color(0xFFFF1493),
                ],
              ),
            ),

            child: SizedBox(
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.school,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'EXCELERATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),

                  const Text(
                    'Learn • Grow • Succeed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // HOME
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Color(0xFFFF7A00),
            ),

            title: const Text('Home'),

            onTap: () {
              Navigator.pop(context);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                    (route) => false,
              );
            },
          ),

          // PROGRAMS
          ListTile(
            leading: const Icon(
              Icons.school,
              color: Color(0xFFFF1493),
            ),

            title: const Text('Programs'),

            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const ProgramListingScreen(),
                ),
              );
            },
          ),

          // EVENTS
          ListTile(
            leading: const Icon(
              Icons.event,
              color: Color(0xFFFF7A00),
            ),

            title: const Text('Events'),

            onTap: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Events feature coming soon!',
                  ),
                ),
              );
            },
          ),

          // ANNOUNCEMENTS
          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: Color(0xFFFF1493),
            ),

            title: const Text('Announcements'),

            onTap: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Announcements feature coming soon!',
                  ),
                ),
              );
            },
          ),

          // FEEDBACK
          ListTile(
            leading: const Icon(
              Icons.feedback,
              color: Color(0xFFFF7A00),
            ),

            title: const Text('Feedback'),

            onTap: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Feedback feature coming soon!',
                  ),
                ),
              );
            },
          ),

          const Divider(),

          const Spacer(),

          // LOGOUT
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xFFFF1493),
            ),

            title: const Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            onTap: () {
              Navigator.pop(context);

              showDialog(
                context: context,

                builder: (context) {
                  return AlertDialog(
                    title: const Text('Logout'),

                    content: const Text(
                      'Are you sure you want to logout?',
                    ),

                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text('CANCEL'),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const LoginScreen(),
                            ),
                                (route) => false,
                          );
                        },

                        child: const Text('LOGOUT'),
                      ),
                    ],
                  );
                },
              );
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}