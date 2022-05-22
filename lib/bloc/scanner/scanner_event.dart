part of 'scanner_bloc.dart';

abstract class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object> get props => [];
}

class ScannerLoadEvent extends ScannerEvent {}

class BarcodeScanEvent extends ScannerEvent {
  final Barcode barcode;

  const BarcodeScanEvent({required this.barcode});
}
