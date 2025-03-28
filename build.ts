import { type Build } from 'xbuild';

const build: Build = {
    common: {
        project: 'allegro',
        archs: ['x86_64'],
        variables: [],
        copy: {},
        defines: [],
        options: [
            ["SHARED", false],
            ["WANT_DEMO", false],
            ["WANT_EXAMPLES", false],
            ["WANT_DOCS", false],
        ],
        subdirectories: ['allegro5'],
        libraries: {
            allegro: { outDir: '../libs'},
            allegro_acodec: { outDir: '../../../allegro_acodec/libs'},
            allegro_audio: { outDir: '../../../allegro_audio/libs'},
            allegro_color: { outDir: '../../../allegro_color/libs'},
            allegro_font: { outDir: '../../../allegro_font/libs'},
            allegro_image: { outDir: '../../../allegro_image/libs'},
            allegro_memfile: { outDir: '../../../allegro_memfile/libs'},
            allegro_primitives: { outDir: '../../../allegro_primitives/libs'},
        },
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: [],
    },
    platforms: {
        win32: {
            windows: {
                archs: ['x64'],
                libraries: {
                    allegro_dialog: { outDir: '../../../allegro_native_dialog/libs'},
                }
            }
        },
        linux: {
            linux: {},
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;