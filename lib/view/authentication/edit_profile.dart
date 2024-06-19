import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _businessController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _businessController.dispose();
    super.dispose();
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      if (authProvider.user != null) {
        _firstNameController.text = authProvider.user!.user!.firstName!;
        _lastNameController.text = authProvider.user!.user!.lastName!;
        _emailController.text = authProvider.user!.user!.email!;
        _phoneController.text = authProvider.user!.user!.phoneNumber!;
        _businessController.text = authProvider.user!.user!.businessName!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back),
        title: const Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(authProvider.user!.user!.url!),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Implement your image edit feature here
                      },
                    ),
                  ),
                ],
              ),
              _buildTextField(_firstNameController, 'First Name'),
              _buildTextField(_lastNameController, 'Last Name'),
              _buildTextField(_emailController, 'Email Address'),
              _buildTextField(_phoneController, 'Phone Number'),
              _buildTextField(_businessController, 'Business Name'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your save functionality here
                  print('Save button pressed');
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
