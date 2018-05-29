var gulp = require('gulp');

var minifyCSS = require('gulp-csso');
var concat = require('gulp-concat');

gulp.task('css', function(){
  return gulp.src(['source/stylesheets/vendor/*.css', 'source/stylesheets/*.css'])
    .pipe(minifyCSS())
    .pipe(concat('site.css'))
    .pipe(gulp.dest('tmp/build/stylesheets/'))
});

gulp.task('default', ['css']);
