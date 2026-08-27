import 'package:flutter/material.dart';

import 'registration_screen.dart';
import '../models/program.dart';
import '../widgets/app_drawer.dart';

class ProgramDetailsScreen extends StatelessWidget {
  const ProgramDetailsScreen({
    super.key,
    required this.program,
    required this.userEmail,
  });

  final Program program;
  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        userEmail: userEmail,
      ),

      appBar: AppBar(
        title: const Text(
          'PROGRAM DETAILS',
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
        padding: const EdgeInsets.all(16),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ==========================================
                // PROGRAM HEADER
                // ==========================================

                SizedBox(
                  width: double.infinity,

                  child: Container(
                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFF7A00),
                          Color(0xFFFF1493),
                        ],
                      ),

                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(
                      children: [

                        Container(
                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.school,
                            color: Colors.white,
                            size: 45,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          program.title,
                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,

                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 18,
                            ),

                            const SizedBox(width: 8),

                            Text(
                              program.startDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ==========================================
                // ABOUT THE PROGRAM
                // ==========================================

                _buildInfoCard(
                  icon: Icons.info_outline,
                  title: 'About the Program',

                  child: Text(
                    program.description,

                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ==========================================
                // SCHEDULE
                // ==========================================

                _buildInfoCard(
                  icon: Icons.schedule,
                  title: 'Schedule',

                  child: Text(
                    program.schedule,

                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ==========================================
                // ELIGIBILITY
                // ==========================================

                _buildInfoCard(
                  icon: Icons.people_outline,
                  title: 'Eligibility',

                  child: Text(
                    program.eligibility,

                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ==========================================
                // TRAINERS
                // ==========================================

                _buildInfoCard(
                  icon: Icons.person_outline,
                  title: 'Trainers',

                  child: Text(
                    program.trainers,

                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ==========================================
                // EXPECTED OUTCOMES
                // ==========================================

                _buildInfoCard(
                  icon: Icons.check_circle_outline,
                  title: 'Expected Outcomes',

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: program.outcomes.map(
                          (outcome) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),

                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFFFF1493),
                                size: 20,
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  outcome,

                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),

                const SizedBox(height: 24),

                // ==========================================
                // REGISTER BUTTON
                // ==========================================

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFF7A00),
                          Color(0xFFFF1493),
                        ],
                      ),

                      borderRadius:
                      BorderRadius.circular(12),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF1493)
                              .withOpacity(0.25),

                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                RegistrationScreen(
                                  program: program,
                                  userEmail: userEmail,
                                ),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.transparent,

                        shadowColor:
                        Colors.transparent,

                        foregroundColor:
                        Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      child: const Text(
                        'REGISTER NOW',

                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
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

  // ================================================
  // REUSABLE INFORMATION CARD
  // ================================================

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return SizedBox(
      width: double.infinity,

      child: Card(
        elevation: 3,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        child: Padding(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,

            children: [

              Row(
                children: [

                  Container(
                    padding:
                    const EdgeInsets.all(8),

                    decoration: BoxDecoration(
                      color: const Color(0xFFFF1493)
                          .withOpacity(0.1),

                      borderRadius:
                      BorderRadius.circular(10),
                    ),

                    child: Icon(
                      icon,

                      color:
                      const Color(0xFFFF1493),

                      size: 24,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: Text(
                      title,

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              child,
            ],
          ),
        ),
      ),
    );
  }
}