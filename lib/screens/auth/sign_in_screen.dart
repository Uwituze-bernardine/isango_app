import 'package:flutter/material.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // TODO: Replace with actual auth hook (e.g., Firebase sign-in)
    await Future.delayed(const Duration(seconds: 2)); // Simulate auth request

    // Simulate success or failure
    final success = _emailController.text == 'test@example.com' && _passwordController.text == 'password';
    if (!success) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Invalid email or password';
      });
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in successful')),
      );
    }

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.mistBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Isango wordmark or header
                Center(
                  child: Text(
                    'Isango',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: AppColors.logisticsNavy,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Short access explanation
                Text(
                  'Access campus events feed',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Email field
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: _validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                // Password field
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
                // Error state
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: TextStyle(color: AppColors.safetyOrange),
                  ),
                const SizedBox(height: 16),
                // Primary Sign In action
                ElevatedButton(
                  onPressed: _isLoading ? null : _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.commandBlue,
                    foregroundColor: Colors.white,
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Sign In'),
                ),
                const SizedBox(height: 16),
                // Secondary link to Sign Up
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.signUp),
                  child: Text(
                    'Don\'t have an account? Sign Up',
                    style: TextStyle(color: AppColors.commandBlue),
                  ),
                ),
                // Secondary password-reset link
                TextButton(
                  onPressed: () {
                    // Placeholder: Navigate to password reset flow
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Password reset not implemented yet')),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: AppColors.commandBlue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}