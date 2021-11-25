<!--

  =========================================================
  * Paper Dashboard PRO - V1.3.1
  =========================================================

  * Product Page: https://www.creative-tim.com/product/paper-dashboard-pro
  * Available with purchase of license from https://www.creative-tim.com/product/paper-dashboard-pro
  * Copyright 2017 Creative Tim (https://www.creative-tim.com)
  * License Creative Tim (https://www.creative-tim.com/license)

  =========================================================

-->

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="<?= base_url("theme/src/assets/img/apple-icon.png") ?>">
	<link rel="icon" type="image/png" sizes="96x96" href="<?= base_url("theme/src/assets/assets/img/favicon.png") ?>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Nota Crédito</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <?php foreach ($css as $v) : ?>
        <link href="<?= $v ?>" rel="stylesheet"></script>
    <?php endforeach ?>
</head>

<body>
    <div class="wrapper wrapper-full-page">
    <div class="full-page login-page" data-color="" data-image="<?=base_url('resources/imagenes/BGPrincipal1.png')?>">
        <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                            <form method="POST" action="<?=base_url('login/ajaxlogin')?>">
                                <div class="card" data-background="color" data-color="blue">
                                    <div class="card-header">
                                        <h4 class="card-title text-center">Nota Crédito</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="form-group">
                                            <label>Usuario</label>
                                            <input type="text" name="logus" value="TRAB1" placeholder="ID RRHH" class="form-control input-no-border">
                                        </div>
                                        <div class="form-group">
                                            <label>Contraseña</label>
                                            <input type="password" name="pasus" value="Asdf1234" placeholder="CONTRASEÑA" class="form-control input-no-border">
                                        </div>
                                    </div>
                                    <div class="card-footer text-center">
                                        <button type="submit" class="btn btn-fill btn-wd ">Ingresa</button>
                                        <div class="forgot text-info text-left"><br>
                                            <?php echo session()->getFlashdata("msg") ?>
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
                        &copy; <script>document.write(new Date().getFullYear())</script>
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
            demo.checkFullPageBackgroundImage();

            setTimeout(function(){
                // after 1000 ms we add the class animated to the login/register card
                $('.card').removeClass('card-hidden');
            }, 700)
        });
	</script>

</html>
