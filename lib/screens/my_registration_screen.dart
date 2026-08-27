import 'package:flutter/material.dart';

import '../services/registration_storage_service.dart';

class MyRegistrationsScreen extends StatefulWidget {
  const MyRegistrationsScreen({
    super.key,
    required this.userEmail,
    this.storageService =
    const RegistrationStorageService(),
  });

  final String userEmail;
  final RegistrationStorageService storageService;

  @override
  State<MyRegistrationsScreen> createState() =>
      _MyRegistrationsScreenState();
}

class _MyRegistrationsScreenState
    extends State<MyRegistrationsScreen> {
  late Future<List<Map<String, dynamic>>>
  _registrationsFuture;

  @override
  void initState() {
    super.initState();

    _loadRegistrations();
  }

  void _loadRegistrations() {
    _registrationsFuture =
        widget.storageService
            .getRegistrationsByEmail(
          widget.userEmail,
        );
  }

  Future<void> _refresh() async {
    setState(() {
      _loadRegistrations();
    });

    await _registrationsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MY REGISTRATIONS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
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

      body: FutureBuilder<
          List<Map<String, dynamic>>>(
        future: _registrationsFuture,

        builder: (
            context,
            snapshot,
            ) {
          // ==========================================
          // LOADING
          // ==========================================

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
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
                child: Column(
                  mainAxisSize:
                  MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red,
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    const Text(
                      'Unable to load your registrations.',
                      textAlign:
                      TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _loadRegistrations();
                        });
                      },
                      child:
                      const Text('RETRY'),
                    ),
                  ],
                ),
              ),
            );
          }

          final registrations =
              snapshot.data ?? [];

          // ==========================================
          // NO REGISTRATIONS
          // ==========================================

          if (registrations.isEmpty) {
            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView(
                physics:
                const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(
                    height: 160,
                  ),

                  Icon(
                    Icons.event_note,
                    size: 70,
                    color: Colors.grey,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Text(
                      'You have not registered\n'
                          'for any programs yet.',
                      textAlign:
                      TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // ==========================================
          // REGISTRATIONS
          // ==========================================

          return RefreshIndicator(
            onRefresh: _refresh,

            child: ListView.builder(
              padding:
              const EdgeInsets.all(20),

              itemCount:
              registrations.length,

              itemBuilder:
                  (context, index) {
                final registration =
                registrations[index];

                return _RegistrationCard(
                  registration:
                  registration,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _RegistrationCard
    extends StatelessWidget {
  const _RegistrationCard({
    required this.registration,
  });

  final Map<String, dynamic>
  registration;

  @override
  Widget build(BuildContext context) {
    final programTitle =
        registration['programTitle']
            ?.toString() ??
            'Unknown Program';

    final name =
        registration['fullName']
            ?.toString() ??
            '';

    final email =
        registration['email']
            ?.toString() ??
            '';

    final phone =
        registration['phone']
            ?.toString() ??
            '';

    final submittedAt =
        registration['submittedAt']
            ?.toString() ??
            '';

    String formattedDate =
        submittedAt;

    try {
      final date =
      DateTime.parse(
        submittedAt,
      ).toLocal();

      formattedDate =
      '${date.day}/${date.month}/${date.year} '
          '${date.hour.toString().padLeft(2, '0')}:'
          '${date.minute.toString().padLeft(2, '0')}';
    } catch (_) {}

    return Card(
      margin:
      const EdgeInsets.only(
        bottom: 16,
      ),

      elevation: 3,

      child: Padding(
        padding:
        const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            // PROGRAM TITLE

            Text(
              programTitle,

              style: const TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            const Divider(),

            const SizedBox(
              height: 12,
            ),

            _InfoRow(
              icon: Icons.person,
              label: 'Name',
              value: name,
            ),

            const SizedBox(
              height: 10,
            ),

            _InfoRow(
              icon: Icons.email,
              label: 'Email',
              value: email,
            ),

            const SizedBox(
              height: 10,
            ),

            _InfoRow(
              icon: Icons.phone,
              label: 'Phone',
              value: phone,
            ),

            const SizedBox(
              height: 10,
            ),

            _InfoRow(
              icon: Icons.access_time,
              label: 'Submitted',
              value: formattedDate,
            ),

            const SizedBox(
              height: 16,
            ),

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),

              decoration:
              BoxDecoration(
                color: Colors.green
                    .withValues(
                  alpha: 0.1,
                ),

                borderRadius:
                BorderRadius.circular(
                  20,
                ),
              ),

              child: const Row(
                mainAxisSize:
                MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 18,
                    color: Colors.green,
                  ),

                  SizedBox(
                    width: 6,
                  ),

                  Text(
                    'Registered',
                    style: TextStyle(
                      color:
                      Colors.green,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(
            0xFFFF1493,
          ),
        ),

        const SizedBox(
          width: 10,
        ),

        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle
                  .of(context)
                  .style,

              children: [
                TextSpan(
                  text: '$label: ',
                  style:
                  const TextStyle(
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                TextSpan(
                  text: value,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}