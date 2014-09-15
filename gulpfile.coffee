###
	stylus-boilerplate

	gulpfile.coffee

	@author Sean

	@note Created on 2014-08-23 by PhpStorm
	@note uses Codoc
	@see https://github.com/coffeedoc/codo
###

"use strict"

gulp = require("gulp")

# load plugins
$ = require("gulp-load-plugins")()

gulp.task "styles", ->
	gulp.src("app/styles/stylus-boilerplate.css").pipe(gulp.dest(".tmp/styles")).pipe $.size()

gulp.task "scripts", ->
	gulp.src("app/scripts/**/*.js").pipe($.jshint()).pipe($.jshint.reporter(require("jshint-stylish"))).pipe $.size()

gulp.task "html", [
	"styles"
	"scripts"
], ->
	jsFilter = $.filter("**/*.js")
	cssFilter = $.filter("**/*.css")
	gulp.src("app/*.html").pipe($.useref.assets(searchPath: "{.tmp,app}")).pipe(jsFilter).pipe($.uglify()).pipe(jsFilter.restore()).pipe(cssFilter).pipe($.csso()).pipe(cssFilter.restore()).pipe($.useref.restore()).pipe($.useref()).pipe(gulp.dest("dist")).pipe $.size()

gulp.task "images", ->
	gulp.src("app/assets/images/**/*").pipe($.cache($.imagemin(
		optimizationLevel: 3
		progressive: true
		interlaced: true
	))).pipe(gulp.dest("dist/assets/images")).pipe $.size()

gulp.task "fonts", ->
	gulp.src("app/assets/fonts").pipe($.filter("**/*.{eot,svg,ttf,woff}")).pipe($.flatten()).pipe(gulp.dest("dist/assets/fonts")).pipe $.size()

gulp.task "extras", ->
	gulp.src([
			"app/*.*"
			"!app/*.html"
		],
		dot: true
	).pipe gulp.dest("dist")

gulp.task "clean", ->
	gulp.src([
			".tmp"
			"dist"
		],
		read: false
	).pipe $.clean()

gulp.task "build", [
	"html"
	# TODO: fix this "images"
	"fonts"
	"extras"
]

gulp.task "default", ["clean"], ->
	gulp.start "build"

gulp.task "connect", ->
	connect = require("connect")
	app = connect().use(require("connect-livereload")(port: 35729)).use(connect.static("app")).use(connect.static(".tmp")).use(connect.directory("app"))
	require("http").createServer(app).listen(9000).on "listening", ->
		console.log "Started connect web server on http://localhost:9000"

gulp.task "serve", ["connect"], ->
	require("opn") "http://localhost:9000"


# inject bower components
gulp.task "wiredep", ->
	wiredep = require("wiredep").stream
	gulp.src("app/*.html").pipe(wiredep(directory: "app/bower_components")).pipe gulp.dest("app")

gulp.task "watch", [
	"connect"
	"serve"
], ->
	server = $.livereload()

	# watch for changes
	gulp.watch([
		"app/*.html"
		".tmp/styles/**/*.css"
		"app/scripts/**/*.js"
		"app/assets/images/**/*"
	]).on "change", (file) ->
		server.changed file.path

	gulp.watch "app/styles/**/*.css", ["styles"]
	gulp.watch "app/scripts/**/*.js", ["scripts"]
	gulp.watch "app/assets/images/**/*", ["images"]
	gulp.watch "bower.json", ["wiredep"]
