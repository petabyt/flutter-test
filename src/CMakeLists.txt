# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(backend_library VERSION 0.0.1 LANGUAGES C)

include_directories(camlib/src/)

add_library(backend SHARED
  "wifiapp.c"
  "camlib/src/ip.c"
  "camlib/src/backend.c"
  "camlib/src/packet.c"
  "camlib/src/operations.c"
  "camlib/src/fuji.c"
  "camlib/src/enums.c"
  "camlib/src/enum_dump.c"
  "camlib/src/data.c"
  "camlib/src/bind.c"
  "camlib/src/canon.c"
  "camlib/src/util.c"
  "camlib/src/liveview.c"
  "camlib/src/no_usb.c"
)

set_target_properties(backend PROPERTIES
  PUBLIC_HEADER wifiapp.h
  OUTPUT_NAME "app_backend"
)

target_compile_definitions(backend PUBLIC DART_SHARED_LIB)
