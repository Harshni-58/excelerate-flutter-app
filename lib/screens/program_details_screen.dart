import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Map<String, String> program;

  const ProgramDetailsScreen({
    super.key,
    required this.program,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text(
          'PROGRAM DETAILS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
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
              children: [

                // PROGRAM HEADER
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

                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(25),

                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),

                            decoration: BoxDecoration(
                              color:
                              Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),

                            child: const Icon(
                              Icons.school,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Text(
                            program['title']!,
                            textAlign: TextAlign.center,

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          Container(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 8,
                            ),

                            decoration: BoxDecoration(
                              color:
                              Colors.white.withOpacity(0.2),
                              borderRadius:
                              BorderRadius.circular(20),
                            ),

                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: Colors.white,
                                ),

                                const SizedBox(width: 8),

                                Text(
                                  program['date']!,

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
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

                _buildInfoCard(
                  title: 'About the Program',
                  icon: Icons.info_outline,
                  iconColor:
                  const Color(0xFFFF7A00),

                  child: Text(
                    program['description']!,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                _buildInfoCard(
                  title: 'Schedule',
                  icon: Icons.schedule,
                  iconColor:
                  const Color(0xFFFF1493),

                  child: Text(
                    program['schedule']!,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                _buildInfoCard(
                  title: 'Eligibility',
                  icon: Icons.people,
                  iconColor:
                  const Color(0xFFFF7A00),

                  child: Text(
                    program['eligibility']!,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                _buildInfoCard(
                  title: 'Trainers',
                  icon: Icons.person,
                  iconColor:
                  const Color(0xFFFF1493),

                  child: Text(
                    program['trainers']!,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                _buildInfoCard(
                  title: 'Expected Outcomes',
                  icon: Icons.emoji_events,
                  iconColor:
                  const Color(0xFFFF7A00),

                  child: Text(
                    program['outcomes']!,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 52,

                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient:
                      const LinearGradient(
                        colors: [
                          Color(0xFFFF7A00),
                          Color(0xFFFF1493),
                        ],
                      ),

                      borderRadius:
                      BorderRadius.circular(12),
                    ),

                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Registration feature coming soon!',
                            ),
                          ),
                        );
                      },

                      icon: const Icon(
                        Icons.app_registration,
                        color: Colors.white,
                      ),

                      label: const Text(
                        'REGISTER NOW',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),

                      style:
                      ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.transparent,
                        shadowColor:
                        Colors.transparent,
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

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget child,
  }) {
    return SizedBox(
      width: double.infinity,

      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color:
                  iconColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  size: 30,
                  color: iconColor,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
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