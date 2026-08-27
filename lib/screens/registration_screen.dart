import 'package:flutter/material.dart';

import '../models/program.dart';
import '../services/registration_storage_service.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    super.key,
    required this.program,
    required this.userEmail,
    this.storageService = const RegistrationStorageService(),
  });

  final Program program;
  final String userEmail;
  final RegistrationStorageService storageService;

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  bool _acceptedTerms = false;
  bool _saving = false;

  @override
  void initState() {
    super.initState();

    // Automatically use the email of the logged-in user.
    _emailController.text = widget.userEmail;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // ==============================
  // REQUIRED FIELD VALIDATION
  // ==============================

  String? _required(String? value, String label) {
    if (value == null || value.trim().isEmpty) {
      return '$label is required.';
    }

    return null;
  }

  // ==============================
  // EMAIL VALIDATION
  // ==============================

  String? _validateEmail(String? value) {
    final requiredMessage = _required(value, 'Email');

    if (requiredMessage != null) {
      return requiredMessage;
    }

    final email = RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    );

    if (!email.hasMatch(value!.trim())) {
      return 'Enter a valid email address.';
    }

    return null;
  }

  // ==============================
  // PHONE VALIDATION
  // ==============================

  String? _validatePhone(String? value) {
    final requiredMessage =
    _required(value, 'Phone number');

    if (requiredMessage != null) {
      return requiredMessage;
    }

    if (!RegExp(
      r'^[0-9+() -]{7,20}$',
    ).hasMatch(value!.trim())) {
      return 'Enter a valid phone number.';
    }

    return null;
  }

  // ==============================
  // SUBMIT REGISTRATION
  // ==============================

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    final valid =
        _formKey.currentState?.validate() ?? false;

    if (!valid || !_acceptedTerms) {
      if (!_acceptedTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please accept the registration terms.',
            ),
          ),
        );
      }

      return;
    }

    setState(() {
      _saving = true;
    });

    try {
      await widget.storageService.saveRegistration(
        programId: widget.program.title,
        programTitle: widget.program.title,
        fullName: _nameController.text,
        email: widget.userEmail,
        phone: _phoneController.text,
      );

      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Registration Submitted',
            ),
            content: Text(
              'Your registration for '
                  '${widget.program.title} '
                  'has been saved successfully.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('DONE'),
              ),
            ],
          );
        },
      );

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Registration could not be saved: $error',
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _saving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROGRAM REGISTRATION',
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),

            child: Form(
              key: _formKey,

              autovalidateMode:
              AutovalidateMode.onUserInteraction,

              child: Card(
                elevation: 5,

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // ==========================
                      // PROGRAM INFORMATION
                      // ==========================

                      const Text(
                        'Register for',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        widget.program.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 17,
                            color: Color(0xFFFF1493),
                          ),

                          const SizedBox(width: 6),

                          Text(
                            widget.program.startDate,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // ==========================
                      // FULL NAME
                      // ==========================

                      TextFormField(
                        controller: _nameController,

                        textInputAction:
                        TextInputAction.next,

                        decoration:
                        const InputDecoration(
                          labelText: 'Full name',
                          prefixIcon:
                          Icon(Icons.person),
                          border:
                          OutlineInputBorder(),
                        ),

                        validator: (value) =>
                            _required(
                              value,
                              'Full name',
                            ),
                      ),

                      const SizedBox(height: 16),

                      // ==========================
                      // EMAIL
                      // ==========================

                      TextFormField(
                        controller: _emailController,

                        keyboardType:
                        TextInputType.emailAddress,

                        decoration:
                        const InputDecoration(
                          labelText: 'Email',
                          prefixIcon:
                          Icon(Icons.email),
                          border:
                          OutlineInputBorder(),
                        ),

                        // User cannot change the
                        // logged-in account email.
                        readOnly: true,

                        validator: _validateEmail,
                      ),

                      const SizedBox(height: 16),

                      // ==========================
                      // PHONE
                      // ==========================

                      TextFormField(
                        controller: _phoneController,

                        keyboardType:
                        TextInputType.phone,

                        textInputAction:
                        TextInputAction.done,

                        decoration:
                        const InputDecoration(
                          labelText: 'Phone number',
                          prefixIcon:
                          Icon(Icons.phone),
                          border:
                          OutlineInputBorder(),
                        ),

                        validator: _validatePhone,
                      ),

                      const SizedBox(height: 12),

                      // ==========================
                      // TERMS
                      // ==========================

                      CheckboxListTile(
                        contentPadding:
                        EdgeInsets.zero,

                        value: _acceptedTerms,

                        onChanged: _saving
                            ? null
                            : (value) {
                          setState(() {
                            _acceptedTerms =
                                value ?? false;
                          });
                        },

                        title: const Text(
                          'I confirm that the information provided is correct.',
                        ),

                        controlAffinity:
                        ListTileControlAffinity
                            .leading,
                      ),

                      const SizedBox(height: 16),

                      // ==========================
                      // SUBMIT BUTTON
                      // ==========================

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

                          child:
                          ElevatedButton.icon(
                            onPressed:
                            _saving
                                ? null
                                : _submit,

                            style:
                            ElevatedButton.styleFrom(
                              backgroundColor:
                              Colors.transparent,

                              disabledBackgroundColor:
                              Colors.transparent,

                              shadowColor:
                              Colors.transparent,

                              foregroundColor:
                              Colors.white,
                            ),

                            icon: _saving
                                ? const SizedBox(
                              width: 20,
                              height: 20,
                              child:
                              CircularProgressIndicator(
                                color:
                                Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                                : const Icon(
                              Icons.save,
                            ),

                            label: Text(
                              _saving
                                  ? 'SAVING...'
                                  : 'SUBMIT REGISTRATION',

                              style:
                              const TextStyle(
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        'Your registration details will be stored locally in JSON format.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}