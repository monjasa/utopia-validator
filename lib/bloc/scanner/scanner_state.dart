part of 'scanner_bloc.dart';

abstract class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

class ScannerInitial extends ScannerState {}

class ScannerLoaded extends ScannerState {}

class ScannerBarcodeScanned extends ScannerState {
  final String barcodeValue;

  const ScannerBarcodeScanned({required this.barcodeValue});
}
