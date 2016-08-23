'use strict';

module.exports = function (grunt) {
  require('time-grunt')(grunt);
  require('load-grunt-tasks')(grunt);

  var files;

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    develop: {
      app: {
        file: 'index.js'
      }
    },
    watch: {
      options: {
        nospawn: true
      },
      app: {
        files: ['src/**/*.coffee'],
        tasks: ['coffeelint', 'coffee'],
        options: {nospawn: true}
      }
    },
    coffeelint: {
      app: ['src/**/*.coffee'],
      options: {
        configFile: 'coffeelint.json'
      }
    },
    clean: {
      lib: {
        src: 'lib'
      }
    },
    coffee: {
      compile: {
        files: [{
          expand: true,
          cwd: 'src',
          src: '**/*.coffee',
          dest: 'lib',
          ext: '.js'
        }
        ]
      }
    },
    mochaTest: {
      options: {
        reporter: 'spec',
        bail: true,
        require: ['coffee-script/register']
      },
      spec: ['spec/unit/**/*Spec.coffee'],
      functional: ['spec/functional/**/*Spec.coffee']
    },
    mocha_istanbul: {
      coverage: {
        src: ['spec/unit/**/*.coffee', 'spec/functional/**/*.coffee'],
        options: {
          coverageFolder: 'output/coverage',
          mask: '**/*Spec.coffee',
          root: './',
          reportFormats: ['lcov', 'text', 'clover'],
          reporter: 'gr-mocha-bamboo-reporter',
          require: ['coffee-script/register'],
          istanbulOptions: ['--include-all-sources'],
          excludes: ['Gruntfile.js', 'debug.js', 'index.js', 'config.js']
        }
      }
    }
  });

  grunt.config.requires('watch.app.files');
  files = grunt.config('watch.app.files');
  files = grunt.file.expand(files);

  grunt.registerTask('spec', ['coffeelint', 'clean', 'coffee', 'mochaTest:spec']);
  grunt.registerTask('functional', ['coffeelint', 'clean', 'coffee', 'mochaTest:functional']);
  grunt.registerTask('default', ['coffeelint', 'clean', 'coffee', 'develop:app', 'watch:app']);
  grunt.registerTask('coverage', ['coffeelint', 'clean', 'coffee', 'mocha_istanbul:coverage']);
  grunt.registerTask('pack', ['coffeelint', 'clean', 'coffee', 'gr_package']);
};
