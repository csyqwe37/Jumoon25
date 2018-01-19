<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS includes 
<link href="/Jumoon25/design/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Karla"
	rel="stylesheet" type="text/css">
<link
	href="/Jumoon25/design/theme/fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/Jumoon25/design/theme/css/theme.css" rel="stylesheet">
 -->
 
</head>
<body>

	<!-- Carousel -->
	<div id="theme-carousel" class="carousel slide bg-carousel"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#theme-carousel" data-slide-to="0" class="active"></li>
			<li data-target="#theme-carousel" data-slide-to="1"></li>
			<li data-target="#theme-carousel" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active text-center">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6 text-center">
							<div class="clearfix hidden-xs" style="height: 100px;"></div>
							<h1 style="margin-top: 30px;">Lorem Ipsum</h1>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry</p>
							<p>
								<a class="btn btn-primary btn-lg">Get Started Now</a>
							</p>
							<p style="margin-bottom: 100px;"></p>
						</div>
						<div class="col-md-6 col-sm-6 hidden-xs">
							<img class="img-responsive"
								src="/Jumoon25/design/theme/images/carousel1.png"
								style="margin: auto;" />
						</div>
					</div>
				</div>
			</div>
			<div class="item text-center">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6 hidden-xs">
							<img class="img-responsive"
								src="/Jumoon25/design/theme/images/carousel2.png"
								style="margin: auto;" />
						</div>
						<div class="col-md-6 col-sm-6 text-center">
							<div class="clearfix hidden-xs" style="height: 100px;"></div>
							<h1 style="margin-top: 30px;">Lorem Ipsum</h1>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry</p>
							<p>
								<a class="btn btn-success btn-lg">Download</a>
							</p>
							<p style="margin-bottom: 100px;"></p>
						</div>
					</div>
				</div>
			</div>
			<div class="item active text-center">
				<div class="container">
					<div class="row">
						<div class="col-md-6 col-sm-6 text-center">
							<div class="clearfix hidden-xs" style="height: 100px;"></div>
							<h1 style="margin-top: 30px;">Lorem Ipsum</h1>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry</p>
							<p>
								<a class="btn btn-info btn-lg">Contact Us</a>
							</p>
							<p style="margin-bottom: 100px;"></p>
						</div>
						<div class="col-md-6 col-sm-6 hidden-xs">
							<img class="img-responsive"
								src="/Jumoon25/design/theme/images/carousel3.png"
								style="margin: auto;" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Controls -->
		<a class="left carousel-control" href="#theme-carousel" role="button"
			data-slide="prev">
			<div class="carousel-control-arrow">&#8249;</div>
		</a> <a class="right carousel-control" href="#theme-carousel"
			role="button" data-slide="next">
			<div class="carousel-control-arrow">&#8250;</div>
		</a>
	</div>

	<script src="/Jumoon25/design/theme/js/jquery.min.js"></script>
	<script src="/Jumoon25/design/bootstrap/js/bootstrap.min.js"></script>
	<script src="/Jumoon25/design/theme/js/jquery.mixitup.min.js"></script>
	<link href="/Jumoon25/design/theme/css/magnific-popup.css" rel="stylesheet">
	<script src="/Jumoon25/design/theme/js/jquery.magnific-popup.min.js"></script>
	<script src="/Jumoon25/design/theme/js/theme.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js"></script>

	<script type="text/javascript">
		jQuery(function($) {
			// Mix It Up Gallery setup
			$('.container-projects').mixItUp();

			// Google Maps setup
			var googlemap = new google.maps.Map(document
					.getElementById('googlemap'), {
				center : new google.maps.LatLng(44.5403, -78.5463),
				zoom : 8,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			});
		});
	</script>

</body>
</html>