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
									<h4 class="card-title">Nota de Ingreso</h4>
									<?php $fd = session()->getFlashdata() ?>
									<?php //var_dump($fd) ?>
									<?php if($fd): ?>
										<h5 class="<?=($fd['res']['r']?"text-success":"text-danger")?>"><?=$fd['res']['msg']?></h5>
									<?php endif; ?>
								</div>
								<div class="card-content">
									<form id="freg" action="<?= base_url($ctrl.'/submiteditnota')?>">
										<input type="hidden" name="edt" value="<?=$edt?>">
										<div class="row">
											<div class="col-md-3 col-sm-6">
												<div class="form-group">
													<label>Nota de Ingreso</label>
													<?php echo form_input(["name" => "N°Nota","id" => "idni", "type"=>"text","class" => "form-control border-input", "value" => (isset($dtreg['N°Nota'])?$dtreg['N°Nota']:'')]) ?>
												</div>
											</div>
											<div class="col-md-3 col-sm-6">
												<div class="form-group">
													<label>Período</label>
													<?php echo form_input(["type"=>"text","disabled"=>true,"class" => "form-control border-input", "value" => (isset($dtreg['Año'])?$dtreg['Año']:date('Y')) ]) ?>
												</div>
											</div>
											<div class="col-md-3 col-sm-6">
												<div class="form-group">
													<label>Fecha Reg.</label>
													<?php echo form_input(["name" => "fecha", "type"=>"date","class" => "form-control border-input", "value" => (isset($dtreg['fecha'])?$dtreg['fecha']:date("Y-m-d")) ]) ?>
												</div>
											</div>
											<div class="col-md-3 col-sm-6">
												<div class="form-group">
													<label>Hora Reg.</label>
													<?php echo form_input(["name" => "Hora", "type"=>"time","class" => "form-control border-input", "value" => (isset($dtreg['Hora'])?$dtreg['Hora']:date("H:i")) ]) ?>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 col-sm-6">
												<div class="form-group">
													<label>Proveedor</label>
													<?php 
														echo form_dropdown('',$lprov,(isset($dtreg['Proveedor'])?$dtreg['Proveedor']:''),["name"=>"Proveedor","class" => "form-control border-input", "required" => true])
													?>
												</div>
											</div>
											<div class="col-md-3 col-sm-3">
												<div class="form-group">
													<label>Tipo Documento Origen</label>
													<?php 
														$l = [
															"" => "Seleccionar", 
															'ORDEN DE COMPRA'=>'ORDEN DE COMPRA',
															'DEVOLUCION X SOBRESTOCK'=>'DEVOLUCION X SOBRESTOCK',
															'DEVOLUCION X VENCIMIENTO'=>'DEVOLUCION X VENCIMIENTO',
															'DEVOLUCION X DETERIORO'=>'DEVOLUCION X DETERIORO',
															'DONACION'=>'DONACION'
														];
														echo form_dropdown('',$l,(isset($dtreg['Tip_Doc_Origen'])?$dtreg['Tip_Doc_Origen']:''),["name"=>"Tip_Doc_Origen","class" => "form-control border-input", "required" => true])
													?>
												</div>
											</div>
											<div class="col-md-3 col-sm-3">
												<div class="form-group">
													<label>Doc. Origen</label>
													<?php echo form_input(["name" => "Nro_Doc_Origen", "type"=>"text","class" => "form-control border-input", "value" => (isset($dtreg['Nro_Doc_Origen'])?$dtreg['Nro_Doc_Origen']:'') ]) ?>
												</div>
											</div>
										</div>
										<!-- Tabla Detalle (No se muestra si es nuevo) -->
										<?php if($edt==1): ?>
											<div class="row">
												<div class="col-md-12">
													<h3>Detalle De La Nota de Ingreso</h3>
													<a class="btn btn-fill" style="margin-bottom:10px;" href="<?= base_url("ctrlfm01/editarprod/101/".$dtreg['N°Nota'].'/0') ?>">Añadir Nuevo Producto</a>
													<table id="tabfm01" class="table table-striped table-bordered nowrap" cellspacing="0" style="width:100%;"></table>
												</div>
											</div>
										<?php endif; ?>
										
										<div class="text-center">
											<a href="<?=base_url($this->data["ctrl"]) ?>" class="btn btn-danger btn-fill btn-wd">Cancelar</a>
											<button type="submit" class="btn btn-success btn-fill btn-wd">Guardar</button>
										</div>
										<div class="clearfix"></div>
									</form>
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
		idn = '<?= (isset($id)?$id:'') ?>'
		edt = '<?= (isset($edt)?$edt:'') ?>'
		if(edt == 1) //Si estamos editando sí se mostrará la tabla
			var tlist = $('#tabfm01').DataTable({
				responsive: true,
				ajax: {
					type: "POST",
					url: cadenaurl + ctrl + "/ajaxlistaprod",
					data: () => {
						return {
							id: $("#idni").val()
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
						data: 'nom',
						title: 'Medicamento e Insumo',
						className: 'text-center'
					},
					{
						data: 'codprod',
						title: 'Código',
						className: 'text-center'
					},
					{
						data: 'cantprod',
						title: 'Cantidad',
						className: 'text-center'
					},
					{
						data: 'precio',
						title: 'Precio',
						className: 'text-center'
					},
					{
						data: 'fechav',
						title: 'Fecha Vcto',
						className: 'text-center'
					},
					{
						data: 'importe',
						title: 'Importe',
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
			id = dt.codprod
			window.location = cadenaurl+ctrl+'/editarprod/'+id+'/'+idn+'/1'
		}
		var p 
		async function eliminar(rw) {
			dt = tlist.row(rw).data()
			id = dt.codprod
			console.log(id,idn);
			res = await $.ajax({
				url: cadenaurl + ctrl + '/ajaxdelprod',
				data: {codprod: id, nro: idn},
				type: 'GET',
			});
			p = res;
			console.log(p);
			if(p.r) alert("Producto Eliminado")
			else alert("Error al eliminar")
			tlist.ajax.reload()
		}
    </script>
</html>