import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:utopia_validator/repository/scanner_repository.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final ScannerRepository _scannerRepository;

  ScannerBloc(this._scannerRepository) : super(ScannerInitial()) {
    on<ScannerLoadEvent>(_loadBloc);
    on<BarcodeScanEvent>(_handleBarcode);
  }

  FutureOr<void> _loadBloc(ScannerLoadEvent event, Emitter<ScannerState> emit) {
    emit(ScannerLoaded());
  }

  FutureOr<void> _handleBarcode(
      BarcodeScanEvent event, Emitter<ScannerState> emit) {
    final barcodeValue = event.barcode.rawValue;
    if (barcodeValue != null) {
      emit(ScannerBarcodeScanned(barcodeValue: barcodeValue));
    }
  }
}
