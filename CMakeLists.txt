cmake_minimum_required(VERSION 3.27)

project(allegro)

# remove "lib" prefix on unix systems
set(CMAKE_STATIC_LIBRARY_PREFIX "")

option(SHARED "" Off)

option(WANT_DEMO "" Off)
option(WANT_EXAMPLES "" Off)
option(WANT_DOCS "" Off)

# option(WANT_AUDIO "" Off)
# option(WANT_COLOR "" Off)
# option(WANT_FONT "" Off)
# option(WANT_IMAGE "" Off)
# option(WANT_MAIN "" Off)
# option(WANT_MEMFILE "" Off)
# option(WANT_NATIVE_DIALOG "" Off)
# option(WANT_PHYSFS "" On)
# option(WANT_PRIMITIVES "" Off)
# option(WANT_TTF "" Off)
# option(WANT_VIDEO "" On)

add_subdirectory(allegro5 allegro)

if (WIN32)
    set(OUTPUT_DIR "windows" CACHE STRING "output dir")
    set_target_properties(allegro_dialog PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_native_dialog/libs/${OUTPUT_DIR}>)
elseif(APPLE)
    set(OUTPUT_DIR "macos" CACHE STRING "output dir")
elseif(UNIX)
    set(OUTPUT_DIR "linux" CACHE STRING "output dir")
endif ()

# use a generator expression for windows otherwise it automatically creates Debug/Release folders
set_target_properties(allegro PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../libs/${OUTPUT_DIR}>)
set_target_properties(allegro_acodec PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_acodec/libs/${OUTPUT_DIR}>)
set_target_properties(allegro_audio PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_audio/libs/${OUTPUT_DIR}>)
set_target_properties(allegro_color PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_color/libs/${OUTPUT_DIR}>)
set_target_properties(allegro_font PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_font/libs/${OUTPUT_DIR}>)
set_target_properties(allegro_image PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_image/libs/${OUTPUT_DIR}>)
set_target_properties(allegro_memfile PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_memfile/libs/${OUTPUT_DIR}>)
set_target_properties(allegro_primitives PROPERTIES ARCHIVE_OUTPUT_DIRECTORY $<LOWER_CASE:../../../../../allegro_primitives/libs/${OUTPUT_DIR}>)