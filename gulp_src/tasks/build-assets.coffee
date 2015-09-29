# require build config
config = require '../variables'

gulp    = require 'gulp'
copy    = require 'gulp-copy'
gulpif  = require 'gulp-if'
file    = require 'gulp-file'


#load common modules
permissionsConfig = require '../../common/permissionsConfig'

assets = config.build.app_files.assets
assets = assets.concat config.build.vendor_files.assets

gulp.task 'copy-assets', ->
  gulp.src(assets)
  .pipe(gulp.dest(config.buildDir + '/assets'))

gulp.task 'copy-fonts', ->
  gulp.src('frontend/sass/' + config.build.project_theme_name + '/css/fonts/**')
  .pipe(gulp.dest(config.buildDir + '/assets/fonts'))

gulp.task 'copy-files', ->
  gulp.src('frontend/sass/' + config.build.project_theme_name + '/files/**')
  .pipe(gulp.dest(config.buildDir + '/assets/files/'))

gulp.task 'copy-images', ->
  gulp.src('frontend/sass/' + config.build.project_theme_name + '/img/**')
  .pipe(gulp.dest(config.buildDir + '/assets/img/'))

gulp.task 'vendor-js', ->
  gulp.src(config.build.vendor_files.js)
  .pipe(gulpif(!config.arguments.production, copy(config.buildDir)))

gulp.task 'permissions-config', ->

  string = "common.permissionConfig = #{JSON.stringify permissionsConfig};"

  return file('frontend/vendors_offline/permissionConfig.js', string, {src: true}).pipe(gulp.dest('./'))


gulp.task 'build-assets', [
  'permissions-config'
  'copy-assets'
  'copy-fonts'
  'copy-files'
  'copy-images'
  'vendor-js'
]
