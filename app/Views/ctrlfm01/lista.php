<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="<?= base_url("theme/src/assets/img/apple-icon.png") ?>">
        <link rel="icon" type="image/png" sizes="96x96" href="<?= base_url("theme/src/assets/images/favicon.png") ?>">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

        <title>NOTA</title>

        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />

        <link href="<?= base_url("theme/assets/css/bootstrap.min.css") ?>" rel="stylesheet" />
        <link href="<?= base_url("theme/assets/css/paper-dashboard.css") ?>" rel="stylesheet"/>
        <link href="<?= base_url("theme/assets/css/demo.css") ?>" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
        <link href="<?= base_url("theme/assets/css/themify-icons.css") ?>" rel="stylesheet">
    </head>

	<body>
		<div class="wrapper">
			<div class="sidebar" data-background-color="brown" data-active-color="danger">
			<!--
				Tip 1: you can change the color of the sidebar's background using: data-background-color="white | brown"
				Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
			-->
				<div class="logo">
					<a href="https://www.creative-tim.com" class="simple-text logo-mini">
						CT
					</a>

					<a href="https://www.creative-tim.com" class="simple-text logo-normal">
						EMP
					</a>
				</div>
				<div class="sidebar-wrapper">
					<ul class="nav">
						<li class="active">
							<a data-toggle="collapse" href="#formsExamples">
								<i class="ti-clipboard"></i>
								<p>
									Formularios
									<b class="caret"></b>
								</p>
							</a>
							<div class="collapse" id="formsExamples">
								<ul class="nav">
									<li class="active">
										<a href="<?=base_url('ctrlfm01')?>">
											<span class="sidebar-mini">NI</span>
											<span class="sidebar-normal">Nota de Ingreso</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li class="">
							<a data-toggle="collapse" href="#fe2">
								<i class="ti-clipboard"></i>
								<p>
									Informes
									<b class="caret"></b>
								</p>
							</a>
							<div class="collapse" id="fe2">
								<ul class="nav">
									<li class="">
										<a href="<?=base_url('ctrlfm01/inf')?>">
											<span class="sidebar-mini">IN</span>
											<span class="sidebar-normal">Informes</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<div class="main-panel">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-minimize">
							<button id="minimizeSidebar" class="btn btn-fill btn-icon"><i class="ti-more-alt"></i></button>
						</div>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar bar1"></span>
								<span class="icon-bar bar2"></span>
								<span class="icon-bar bar3"></span>
							</button>
							<a class="navbar-brand" href="#userpage">Empleado</a>
						</div>
						<div class="collapse navbar-collapse">
							<ul class="nav navbar-nav navbar-right">
								<li>
									<a href="<?=base_url("login/logout")?>" class="btn-rotate">
										<i class="ti-close"></i>
										<p class="hidden-md hidden-lg">
											Salir
										</p>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>

				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12 col-md-12">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Listado Notas De Ingreso</h4>
										<?php $fd = session()->getFlashdata() ?>
										<?php if($fd): ?>
											<h5 class="<?=($fd['res']['r']?"text-success":"text-danger")?>"><?=$fd['res']['msg']?></h5>
										<?php endif; ?>									</div>
									<div class="card-content">
										<a class="btn btn-fill" style="margin-bottom:10px;" href="<?= base_url("ctrlfm01/editar") ?>">Nueva Nota de Ingreso</a>
										<table id="tabfm01" class="table table-striped table-bordered nowrap" cellspacing="0" style="width:100%;"></table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<footer class="footer">
					<div class="container-fluid">
						<div class="copyright pull-right">
							&copy; <script>document.write(new Date().getFullYear())</script> <a href="https://www.EMP.net">EMP</a>
						</div>
					</div>
				</footer>
			</div>
		</div>
	</body>

	<script src="<?= base_url("theme/assets/js/jquery.min.js")?>" type="text/javascript"></script>
	<script src="<?= base_url("theme/assets/js/jquery-ui.min.js")?>" type="text/javascript"></script>
	<script src="<?= base_url("theme/assets/js/perfect-scrollbar.min.js")?>" type="text/javascript"></script>
	<script src="<?= base_url("theme/assets/js/bootstrap.min.js")?>" type="text/javascript"></script>
	<script src="<?= base_url("theme/assets/js/jquery.validate.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/es6-promise-auto.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/moment.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/bootstrap-datetimepicker.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/bootstrap-selectpicker.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/bootstrap-switch-tags.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/jquery.easypiechart.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/chartist.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/bootstrap-notify.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/sweetalert2.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/jquery-jvectormap.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/jquery.bootstrap.wizard.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/bootstrap-table.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/jquery.datatables.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/fullcalendar.min.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/paper-dashboard.js")?>"></script>
	<script src="<?= base_url("theme/assets/js/demo.js")?>"></script>
    <script type="text/javascript">
        pathArray = location.href.split('/');
        cadenaurl = pathArray[0] + "//" + pathArray[2] + "/";
        ctrl = "ctrlfm01";
        var tlist = $('#tabfm01').DataTable({
            responsive: true,
            ajax: {
                type: "POST",
                url: cadenaurl + ctrl + "/ajaxlista",
                data: () => {
                    return {
                    tip: parseInt($('#lsttip').val())
                    };
                },
                dataType: 'json',
                dataSrc: function(json) {
                    // console.log("Pre Processing",json.data);
                    return json.data;
                }
            },
            columns: [
                {
                    data: null,
                    defaultContent: '',
                    title: 'ACCIONES',
                },
                {
                    data: 'nro',
                    title: 'N°',
                    className: 'text-center'
                },
                {
                    data: 'fecha',
                    title: 'Fecha Creacion',
                    className: 'text-center'
                },
                {
                    data: 'total',
                    title: 'Total',
                    className: 'text-center'
                },
                {
                    data: 'tip',
                    title: 'Tipo Doc Origen',
                    className: 'text-center'
                },
                {
                    data: 'nrDoc',
                    title: 'Nro Doc Origen',
                    className: 'text-center'
                },
            ],
            columnDefs: [
				{ //Acciones
					render: function(data, type, row, meta) {
						return '<a onclick="editar(' + meta.row + ')" title="Editar" class="waves-effect btn-circle waves-light" style="margin-right:10px;"><i class="ti-pencil-alt text-success"></i></a>' +
						'<a onclick="eliminar(' + meta.row + ')" title="Eliminar" class="waves-effect btn-circle waves-light"><i class="ti-close text-danger"></i></a>';
					},
					targets: 0 //Column Acciones
				}, 
			],
            "order": [
              [1, "asc"]
            ],
            "scrollX": true,
            "autoWidth": true,
            "ordering": true,
            "lengthChange": true,
            "language": {
                "sUrl": cadenaurl + "resources/json/spanish.json"
            },
        });
		function editar(rw) {
			dt = tlist.row(rw).data()
			id = dt.nro
			window.location = cadenaurl+ctrl+'/editar/'+id+'/1'
		}
    </script>
</html>