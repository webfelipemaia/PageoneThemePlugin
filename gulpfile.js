var gulp = require('gulp');
var sass = require('gulp-sass')(require('sass'));
var concat = require('gulp-concat');
var minifyCSS = require('gulp-csso');
var sourcemaps = require('gulp-sourcemaps');
var minify = require('gulp-minify');
const { series } = require('gulp');
var clean = require('gulp-clean');
var tar = require('gulp-tar');
var gzip = require('gulp-gzip');

var themeName = 'pageone';
var packageDist = 'dist';
var separator = '/';
var filesToMove = [
	'./assets/**/*.*',
	'./assets/scss/**/*.*',
	'./locale/**/*.*',
	'./templates/**/**/*.*',
	'./gulpfile.js',
	'./index.php',
	'./LICENSE',
	'./package.json',
	'./PageoneThemePlugin.inc.php',
	'./README.md',
	'./version.xml'
];


gulp.task('sass', function() {
	return gulp
		.src(['assets/scss/vendor/bootstrap/scss/bootstrap.scss',])
		.pipe(sass())
		.pipe(concat('app.min.css'))
		.pipe(minifyCSS())
		.pipe(gulp.dest('assets/css'));
});


gulp.task('themeSass', function() {
	return gulp
		.src(['assets/scss/pageone.scss'])
		.pipe(sass())
		.pipe(concat('pageone.min.css'))
		.pipe(minifyCSS())
		.pipe(gulp.dest('assets/css'));
});

gulp.task('scripts', function() {
	return gulp
		.src([
			'assets/scss/vendor/bootstrap/dist/js/bootstrap.js',
			'assets/js/main.js'
		])
		.pipe(sourcemaps.init())
		.pipe(concat('app.js'))
		.pipe(sourcemaps.write())
		.pipe(gulp.dest('assets/js'));
});

gulp.task('compress', function() {
	return gulp
		.src('assets/js/app.js')
		.pipe(
			minify({
				ext: {
					src: '-debug.js',
					min: '.min.js'
				}
			})
		)
		.pipe(gulp.dest('assets/js'));
});

gulp.task('compileAll', gulp.series('sass','themeSass', 'scripts', 'compress'));

gulp.task('watch', function() {
	return gulp.watch('assets/js/**/*.js', gulp.series('scripts', 'compress'));
});

gulp.task('cleandist', function() {
	return gulp.src('dist/', {read: false})
			.pipe(clean());
});

gulp.task('createdist', function() {
	return gulp.src(filesToMove, { base: './' })
				.pipe(gulp.dest(packageDist+separator+themeName+separator));
});

gulp.task('compressFolder', function(){
	return gulp.src(packageDist)
        .pipe(tar(themeName+'.tar'))
        .pipe(gzip())
        .pipe(gulp.dest(packageDist))
});

gulp.task('publish', function(done) {
	series('cleandist','createdist', function(){
		console.log('Theme pack has been published.');
	});
	done();
});

