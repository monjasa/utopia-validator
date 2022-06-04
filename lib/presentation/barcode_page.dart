import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/scanner/scanner_bloc.dart';
import 'package:utopia_validator/presentation/scanner_page.dart';

class BarcodePage extends StatelessWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цифровий квиток'),
      ),
      body: BlocBuilder<ScannerBloc, ScannerState>(
        builder: (context, state) {
          if (state is ScannerBarcodeScanned) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ідентифікатор цифрового квитка',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 20),
                  Text(state.barcodeValue),
                  const SizedBox(height: 40),
                  _buildValidationButton(context)
                ],
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Сканер',
        onPressed: () => _loadScanner(context),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  void _loadScanner(BuildContext context) {
    BlocProvider.of<ScannerBloc>(context).add(ScannerLoadEvent());
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScannerPage(),
      ),
    );
  }

  Widget _buildValidationButton(BuildContext context) {
    return ElevatedButton(
      child: const Text('Валідувати квиток'),
      onPressed: () => {},
    );
  }
}
