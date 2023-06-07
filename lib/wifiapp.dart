import "wifiapp_bindings_generated.dart";

import 'dart:ffi' as ffi;
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

late final WifiappBindings bindings;

void init() {
	bindings = WifiappBindings(ffi.DynamicLibrary.open('libwifiapp.so'));
}

String test() {
  return (bindings.test()).cast<Utf8>().toDartString();
}

class Camlib {
  Camlib() {
    
  }
}
