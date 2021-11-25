<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\IncomingRequest;

class Login extends BaseController
{
	public function __construct() {
		$this->data = [
			"title" => "BGC - Login",
			"h1" => "Login",
			"ctrl" => "login",
			"page" => "index",
		];
		$this->data["js"] = [
			base_url("theme/assets/js/jquery.min.js"),
			base_url("theme/assets/js/jquery-ui.min.js"),
			base_url("theme/assets/js/perfect-scrollbar.min.js"),
			base_url("theme/assets/js/bootstrap.min.js"),
			base_url("theme/assets/js/jquery.validate.min.js"),
			base_url("theme/assets/js/es6-promise-auto.min.js"),
			base_url("theme/assets/js/moment.min.js"),
			base_url("theme/assets/js/bootstrap-datetimepicker.js"),
			base_url("theme/assets/js/bootstrap-selectpicker.js"),
			base_url("theme/assets/js/bootstrap-switch-tags.js"),
			base_url("theme/assets/js/jquery.easypiechart.min.js"),
			base_url("theme/assets/js/chartist.min.js"),
			base_url("theme/assets/js/bootstrap-notify.js"),
			base_url("theme/assets/js/sweetalert2.js"),
			base_url("theme/assets/js/jquery-jvectormap.js"),
			base_url("theme/assets/js/jquery.bootstrap.wizard.min.js"),
			base_url("theme/assets/js/bootstrap-table.js"),
			base_url("theme/assets/js/jquery.datatables.js"),
			base_url("theme/assets/js/fullcalendar.min.js"),
			base_url("theme/assets/js/paper-dashboard.js"),
			base_url("theme/assets/js/demo.js")
		];
		$this->data["css"] = [
			base_url("theme/assets/css/bootstrap.min.css"),
			base_url("theme/assets/css/paper-dashboard.css" ),
			base_url("theme/assets/css/demo.css"),
			"https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css",
			base_url("theme/assets/css/themify-icons.css"),
		];
		helper('form');
		$this->model = model('LoginModel');
	}
	public function index()
	{
		$d = $this->data;
		return view('Login/form2', $d);
	}
	public function ajaxlogin()
	{
		$s = session();
		// $p = $this->request->getPost();
		$l = $this->request->getVar('logus');
		$p = $this->request->getVar('pasus');

		// $q = $this->model->login($l,$p);
		// if(isset($q)){
		if($l == 'TRAB1' && $p == 'Asdf1234'){
			// print_r($q); IdUsu, NomUsu, t.IdTUsu, t.NomTUsu,ConUsu
			$s->set(["NomUsu"=>"TRAB1","IdUsu"=>1,"IdTUsu"=>1]);
			return redirect()->to('/ctrlfm01');
		}else{
			$s->setFlashdata(['msg' => 'El usuario está inactivo o las contraseña no coinciden.','r' => false]);
			// print_r($this->model->getLastQuery()->getQuery());
			return redirect()->to('/login');
		}
	}
	public function logout()
	{
		$s = session();
		$s -> destroy();
		return redirect()->to('/login');
	}
	private function validar()
	{
		echo "<br><h1>Login</h1><br>";
		$q = $this->model->login("TRAB1","Asdf1234")->getRowArray();
		$r = $this->model->db->affectedRows();
		print_r($q);
		print_r($r);
		$s = session();
		$s -> set($q);
		$s->setFlashdata('message', '<b>ERROR</b>, Usuario y Contraseña no coinciden o el Usuario está inactivo');
		echo "<br><h1>Session</h1><br>";
		print_r(($s->getFlashdata()?"true":"false"));
	}
}
