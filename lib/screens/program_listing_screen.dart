import 'package:flutter/material.dart';

import '../models/program.dart';
import '../services/program_service.dart';
import '../widgets/app_drawer.dart';
import 'program_details_screen.dart';

class ProgramListingScreen extends StatefulWidget {
  const ProgramListingScreen({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  State<ProgramListingScreen> createState() =>
      _ProgramListingScreenState();
}

class _ProgramListingScreenState
    extends State<ProgramListingScreen> {

  final ProgramService _programService = ProgramService();

  late Future<List<Program>> _programsFuture;

  @override
  void initState() {
    super.initState();

    _programsFuture =
        _programService.fetchPrograms();
  }

  void _retryLoadingPrograms() {
    setState(() {
      _programsFuture =
          _programService.fetchPrograms();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        userEmail: widget.userEmail,
      ),

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

      body: FutureBuilder<List<Program>>(
        future: _programsFuture,

        builder: (context, snapshot) {

          // ==========================================
          // LOADING
          // ==========================================

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,

                children: [

                  CircularProgressIndicator(
                    color: Color(0xFFFF1493),
                  ),

                  SizedBox(height: 16),

                  Text(
                    'Loading programs...',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                      FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }

          // ==========================================
          // ERROR
          // ==========================================

          if (snapshot.hasError) {

            return Center(
              child: Padding(
                padding:
                const EdgeInsets.all(24),

                child: Card(
                  elevation: 4,

                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                  ),

                  child: Padding(
                    padding:
                    const EdgeInsets.all(24),

                    child: Column(
                      mainAxisSize:
                      MainAxisSize.min,

                      children: [

                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 55,
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        const Text(
                          'Unable to load programs',

                          style: TextStyle(
                            fontSize: 20,
                            fontWeight:
                            FontWeight.bold,
                          ),

                          textAlign:
                          TextAlign.center,
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        const Text(
                          'Something went wrong while loading the program data.',

                          textAlign:
                          TextAlign.center,
                        ),

                        const SizedBox(
                          height: 20,
                        ),

                        ElevatedButton.icon(
                          onPressed:
                          _retryLoadingPrograms,

                          icon: const Icon(
                            Icons.refresh,
                          ),

                          label:
                          const Text('RETRY'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          // ==========================================
          // EMPTY
          // ==========================================

          if (!snapshot.hasData ||
              snapshot.data!.isEmpty) {

            return const Center(
              child: Text(
                'No programs available.',

                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.w500,
                ),
              ),
            );
          }

          // ==========================================
          // SUCCESS
          // ==========================================

          final programs =
          snapshot.data!;

          return ListView.builder(
            padding:
            const EdgeInsets.all(16),

            itemCount:
            programs.length,

            itemBuilder:
                (context, index) {

              final program =
              programs[index];

              return Center(
                child: ConstrainedBox(
                  constraints:
                  const BoxConstraints(
                    maxWidth: 700,
                  ),

                  child: Card(
                    elevation: 4,

                    margin:
                    const EdgeInsets.only(
                      bottom: 16,
                    ),

                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18),
                    ),

                    child: Padding(
                      padding:
                      const EdgeInsets.all(18),

                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,

                        children: [

                          // =================================
                          // TITLE
                          // =================================

                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Container(
                                padding:
                                const EdgeInsets.all(12),

                                decoration:
                                BoxDecoration(
                                  gradient:
                                  const LinearGradient(
                                    colors: [
                                      Color(0xFFFF7A00),
                                      Color(0xFFFF1493),
                                    ],
                                  ),

                                  borderRadius:
                                  BorderRadius.circular(
                                    12,
                                  ),
                                ),

                                child:
                                const Icon(
                                  Icons.school,
                                  color:
                                  Colors.white,
                                  size: 28,
                                ),
                              ),

                              const SizedBox(
                                width: 14,
                              ),

                              Expanded(
                                child: Text(
                                  program.title,

                                  style:
                                  const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 16,
                          ),

                          // =================================
                          // DATE
                          // =================================

                          Row(
                            children: [

                              const Icon(
                                Icons.calendar_today,
                                size: 18,
                                color:
                                Color(0xFFFF1493),
                              ),

                              const SizedBox(
                                width: 8,
                              ),

                              Expanded(
                                child: Text(
                                  'Starts: ${program.startDate}',

                                  style:
                                  const TextStyle(
                                    fontWeight:
                                    FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 12,
                          ),

                          // =================================
                          // DESCRIPTION
                          // =================================

                          Text(
                            program.description,

                            style:
                            const TextStyle(
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),

                          const SizedBox(
                            height: 16,
                          ),

                          // =================================
                          // VIEW DETAILS
                          // =================================

                          SizedBox(
                            width:
                            double.infinity,

                            height: 48,

                            child:
                            DecoratedBox(
                              decoration:
                              BoxDecoration(
                                gradient:
                                const LinearGradient(
                                  colors: [
                                    Color(0xFFFF7A00),
                                    Color(0xFFFF1493),
                                  ],
                                ),

                                borderRadius:
                                BorderRadius
                                    .circular(
                                  12,
                                ),
                              ),

                              child:
                              ElevatedButton(
                                onPressed: () {

                                  Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                          ProgramDetailsScreen(
                                            program:
                                            program,

                                            userEmail:
                                            widget.userEmail,
                                          ),
                                    ),
                                  );
                                },

                                style:
                                ElevatedButton
                                    .styleFrom(
                                  backgroundColor:
                                  Colors.transparent,

                                  shadowColor:
                                  Colors.transparent,

                                  foregroundColor:
                                  Colors.white,

                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      12,
                                    ),
                                  ),
                                ),

                                child:
                                const Text(
                                  'VIEW DETAILS',

                                  style:
                                  TextStyle(
                                    fontWeight:
                                    FontWeight.bold,

                                    letterSpacing:
                                    0.5,
                                  ),
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
          );
        },
      ),
    );
  }
}