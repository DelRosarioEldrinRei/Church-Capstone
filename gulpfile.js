const gulp 		  = require("gulp"),
 		browserSync = require("browser-sync").create(),
			sass 		  = require("gulp-sass");
			
//Compile SASS
gulp.task("sass", function(){
	return gulp.src(["public/scss/*.scss"])
		.pipe(sass())
		.pipe(gulp.dest("public/css"))
});

//Move JS Files to SRC
gulp.task("js", function(){
	return gulp.src([
		"node_modules/bootstrap/dist/js/bootstrap.min.js",
		"node_modules/jquery/dist/jquery.min.js",
		"node_modules/popper.js/dist/umd/popper.min.js",
		"node_modules/mdbootstrap/js/mdb.min.js",
		"node_modules/materialize-css/dist/js/materialize.min.js", 
		"node_modules/material-kit/js/bootstrap-material-design.min.js",
		"node_modules/material-kit/js/material-kit.min.js",
		"node_modules/material-kit/js/plugins/bootstrap-datetimepicker.min.js",
		"node_modules/ekko-lightbox/dist/ekko-lightbox.min.js", 
		"node_modules/slick-carousel/slick/slick.min.js",
		// divider ~
		"node_modules/bootstrap/dist/js/bootstrap.min.js",
		"node_modules/fullcalendar/dist/fullcalendar.min.js",
		"node_modules/moment/min/moment.min.js",
		"node_modules/jquery-ui-dist/jquery-ui.min.js", 
		"node_modules/light-bootstrap-dashboard/assets/js/plugins/bootstrap-switch.js",
		"node_modules/light-bootstrap-dashboard/assets/js/plugins/bootstrap-notify.js",
		"node_modules/light-bootstrap-dashboard/assets/js/light-bootstrap-dashboard.js",
		"node_modules/perfect-scrollbar/dist/perfect-scrollbar.js",
		"node_modules/sweetalert2/dist/sweetalert2.all.min.js"
		
	])
		.pipe(gulp.dest("public/js"))
});

//Move the Font Awesome Fonts folder to public
gulp.task("fonts", function(){
	return gulp.src("node_modules/font-awesome/fonts/*")
		.pipe(gulp.dest("public/fonts"));
});

//Move font awesome css file 
gulp.task("fa", function(){
	return gulp.src("node_modules/font-awesome/css/font-awesome.min.css")
		.pipe(gulp.dest("public/css"));
});

//Move bootstrap4 css file 
gulp.task("bs4", function(){
	return gulp.src("node_modules/bootstrap/dist/css/bootstrap.min.css")
		.pipe(gulp.dest("public/css"));
});

//Move Material-Kit css file because of incomplete material-kit scss
gulp.task("mrk", function(){
	return gulp.src("node_modules/material-kit/css/material-kit.min.css")
		.pipe(gulp.dest("public/css"));
});

//Move Ekko lightbox css
gulp.task("ekko", function(){
	return gulp.src("node_modules/ekko-lightbox/dist/ekko-lightbox.css")
		.pipe(gulp.dest("public/css"));
});

//Move Slick css
gulp.task("slck", function(){
	return gulp.src("node_modules/slick-carousel/slick/slick.css")
		.pipe(gulp.dest("public/css"));
});

//Move Nucleo Icons to Fonts folder
gulp.task("fonts", function(){
	return gulp.src("node_modules/light-bootstrap-dashboard/assets/fonts/*")
		.pipe(gulp.dest("public/fonts"));
});


gulp.task("slcktheme", function(){
	return gulp.src("node_modules/slick-carousel/slick/slick-theme.css")
		.pipe(gulp.dest("public/css"));
});

//Move fullcalendar to css folder
gulp.task("fc", function(){
	return gulp.src("node_modules/fullcalendar/dist/fullcalendar.min.css")
		.pipe(gulp.dest("public/css"));
});

//Move Light-bootstrap-dashboard css to css folder
gulp.task("lbd", function(){
	return gulp.src("node_modules/light-bootstrap-dashboard/assets/css/light-bootstrap-dashboard.css")
		.pipe(gulp.dest("public/css"));
});

// //Move full calendar(creative tim) css to css folder
// gulp.task("fcct", function(){
// 	return gulp.src("node_modules/light-bootstrap-dashboard/full_calendar/fullcalendar.css")
// 		.pipe(gulp.dest("public/css"));
// });

//Move perfect scrollbar css to css folder
gulp.task("ps", function(){
	return gulp.src("node_modules/perfect-scrollbar/css/perfect-scrollbar.css")
		.pipe(gulp.dest("public/css"));
});

gulp.task("default", ["js", "fa", "bs4", "fc", "lbd", "ps", "mrk", "ekko", "fonts", "slck", "slcktheme", "sass"]);