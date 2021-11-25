<?php

namespace App\Controllers;

require_once('..\app\Libraries\signature-to-image.php');
use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

class Usuarios extends BaseController
{
	use ResponseTrait;
	public function __construct() {
		$this->data = [
			'title' => 'SDERP - Perfil'
		];
		$this->data["js"] = [
			"https://fonts.googleapis.com/css?family=Montserrat:400,700,200",
			"https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css",
			base_url("theme/src/assets/css/bootstrap.min.css"),
			base_url("theme/src/assets/css/paper-dashboard.css?v=2.0.1"),
			base_url("theme/src/assets/demo/demo.css"),
		];
		$this->data["css"] = [
			base_url("theme/src/assets/js/core/jquery.min.js"),
			base_url("theme/src/assets/js/core/popper.min.js"),
			base_url("theme/src/assets/js/core/bootstrap.min.js"),
			base_url("theme/src/assets/js/plugins/perfect-scrollbar.jquery.min.js"),
			base_url("theme/src/assets/js/plugins/chartjs.min.js"),
			base_url("theme/src/assets/js/plugins/bootstrap-notify.js"),
			base_url("theme/src/assets/js/paper-dashboard.min.js?v=2.0.1"),
			base_url("theme/src/assets/demo/demo.js"),
		];
		$this->model = model("UsuariosModel");
		helper('form');
	}
	public function index()
	{
		if(!session()->get("IdUsu")) return redirect()->to('/login');

		$d = $this->data;
		$d["udata"] = $this->model->getUser(session()->get("IdUsu"));
		return view('usuarios/perfil',$d);
	}
	public function rcon()
	{
		if(!session()->get("IdUsu")) return redirect()->to('/login');
		$d = $this->data;
		$d["id"] = session()->get("IdUsu");
		return view('usuarios/chcon',$d);
	}

	public function submiteditar() //Editar Usuario
	{
		$p = $this->request->getVar();
		// print_r($p1);
		$p["IdUsu"] = session()->get("IdUsu");
		try {
			$b = $this->model->update($p["IdUsu"],$p);
			if($b) session()->setFlashdata(['msg' => 'Operación correcta','r' => true]);
			else session()->setFlashdata(['msg' => 'Operación Incorrecta','r' => false]);
		} catch (\Throwable $th) {
			session()->setFlashdata(['msg' => 'Operación Incorrecta','r' => false]);
		}
		return redirect()->to('/usuarios');
	}
	public function submitchcon() //Editar contraseña
	{
		$p = $this->request->getVar();
		if($p["pas1"] != $p["pas2"]){
			session()->setFlashdata(['msg' => 'Las contraseñas no coinciden','r' => false]);
			return redirect()->to('/usuarios/rcon');
		}
		try {
			$b = $this->model->update($p["IdUsu"],["ConUsu" => password_hash($p["pas2"], PASSWORD_DEFAULT)]);
			print_r($this->model->getLastQuery()->getQuery());
			if($b) session()->setFlashdata(['msg' => 'Contraseña actualizada','r' => true]);
			else session()->setFlashdata(['msg' => 'Error al actualizar','r' => false]);
		} catch (\Throwable $th) {
			session()->setFlashdata(['msg' => 'Puede que no haya conexión o haya un error en el servidor','r' => false]);
		}
		return redirect()->to('/usuarios');
	}
	public function showkey()
	{
		// $e = Services::encrypter();
		// $v1 = $e->encrypt("NIGGA");
		// var_dump($v1);
		// echo $e->decrypt($v1);
		$key = bin2hex(\CodeIgniter\Encryption\Encryption::createKey(32));
		print_r($key); //usar hex2bin:<key> para almacenar
	}
}
