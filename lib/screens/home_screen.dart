import 'package:flutter/material.dart';

import 'program_listing_screen.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        userEmail: userEmail,
      ),

      appBar: AppBar(
        title: const Text(
          'EXCELERATE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),

        centerTitle: true,

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFF7A00),
                Color(0xFFFF1493),
              ],
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.center,

              children: [

                // ==========================================
                // WELCOME CARD
                // ==========================================

                SizedBox(
                  width: double.infinity,

                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [
                          Color(0xFFFF7A00),
                          Color(0xFFFF1493),
                        ],
                      ),

                      borderRadius:
                      BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color:
                          Colors.black.withOpacity(0.12),

                          blurRadius: 10,

                          offset:
                          const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding:
                      const EdgeInsets.all(25),

                      child: Column(
                        children: [

                          Container(
                            padding:
                            const EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              color:
                              Colors.white.withOpacity(
                                0.2,
                              ),

                              shape:
                              BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.school,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 15),

                          const Text(
                            'Welcome to Excelerate!',

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Discover programs, develop your skills '
                                'and find new opportunities.',

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ==========================================
                // UPCOMING PROGRAMS
                // ==========================================

                SizedBox(
                  width: double.infinity,

                  child: Card(
                    elevation: 3,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),

                    child: Padding(
                      padding:
                      const EdgeInsets.all(20),

                      child: Column(
                        children: [

                          const Icon(
                            Icons.event_available,
                            size: 35,
                            color:
                            Color(0xFFFF7A00),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Upcoming Programs',

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(
                              fontSize: 21,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          ListTile(
                            contentPadding:
                            EdgeInsets.zero,

                            leading: Container(
                              padding:
                              const EdgeInsets.all(
                                8,
                              ),

                              decoration:
                              BoxDecoration(
                                color:
                                const Color(
                                  0xFFFF1493,
                                ).withOpacity(0.1),

                                shape:
                                BoxShape.circle,
                              ),

                              child: const Icon(
                                Icons.campaign,
                                size: 30,
                                color:
                                Color(0xFFFF1493),
                              ),
                            ),

                            title: const Text(
                              'Digital Marketing Bootcamp',

                              style: TextStyle(
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            subtitle: const Text(
                              '20 August 2026 • Online',
                            ),

                            trailing:
                            const Icon(
                              Icons
                                  .arrow_forward_ios,
                              size: 18,
                              color:
                              Color(0xFFFF7A00),
                            ),

                            onTap: () {

                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                      ProgramListingScreen(
                                        userEmail:
                                        userEmail,
                                      ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ==========================================
                // ANNOUNCEMENTS
                // ==========================================

                SizedBox(
                  width: double.infinity,

                  child: Card(
                    elevation: 3,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),

                    child: Padding(
                      padding:
                      const EdgeInsets.all(20),

                      child: Column(
                        children: [

                          const Icon(
                            Icons.notifications_active,
                            size: 40,
                            color:
                            Color(0xFFFF1493),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Announcements',

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(
                              fontSize: 21,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Container(
                            width: double.infinity,

                            padding:
                            const EdgeInsets.all(
                              15,
                            ),

                            decoration:
                            BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                12,
                              ),

                              gradient:
                              const LinearGradient(
                                colors: [
                                  Color(0xFFFFF0E6),
                                  Color(0xFFFFE6F3),
                                ],
                              ),
                            ),

                            child: const Column(
                              children: [

                                Text(
                                  'New Workshop Available',

                                  textAlign:
                                  TextAlign.center,

                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 6),

                                Text(
                                  'Registration is now open for the '
                                      'upcoming workshop.',

                                  textAlign:
                                  TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ==========================================
                // QUICK LINKS
                // ==========================================

                SizedBox(
                  width: double.infinity,

                  child: Card(
                    elevation: 3,

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(16),
                    ),

                    child: Padding(
                      padding:
                      const EdgeInsets.all(20),

                      child: Column(
                        children: [

                          const Text(
                            'Quick Links',

                            textAlign:
                            TextAlign.center,

                            style: TextStyle(
                              fontSize: 21,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Wrap(
                            alignment:
                            WrapAlignment.center,

                            spacing: 30,
                            runSpacing: 20,

                            children: [

                              // PROGRAMS
                              _quickLink(
                                Icons.school,
                                'Programs',
                                const Color(
                                  0xFFFF7A00,
                                ),

                                onTap: () {

                                  Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                          ProgramListingScreen(
                                            userEmail:
                                            userEmail,
                                          ),
                                    ),
                                  );
                                },
                              ),

                              // EVENTS
                              _quickLink(
                                Icons.event,
                                'Events',
                                const Color(
                                  0xFFFF1493,
                                ),
                              ),

                              // FEEDBACK
                              _quickLink(
                                Icons.feedback,
                                'Feedback',
                                const Color(
                                  0xFFFF7A00,
                                ),
                              ),

                              // PROFILE
                              _quickLink(
                                Icons.person,
                                'Profile',
                                const Color(
                                  0xFFFF1493,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // QUICK LINK WIDGET
  // ==========================================

  Widget _quickLink(
      IconData icon,
      String label,
      Color iconColor, {
        VoidCallback? onTap,
      }) {
    return GestureDetector(
      onTap: onTap,

      child: SizedBox(
        width: 80,

        child: Column(
          children: [

            Container(
              padding:
              const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color:
                iconColor.withOpacity(0.1),

                shape:
                BoxShape.circle,
              ),

              child: Icon(
                icon,
                size: 30,
                color: iconColor,
              ),
            ),

            const SizedBox(height: 7),

            Text(
              label,
              textAlign:
              TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}