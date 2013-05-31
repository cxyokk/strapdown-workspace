
path = require 'path'

module.exports = (grunt)->
  grunt.initConfig
    config: # normalize the paths so other modules won't get confused
      markdown: path.normalize './files/markdown'
      html: path.normalize './files/html'

    strapdown:
      all:
        src: ['<%= config.markdown %>/*.md']
        dest: '<%= config.html %>'
        theme: 'cyborg'
        options:
          template: 'lib/default-template.html'
          templateData:
            lr_port: '<%= livereload.port %>'

    livereload:
      port: 34567

    connect:
      htmlserver:
        options:
          hostname: '*'
          port: 9008
          base: '<%= config.html %>'
          middleware: (connect, options)->[
            connect.directory(options.base)
            # we don't need the livereload middleware cause we're putting
            # the lr-snippet directly into the html template.
            #require('grunt-contrib-livereload/lib/utils').livereloadSnippet
            connect.static(options.base)
          ]

    regarde:
      strapdown:
        files: ['<%= config.markdown %>/*.md']
        tasks: 'strapdown'
      livereload:
        files: ['<%= config.html %>/*.html']
        tasks: 'livereload'

  grunt.loadNpmTasks 'grunt-regarde'
  grunt.loadNpmTasks 'grunt-strapdown'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-livereload'

  # Tell strapdown to compile files as needed.
  # We don't have to do this for livereload, it's has it builtin.
  grunt.event.on 'regarde:strapdown:file', (status, filepath)->
    if status is 'deleted'
      return
    grunt.config 'strapdown.all.src', filepath

  grunt.registerTask 'default', [
    'strapdown'
    'livereload-start'
    'connect'
    'regarde'
  ]
