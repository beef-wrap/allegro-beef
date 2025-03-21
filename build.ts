import { $ } from 'bun';

$.nothrow()

await $`

mkdir libs
mkdir allegro5/build
cd allegro5/build

#cmake ..
#cmake --build . --config RelWithDebInfo

mkdir ../../libs
cp lib/RelWithDebInfo/allegro-static.lib ../../libs
cp lib/RelWithDebInfo/allegro-static.pdb ../../libs
cp lib/liballegro.so ../../libs

mkdir ../../allegro_acodec/libs
cp lib/RelWithDebInfo/allegro_acodec-static.lib ../../allegro_acodec/libs
cp lib/RelWithDebInfo/allegro_acodec-static.pdb ../../allegro_acodec/libs
cp lib/liballegro_acodec.so ../../allegro_acodec/libs

mkdir ../../allegro_audio/libs
cp lib/RelWithDebInfo/allegro_audio-static.lib ../../allegro_audio/libs
cp lib/RelWithDebInfo/allegro_audio-static.pdb ../../allegro_audio/libs
cp lib/liballegro_audio.so ../../allegro_audio/libs

mkdir ../../allegro_color/libs
cp lib/RelWithDebInfo/allegro_color-static.lib ../../allegro_color/libs
cp lib/RelWithDebInfo/allegro_color-static.pdb ../../allegro_color/libs
cp lib/liballegro_color.so ../../allegro_color/libs

mkdir ../../allegro_font/libs
cp lib/RelWithDebInfo/allegro_font-static.lib ../../allegro_font/libs
cp lib/RelWithDebInfo/allegro_font-static.pdb ../../allegro_font/libs
cp lib/liballegro_font.so ../../allegro_font/libs

mkdir ../../allegro_image/libs
cp lib/RelWithDebInfo/allegro_image-static.lib ../../allegro_image/libs
cp lib/RelWithDebInfo/allegro_image-static.pdb ../../allegro_image/libs
cp lib/liballegro_image.so ../../allegro_image/libs

mkdir ../../allegro_memfile/libs
cp lib/RelWithDebInfo/allegro_memfile-static.lib ../../allegro_memfile/libs
cp lib/RelWithDebInfo/allegro_memfile-static.pdb ../../allegro_memfile/libs
cp lib/liballegro_memfile.so ../../allegro_memfile/libs

mkdir ../../allegro_native_dialog/libs
cp lib/RelWithDebInfo/allegro_dialog-static.lib ../../allegro_native_dialog/libs
cp lib/RelWithDebInfo/allegro_dialog-static.pdb ../../allegro_native_dialog/libs
# cp lib/liballegro_dialog.so ../../allegro_native_dialog/libs

mkdir ../../allegro_primitives/libs
cp lib/RelWithDebInfo/allegro_primitives-static.lib ../../allegro_primitives/libs
cp lib/RelWithDebInfo/allegro_primitives-static.pdb ../../allegro_primitives/libs
cp lib/liballegro_primitives.so ../../allegro_primitives/libs

`