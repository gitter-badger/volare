module.exports = function(grunt) {
    var fs = require('fs');
    var _ = require('underscore');

    var bowerTargetDir = 'static/lib';
    var requirejsTargetDir = 'static_build';

    var mainJavascriptFiles = fs.readdirSync('static/js');
    var mainModules = _.map(_.filter(mainJavascriptFiles, function(file) {
        return file !== 'config.js';
    }), function(file) {
        var name = file.replace(/\..*$/, '');
        return {
            'name': 'js/' + name
        }
    });

    grunt.initConfig({
        bower: {
            install: {
                options: {
                    targetDir: bowerTargetDir,
                    layout: 'byType',
                    install: true,
                    verbose: false,
                    cleanTargetDir: true,
                    cleanBowerDir: false
                }
            }
        },

        requirejs: {
            build: {
                options: {
                    baseUrl: 'static',
                    mainConfigFile: 'static/js/config.js',
                    dir: requirejsTargetDir,
                    findNestedDependencies: true,
                    removeCombined: true,
                    optimizeCss: 'standard',
                    preserveLicenseComments: false,
                    fileExclusionRegExp: /\.git/,
                    wrapShim: true,
                    paths: {
                        'angular': 'empty:',
                        'bootstrap': 'empty:',
                        'jquery': 'empty:',
                        'jquery-ui': 'empty:'
                    },
                    modules: mainModules
                }
            }
        },

        clean: {
            bower: ['bower_components', bowerTargetDir],
            requirejs: [requirejsTargetDir]
        }
    });

    grunt.loadNpmTasks('grunt-bower-task');
    grunt.loadNpmTasks('grunt-contrib-requirejs');
    grunt.loadNpmTasks('grunt-contrib-clean');
};
