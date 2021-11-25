<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<?=base_url() ?>public/assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="<?=base_url() ?>public/assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title><?php echo $title; ?></title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <?php foreach ($css as $v) : ?>
        <link href="<?= $v ?>" rel="stylesheet"></script>
    <?php endforeach ?>
</head>

<body>
    <nav class="navbar navbar-transparent navbar-absolute">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!--<a class="navbar-brand" href="../dashboard/overview.html">Software de Mantenimiento1</a>-->
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                       <li>
                       <a href="<?= base_url()?>login/pagi_about">
                            Ayuda...
                        </a>
                    </li>
                </ul>
            </div>  
        </div>
    </nav>

    <div class="wrapper wrapper-full-page">
        <div class="full-page login-page" data-color="" data-image="<?=base_url()?>/resources/imagenes/BGPrincipal1.png">
        <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                            <form method="POST" action="#">
                                <div class="card" data-background="color" data-color="blue">
                                    <div class="card-header">
                                    
                                        <h4 class="card-title text-center">Software de Gestion de Calidad</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="form-group">
                                            <label>Usuario</label>
                                            <input type="text" name="txtusuario" value="PFLOREZ" placeholder="ID RRHH" class="form-control input-no-border">

                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="txtpassword" value="PFLOREZ" placeholder="PASSWORD" class="form-control input-no-border">
                                        </div>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button type="submit" class="btn btn-fill btn-wd ">Ingresa</button>
                                        <div class="forgot text-info text-left"><br>
                                            <?php echo session()->getFlashdata('ControllerMessage') ?>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            

          <footer class="footer footer-transparent">
                <div class="container">
                    <div class="copyright">
                        &copy; <script>document.write(new Date().getFullYear())</script>, Realizado por <a href="#">EMP S.A.C.</a> {elapsed_time} mseg
                    </div>
                </div>
            </footer>
        </div>
    </div>	
</body>
    <!-- JS -->
    <?php foreach ($js as $v) : ?>
        <script src="<?= $v ?>"></script>
    <?php endforeach ?>
<script type="text/javascript">
        $().ready(function(){
            $page = $('.full-page');
            image_src = $page.data('image');

            if(image_src !== undefined){
                image_container = '<div class="full-page-background" style="background-image: url(' + image_src + ') "/>'
                $page.append(image_container);
            }
        });
	</script>
</html>