import 'package:flutter/material.dart';
import 'program_details_screen.dart';
import '../widgets/app_drawer.dart';

class ProgramListingScreen extends StatelessWidget {
  const ProgramListingScreen({super.key});

  final List<Map<String, String>> programs = const [
    {
      'title': 'Digital Marketing Bootcamp',
      'date': '20 August 2026',
      'description':
      'Learn digital marketing skills including social media, content creation and online advertising.',
      'schedule':
      'Monday - Friday\n9:00 AM - 4:00 PM\nOnline sessions and practical activities.',
      'eligibility':
      'Open to learners interested in digital marketing, social media and online business.',
      'trainers':
      'Digital marketing specialists and experienced industry professionals.',
      'outcomes':
      '• Create digital marketing campaigns\n'
          '• Develop social media strategies\n'
          '• Understand online advertising\n'
          '• Build practical marketing skills',
      'icon': 'marketing',
    },

    {
      'title': 'Software Development Program',
      'date': '1 September 2026',
      'description':
      'Develop practical programming skills and learn how to build modern software applications.',
      'schedule':
      'Monday - Friday\n9:00 AM - 4:00 PM\nPractical coding sessions and projects.',
      'eligibility':
      'Open to learners interested in programming and software development.',
      'trainers':
      'Software developers and experienced technology professionals.',
      'outcomes':
      '• Learn programming fundamentals\n'
          '• Build software applications\n'
          '• Practice problem solving\n'
          '• Develop a software project',
      'icon': 'software',
    },

    {
      'title': 'Data Analytics Program',
      'date': '15 September 2026',
      'description':
      'Learn how to analyze data and use data-driven insights to solve real-world problems.',
      'schedule':
      'Monday - Friday\n9:00 AM - 4:00 PM\nData analysis exercises and practical projects.',
      'eligibility':
      'Open to learners interested in data analysis, statistics and technology.',
      'trainers':
      'Data analysts and experienced data professionals.',
      'outcomes':
      '• Understand data analysis techniques\n'
          '• Work with real-world datasets\n'
          '• Create data visualizations\n'
          '• Make data-driven decisions',
      'icon': 'data',
    },
  ];

  IconData getProgramIcon(String? type) {
    switch (type) {
      case 'marketing':
        return Icons.campaign;

      case 'software':
        return Icons.code;

      case 'data':
        return Icons.analytics;

      default:
        return Icons.school;
    }
  }

  Color getProgramColor(String? type) {
    switch (type) {
      case 'marketing':
        return const Color(0xFFFF7A00);

      case 'software':
        return const Color(0xFFFF1493);

      case 'data':
        return const Color(0xFFFF7A00);

      default:
        return const Color(0xFFFF1493);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),

      appBar: AppBar(
        title: const Text(
          'PROGRAMS',
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
              children: [
                const SizedBox(height: 5),

                const Text(
                  'Explore Our Programs',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Choose a program and start developing '
                      'skills for your future.',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 25),

                ...programs.map(
                      (program) {
                    final programColor =
                    getProgramColor(program['icon']);

                    return Padding(
                      padding:
                      const EdgeInsets.only(bottom: 20),

                      child: SizedBox(
                        width: double.infinity,

                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [
                                Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,

                                  children: [
                                    Container(
                                      padding:
                                      const EdgeInsets.all(13),

                                      decoration: BoxDecoration(
                                        color: programColor
                                            .withOpacity(0.12),
                                        shape: BoxShape.circle,
                                      ),

                                      child: Icon(
                                        getProgramIcon(
                                            program['icon']),
                                        size: 30,
                                        color: programColor,
                                      ),
                                    ),

                                    const SizedBox(width: 15),

                                    Expanded(
                                      child: Text(
                                        program['title']!,

                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 18),

                                Container(
                                  padding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),

                                  decoration: BoxDecoration(
                                    color:
                                    const Color(0xFFFFF0E6),

                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),

                                  child: Row(
                                    mainAxisSize:
                                    MainAxisSize.min,

                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        size: 17,
                                        color:
                                        Color(0xFFFF7A00),
                                      ),

                                      const SizedBox(width: 8),

                                      Text(
                                        'Starts: ${program['date']}',

                                        style: const TextStyle(
                                          fontWeight:
                                          FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 15),

                                Text(
                                  program['description']!,

                                  style: const TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                  ),
                                ),

                                const SizedBox(height: 18),

                                SizedBox(
                                  width: double.infinity,
                                  height: 48,

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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProgramDetailsScreen(
                                                  program: program,
                                                ),
                                          ),
                                        );
                                      },

                                      icon: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),

                                      label: const Text(
                                        'VIEW DETAILS',

                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold,
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
                              ],
                            ),
                          ),
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
    );
  }
}