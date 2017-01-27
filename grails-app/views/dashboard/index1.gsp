<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="index" />
		<title>${warehouse.message(code: 'default.dashboard.label', default: 'Dashboard')}</title>
	</head>

	<body>
		
		<div class="main-container container-fluid">
			<a class="menu-toggler" id="menu-toggler" href="#">
				<span class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-small btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-small btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-small btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.html">
							<i class="icon-dashboard"></i>
							<span class="menu-text">Forecasts</span>
						</a>
					</li>

					<li>
						<a href="/cimbidiaSCM/orders/list">
							<i class="icon-text-width"></i>
							<span class="menu-text"> Orders </span>
						</a>
					</li>
					<li>
						<a href="/cimbidiaSCM/shipment/list">
							<i class="icon-text-width"></i>
							<span class="menu-text"> Shipments </span>
						</a>
					</li>
					<li>
						<a href="/firefly/booking/list">
							<i class="icon-text-width"></i>
							<span class="menu-text"> Bookings </span>
						</a>
					</li>
					<li>
						<a href="/firefly/carrier/list">
							<i class="icon-text-width"></i>
							<span class="menu-text"> Carrier </span>
						</a>
					</li>
					<li>
						<a href="/firefly/shipment/shipmentbuilder">
							<i class="icon-list-alt"></i>
							<span class="menu-text"> Shipment Builder </span>
						</a>
					</li>

					<li>
						<a href="calendar.html">
							<i class="icon-calendar"></i>

							<span class="menu-text">
								Appointments Calendar
								<span class="badge badge-transparent tooltip-error" title="2&nbsp;Important&nbsp;Events">
									<i class="icon-warning-sign red bigger-130"></i>
								</span>
							</span>
						</a>
					</li>

				</ul><!--/.nav-list-->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div class="main-content">

				<div class="row-fluid">  <!-- row-fluid page-content -->
					
					<div class="span9">
						<div class="page-content">

							<div class="page-header position-relative">
								<h1>
									Dashboard
									<!--small>
										<i class="icon-double-angle-right"></i>
										overview &amp; stats
									</small-->
								</h1>
							</div><!--/.page-header-->
	<!--PAGE CONTENT BEGINS-->

							<div class="space-6"></div>

							<div class="row-fluid">
								<div class="span12 infobox-container">
									
									<div class="infobox">
										<div class="infobox-data">
											<span class="infobox-data-number"><a href="http://localhost:8080/firefly/orders/list">10</a></span>
											<div class="infobox-green">PO's to be sent</div>
										</div>
										<div class="stat1">
											<a class="badge badge-important" href="http://localhost:8080/firefly/orders/list">3</a>
										</div>
										<!--div class="stat stat-success">8%</div-->
									</div>
									

									<div class="infobox infobox-blue  ">
										<!--div class="infobox-icon">
											<i class="icon-twitter"></i>
										</div-->

										<div class="infobox-data">
											<span class="infobox-data-number"><a href="#">11</a></span>
											<div class="infobox-green">PO's awaiting confirmation</div>
										</div>
										<div class="stat1">
											<a class="badge badge-important" href="http://localhost:8080/firefly/orders/list">3</a>
										</div>
										<!--div class="badge badge-success">
											+32%
											<i class="icon-arrow-up"></i>
										</div-->
									</div>

									<div class="infobox infobox-pink  ">
										<!--div class="infobox-icon">
											<i class="icon-shopping-cart"></i>
										</div-->

										<div class="infobox-data">
											<span class="infobox-data-number"><a href="#">8</a></span>
											<div class="infobox-green">Countered PO's</div>
										</div>
										<div class="stat1">
											<a class="badge badge-important" href="http://localhost:8080/firefly/orders/list">3</a>
										</div>

										<!--div class="stat stat-important">-4%</div-->
									</div>

									<div class="infobox infobox-red  ">
										<!--div class="infobox-icon">
											<i class="icon-beaker"></i>
										</div-->

										<div class="infobox-data">
											<span class="infobox-data-number"><a href="#">7</a></span>
											<div class="infobox-green">Rejected PO's</div>
										</div>
										<div class="stat1">
											<a class="badge badge-important" href="http://localhost:8080/firefly/orders/list">3</a>
										</div>

										</div>

									<div class="infobox infobox-orange2  ">
										<!--div class="infobox-chart">
											<span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"></span>
										</div-->

										<div class="infobox-data">
											<span class="infobox-data-number"><a href="#">6</a></span>
											<div class="infobox-green">New Messages</div>
										</div>

										<!--div class="badge badge-success">
											7.2%
											<i class="icon-arrow-up"></i>
										</div-->
									</div>
									<div class="infobox infobox-pink  ">
										<!--div class="infobox-icon">
											<i class="icon-shopping-cart"></i>
										</div-->

										<div class="infobox-data">
											<span class="infobox-data-number"><a href="#">8</a></span>
											<div class="infobox-green">Overdue PO's</div>
										</div>
										

										<!--div class="stat stat-important">-4%</div-->
									</div>


								</div>
								<!--div class="span2">
								</div-->
								<div class="vspace"></div>

							</div><!--/row-->

							<!--div class="hr hr32 hr-dotted"></div-->
							<div class="hr hr32 hr-dotted"></div>
							<div class="row-fluid">
								<div class="span1">
								</div>
								<div class="span10">
								
									<div class="widget-box">
										<div class="widget-header">
											<h4 class="lighter smaller">
												<i class="icon-comment blue"></i>
												Messages
											</h4>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<div class="dialogs">
													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Alexa's Avatar" src="assets/avatars/avatar1.png" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i>
																<span class="green">2 hrs</span>
															</div>

															<div class="name">
																<a href="#">Alexa</a>
																<a href="#"><span class="label label-info arrowed arrowed-in-right">Purchase Order PO435</span></a>
															</div>
															<div class="text">Part number A65790 is no longer being manufactured. Instead part A65789 will be shipped</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info">
																	<i class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="John's Avatar" src="assets/avatars/avatar.png" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i>
																<span class="blue">1 day</span>
															</div>

															<div class="name">
																<a href="#">John</a>
															</div>
															<div class="text">We need to move the critical Best Buy order to Argentina.</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info">
																	<i class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Bob's Avatar" src="assets/avatars/user.jpg" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i>
																<span class="orange">2 days</span>
															</div>

															<div class="name">
																<a href="#">Bob</a>
																<a href="#"><span class="label label-info arrowed arrowed-in-right">Shipment SA435</span></a>
															</div>
															<div class="text">Booking B12345 needs 5 more containers Added to it, can you accommodate?
															</div>
															<div class="tools">
																<a href="#" class="btn btn-minier btn-info">
																	<i class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													
												</div>

												<!--form >
													<div class="form-actions input-append">
														<input placeholder="Type your message here ..." type="text" class="width-75" name="message" />
														<button class="btn btn-small btn-info no-radius" onclick="return false;">
															<i class="icon-share-alt"></i>
															<span class="hidden-phone">Send</span>
														</button>
													</div>
												</form-->
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/widget-box-->
								</div><!--/span-->
								<div class="span1">
								</div>
							</div><!--/row-->
							<div class="hr hr32 hr-dotted"></div>
							<div class="row-fluid">
								<div class="span2">
								</div>
								<div class="span8">
									<div class="widget-box">
										<div class="widget-header widget-header-flat widget-header-small">
											<h5>
												<i class="icon-signal"></i>
												Reason For Return
											</h5>

											<div class="widget-toolbar no-border">
												<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
													This Week
													<i class="icon-angle-down icon-on-right"></i>
												</button>

												<ul class="dropdown-menu dropdown-info pull-right dropdown-caret">
													<li class="active">
														<a href="#">This Week</a>
													</li>

													<li>
														<a href="#">Last Week</a>
													</li>

													<li>
														<a href="#">This Month</a>
													</li>

													<li>
														<a href="#">Last Month</a>
													</li>
												</ul>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main">
												<div id="piechart-placeholder"></div>

												<div class="hr hr8 hr-double"></div>

												<div class="clearfix">
													<div class="grid3">
														<span class="grey">
															<i class="icon-facebook-sign icon-2x blue"></i>
															&nbsp; likes
														</span>
														<h4 class="bigger pull-right">1,255</h4>
													</div>

													<div class="grid3">
														<span class="grey">
															<i class="icon-twitter-sign icon-2x purple"></i>
															&nbsp; tweets
														</span>
														<h4 class="bigger pull-right">941</h4>
													</div>

													<div class="grid3">
														<span class="grey">
															<i class="icon-pinterest-sign icon-2x red"></i>
															&nbsp; pins
														</span>
														<h4 class="bigger pull-right">1,050</h4>
													</div>
												</div>
											</div><!--/widget-main-->
										</div><!--/widget-body-->
									</div><!--/widget-box-->
								</div><!--/span-->
								<div class="span2">
								</div>
							</div>
							<!--PAGE CONTENT ENDS-->

						</div><!--/.page-content-->

					</div> <!-- span9 page-content -->
					<div class="span3" style="background: #f2f2f2; height: 100%; position: absolute; right: 0;">
						<div style="text-align:center;color:#0b6cbc;font-weight:bold;font-size:16px;padding:5px;">Forum Messages
						</div>

						<div class="itemdiv dialogdiv">
								<div class="user">
									<img alt="Alexa's Avatar" src="assets/avatars/ac.png" />
								</div>

								<div class="body">
									<div class="time">
										<i class="icon-time"></i>
										<span class="green">1 hr ago</span>
									</div>

									<div class="name">
										<a href="#">Japan Logistics</a>
									</div>
									<div class="text">Fire in Tokyo Facility Nippei
									</div>

									<div class="tools">
										<a href="#" class="btn btn-minier btn-info">
											<i class="icon-only icon-share-alt"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="itemdiv dialogdiv">
								<div class="user">
									<img alt="Alexa's Avatar" src="assets/avatars/ac.png" />
								</div>

								<div class="body">
									<div class="time">
										<i class="icon-time"></i>
										<span class="green">2 hrs ago</span>
									</div>

									<div class="name">
										<a href="#">Supplier Co.</a>
									</div>
									<div class="text">Shipments are experiencing delays due to re-routing from port closure
									</div>

									<div class="tools">
										<a href="#" class="btn btn-minier btn-info">
											<i class="icon-only icon-share-alt"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="itemdiv dialogdiv">
								<div class="user">
									<img alt="Alexa's Avatar" src="assets/avatars/ac.png" />
								</div>

								<div class="body">
									<div class="time">
										<i class="icon-time"></i>
										<span class="green">4 hrs</span>
									</div>

									<div class="name">
										<a href="#">CPG Log Mgr</a>
									</div>
									<div class="text">How long is the expected delay?
									</div>

									<div class="tools">
										<a href="#" class="btn btn-minier btn-info">
											<i class="icon-only icon-share-alt"></i>
										</a>
									</div>
								</div>
							</div>
							<div class="itemdiv dialogdiv">
								<div class="user">
									<img alt="Alexa's Avatar" src="assets/avatars/ac.png" />
								</div>

								<div class="body">
									<div class="time">
										<i class="icon-time"></i>
										<span class="green">5 hrs</span>
									</div>

									<div class="name">
										<a href="#">Ocean Booking Group</a>
									</div>
									<div class="text">Forecasts due shortly from MPA 
									</div>

									<div class="tools">
										<a href="#" class="btn btn-minier btn-info">
											<i class="icon-only icon-share-alt"></i>
										</a>
									</div>
								</div>
							</div>
						
						<!--form >
							<div class="form-actions input-append">
								<input placeholder="Type your message here ..." type="text" class="width-75" name="message" />
								<button class="btn btn-small btn-info no-radius" onclick="return false;">
									<i class="icon-share-alt"></i>
									<span class="hidden-phone">Send</span>
								</button>
							</div>
						</form-->
					</div>
				</div> <!-- row-fluid page-content -->

				<!--div class="ace-settings-container" id="ace-settings-container">
				
					<div class="btn btn-app btn-mini btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-class="default" value="#438EB9" />#438EB9
									<option data-class="skin-1" value="#222A2D" />#222A2D
									<option data-class="skin-2" value="#C6487E" />#C6487E
									<option data-class="skin-3" value="#D0D0D0" />#D0D0D0
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header"> Fixed Header</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-breadcrumbs" />
							<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
						</div>
					</div>
				</div--><!--/#ace-settings-container-->
			</div><!--/.main-content-->

		</div><!--/.main-container-->

		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<!--[if !IE]>-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

		<!--<![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]>-->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!--<![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!--page specific plugin scripts-->

		<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/jquery.slimscroll.min.js"></script>
		<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="assets/js/jquery.sparkline.min.js"></script>
		<script src="assets/js/flot/jquery.flot.min.js"></script>
		<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="assets/js/flot/jquery.flot.resize.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})

				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
				});




			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "Overdue",  data: 38.7, color: "#68BC31"},
				{ label: "Defect",  data: 24.5, color: "#2091CF"},
				{ label: "Damaged Goods",  data: 8.2, color: "#AF4E96"},
				{ label: "Incorrect Shipment",  data: 18.6, color: "#DA5430"},
				{ label: "Other",  data: 10, color: "#FEE074"}
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne",
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);

			 /**
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);



			  var $tooltip = $("<div class='tooltip top in hide'><div class='tooltip-inner'></div></div>").appendTo('body');
			  var previousPoint = null;

			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}

			 });






				var d1 = [];
				for (var i = 0; i < Math.PI * 1; i += 1.5) {
					d1.push([i, i/2 * i * i/2]);
				}

				var d2 = [];
				for (var i = 0; i < Math.PI * 3.5; i += 1.0) {
					d2.push([i, i * i]);
				}

				var d3 = [];
				for (var i = 0; i < Math.PI * 2.5; i += 0.2) {
					d3.push([i, i ]);
				}


				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				/*$.plot("#sales-charts", [
					{ label: "Web", data: d1 },
					{ label: "Stores", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 20,
						min: 0,
						max: 8,
						tickDecimals: 5
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});*/


					/*var data = [
						{label: 'East Region', color:'red', data: [[2011,4], [2012,5.3], [2013,5.8], [2014,6.5]]},
						{label: 'Central Region', color:'blue', data: [[2011,4.8], [2012,5.3], [2013,4.0], [2014,5.4]]},
						{label: 'West Region', color:'yellow', data: [[2011,2.5], [2012,3.2], [2013,4.7], [2014,4.4]},
					];*/

    var data = [
        {label: 'East', color:'red', data: [[1,4], [2,5.3], [3,5.8], [4,6.5], [5,6.4]]},
        {label: 'Central', color:'blue', data: [[1,4.8], [2,4.4], [3,5.4], [4,3.0], [5,5.4]]},
        {label: 'West', color:'yellow', data: [[1,2.8], [2,3.2], [3,3.3], [4,4.0], [5,3.7]]},
    ];

$.plot($("#sales-charts"), data, {
    series: {
        stack: 1,
        bars: {
            show: true,
            barWidth: 0.5,
        },
        yaxis : {
            min : 0,
            tickLength: 0
        },
		   xaxis: {
			 ticks: [
			   [2011, "1"],
			   [2012, "2"],
			   [2013, "3"],
			   [2014, "4"],
			   [2015, "5"]
			 ]
		   },
    }
});


				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();

					var off2 = $source.offset();
					var w2 = $source.width();

					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}


				$('.dialogs,.comments').slimScroll({
					height: '300px'
			    });


				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});

				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});


			})
		</script>
	</body>
</html>
