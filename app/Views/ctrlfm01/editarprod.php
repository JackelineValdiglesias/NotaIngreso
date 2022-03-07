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
									<h4 class="card-title">Producto Nota de Ingreso</h4>
									<?php $fd = session()->getFlashdata() ?>
									<?php //var_dump($fd); ?>
									<?php if($fd): ?>
										<h5 class="<?=($fd['res']['r']?"text-success":"text-danger")?>"><?=$fd['res']['msg']?></h5>
									<?php endif; ?>
								</div>
								<div class="card-content">
									<form id="freg" action="<?= base_url($ctrl.'/submiteditprod')?>">
										<input type="hidden" name="edt" value="<?=$edt?>">
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="form-group">
													<label>Nota de Ingreso</label>
													<?php echo form_input(["name" => "N°Nota","id" => "idni", "type"=>"text","class" => "form-control border-input", "value" => (isset($dtreg['N°Nota'])?$dtreg['N°Nota']:$nro)]) ?>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3 col-sm-3">
												<div class="form-group">
													<label>Producto</label>
													<?php 
														echo form_dropdown('',$lprod,(isset($dtreg['Cod_Producto'])?$dtreg['Cod_Producto']:''),["id"=>"producto","name"=>"Cod_Producto","class" => "form-control border-input", "required" => true])
													?>
												</div>
											</div>
											<div class="col-md-3 col-sm-3">
												<div class="form-group">
													<label>Precio</label>
													<?php echo form_input(["id"=>"precio","type"=>"number","disabled"=>true,"class" => "form-control border-input", "value" => (isset($dtreg['precio'])?$dtreg['precio']:'') ]) ?>
												</div>
											</div>
											<div class="col-md-3 col-sm-3">
												<div class="form-group">
													<label>Cantidad</label>
													<?php echo form_input(["id"=>"cantidad","name" => "Cant_Producto", "type"=>"number", "step" => "1", "min" => "0","class" => "form-control border-input", "value" => (isset($dtreg['Cant_Producto'])?$dtreg['Cant_Producto']:'') ]) ?>
												</div>
											</div>
											<div class="col-md-3 col-sm-3">
												<div class="form-group">
													<label>Importe</label>
													<?php echo form_input(["id"=>"importe","name" => "Importe", "readonly" => true, "type"=>"number","class" => "form-control border-input", "value" => (isset($dtreg['Importe'])?$dtreg['Importe']:'') ]) ?>
												</div>
											</div>
										</div>										
										<div class="text-center">
											<a href="<?=base_url($this->data["ctrl"]."/editar/".$nro."/1")?>" class="btn btn-danger btn-fill btn-wd">Cancelar</a>
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
	<script src="<?= base_url("theme/assets/js/bootstrap-notify.js")?>"></script>
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

		async function getPrecio() {
			try {
				res = await $.ajax({
					url: cadenaurl + ctrl + '/ajaxprodprecio',
					data: {id: $("#producto").val()},
					type: 'GET',
				});
				p = res.data;
				c = $("#cantidad").val()
				$("#precio").val(p)
				$("#importe").val(p*c)
				console.log(res);
			} catch (error) {
				console.log(error);
			}
		}
		$("#producto").on("change",(e)=>getPrecio())
		$("#cantidad").on("change",(e)=>getPrecio())
    </script>
</html>