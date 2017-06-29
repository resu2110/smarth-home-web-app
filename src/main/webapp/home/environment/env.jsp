<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Smarthome</title>
<meta charset="utf-8">

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Bootstrap CSS  -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

<!-- Custom CSS -->
<link href="<c:url value="/resources/css/sb-admin.css"/>"
	rel="stylesheet">

<!-- custom fonts -->
<link href="<c:url value="/resources/css/font-awesome.min.css"/>"
	type="text/css">

<!-- morris charts css -->
<link href="/resources/css/morris.css" rel="stylesheet">



<!-- POLLING -->

<script type="text/javascript">
	function doPoll() {
		$
				.post(
						'env.jsp',
						function() {
							$
									.ajax({
										url : "/home/environment/midroom/temperature/sensor.temperaturemidroom",
										success : function(data) {
											$("#midroom_temperature")
													.text(data)
										}
									});

							$
									.ajax({
										url : "/home/environment/midroom/humidity/sensor.humiditymidroom",
										success : function(data) {
											$("#midroom_humidity").text(data)
										}
									});

							$
									.ajax({
										url : "/home/environment/midroom/photon/sensor.photonmidroom",
										success : function(data) {
											$("#midroom_photon").text(data)
										}
									});
							setTimeout(doPoll, 5000);
						});
	}

	$(document).ready(function() {
		doPoll();
	});
</script>

</head>

<body>

	<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">SB Admin</a>
			</div>
			<!-- Top Menu Items -->
			<ul class="nav navbar-right top-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
						class="caret"></b></a>
					<ul class="dropdown-menu message-dropdown">
						<li class="message-preview"><a href="#">
								<div class="media">
									<span class="pull-left"> <img class="media-object"
										src="http://placehold.it/50x50" alt="">
									</span>
									<div class="media-body">
										<h5 class="media-heading">
											<strong>Minh Dinh</strong>
										</h5>
									</div>
								</div>
						</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fa fa-user"></i> John Smith
								<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="fa fa-fw fa-user"></i>
										Profile</a></li>
								<li><a href="#"><i class="fa fa-fw fa-envelope"></i>
										Inbox</a></li>
								<li><a href="#"><i class="fa fa-fw fa-gear"></i>
										Settings</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="fa fa-fw fa-power-off"></i>
										Log Out</a></li>
							</ul></li>
					</ul> <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
					<div class="collapse navbar-collapse navbar-ex1-collapse">
						<ul class="nav navbar-nav side-nav">
							<li class="active"><a href="index.html"><i
									class="fa fa-fw fa-dashboard"></i> Dashboard</a></li>
							<li><a href="charts.html"><i
									class="fa fa-fw fa-bar-chart-o"></i> Charts</a></li>
							<li><a href="tables.html"><i class="fa fa-fw fa-table"></i>
									Tables</a></li>
							<li><a href="forms.html"><i class="fa fa-fw fa-edit"></i>
									Forms</a></li>
							<li><a href="bootstrap-elements.html"><i
									class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a></li>
							<li><a href="bootstrap-grid.html"><i
									class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a></li>
							<li><a href="javascript:;" data-toggle="collapse"
								data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i>
									Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
								<ul id="demo" class="collapse">
									<li><a href="#">Dropdown Item</a></li>
									<li><a href="#">Dropdown Item</a></li>
								</ul></li>
							<li><a href="blank-page.html"><i
									class="fa fa-fw fa-file"></i> Blank Page</a></li>
							<li><a href="index-rtl.html"><i
									class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a></li>
						</ul>
					</div> <!-- /.navbar-collapse -->
		</nav>

		<div id="page-wrapper">
			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">Environment</h1>
					</div>
				</div>
				<!-- /.row -->

				<!-- Mid-room environment -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>
								<h3 align="center">Mid-room</h3></li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<div id="midroom_temperature">
												${environment_midroom_temperature.state}</div>
										</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Temperature</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<div id="midroom_humidity">${environment_midroom_humidity.state}</div>
										</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Humidity</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<div id="midroom_photon">${environment_midroom_photon.state}</div>
										</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Photon</span> <span class="pull-right"><i
										class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">2</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Men in Room</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- /.row -->

				<!-- Right corner environment -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>
								<h3 align="center">Right-corner</h3></li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">30oC</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Temperature</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">80%</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Humidity</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">
											<div id="midroom_photon">${environment_midroom.state}</div>
										</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Photon</span> <span class="pull-right"><i
										class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">2</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Men in Room</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- /.row -->

				<!-- Out-door environment -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li class="active"><i class="fa fa-dashboard"></i>
								<h3 align="center">Out-door</h3></li>
						</ol>
					</div>
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-3 col-md-6">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-comments fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">30oC</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Temperature</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-tasks fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">80%</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Humidity</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-yellow">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-shopping-cart fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">${environment_midroom.state}</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Photon</span> <span class="pull-right"><i
										class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>

					<div class="col-lg-3 col-md-6">
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="row">
									<div class="col-xs-3">
										<i class="fa fa-support fa-5x"></i>
									</div>
									<div class="col-xs-9 text-right">
										<div class="huge">2</div>
									</div>
								</div>
							</div>
							<a href="#">
								<div class="panel-footer">
									<span class="pull-left">Men in Room</span> <span
										class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
									<div class="clearfix"></div>
								</div>
							</a>
						</div>
					</div>
				</div>
				<!-- /.row -->

			</div>
		</div>

	</div>
</body>
</html>