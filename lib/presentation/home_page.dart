import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/auth/auth_bloc.dart';
import 'package:utopia_validator/bloc/home/home_bloc.dart';
import 'package:utopia_validator/bloc/scanner/scanner_bloc.dart';
import 'package:utopia_validator/presentation/auth_page.dart';
import 'package:utopia_validator/presentation/scanner_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Валідатор'),
        actions: [
          IconButton(
            tooltip: 'Вийти',
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            final profileImageUrl = state.user.photoURL ?? '';
            final profileName = state.user.displayName ?? 'Користувач';
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProfileImage(profileImageUrl),
                const SizedBox(height: 10),
                _buildProfileName(profileName),
              ],
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Scanner',
        onPressed: () => _loadScanner(context),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  void _signOut(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequestEvent());
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const AuthPage()),
      (route) => false,
    );
  }

  void _loadScanner(BuildContext context) {
    BlocProvider.of<ScannerBloc>(context).add(ScannerLoadEvent());
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ScannerPage()));
  }

  Widget _buildProfileImage(String profileImageUrl) {
    return Center(
      child: Container(
        width: 140.0,
        height: 140.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(_resizeProfileImage(profileImageUrl)),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    );
  }

  Widget _buildProfileName(String profileName) {
    return Text(
      profileName,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  String _resizeProfileImage(String profileImageUrl) {
    return profileImageUrl.contains('s96-c')
        ? profileImageUrl.replaceFirst('s96-c', 's400-c')
        : profileImageUrl;
  }
}
