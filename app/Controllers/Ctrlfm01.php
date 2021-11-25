<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\API\ResponseTrait;

class Ctrlfm01 extends BaseController
{
    use ResponseTrait;
    public function __construct() {
		$this->data = [
			'title' => 'EMP - Formulario 1',
			'ctrl' => 'ctrlfm01'
		];
		$this->data["js"] = [
			"https://fonts.googleapis.com/css?family=Montserrat:400,700,200",
			"https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css",
			base_url("theme/assets/css/bootstrap.min.css"),
			base_url("theme/assets/css/paper-dashboard.css?v=2.0.1"),
            base_url('theme/assets/js/sweetalert2/dist/sweetalert2.min.css'),
			base_url('theme/src/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css'),
			base_url("theme/assets/demo/demo.css"),
		];
		$this->data["css"] = [
			base_url("theme/assets/js/core/jquery.min.js"),
			base_url("theme/assets/js/core/popper.min.js"),
			base_url("theme/assets/js/core/bootstrap.min.js"),
			base_url("theme/assets/js/plugins/perfect-scrollbar.jquery.min.js"),
			base_url("theme/assets/js/plugins/chartjs.min.js"),
			base_url("theme/assets/js/plugins/bootstrap-notify.js"),
			base_url("theme/assets/js/paper-dashboard.min.js?v=2.0.1"),
            base_url('theme/assets/js/sweetalert2/dist/sweetalert2.all.min.js'),
            base_url('theme/assets/js/sweetalert2/dist/sweet-alert.min.js'),
			base_url('theme/assets/js/datatables/media/js/jquery.dataTables.min.js'),
			base_url("theme/assets/demo/demo.js"),
		];
		$this->model = model("Modelfm01");
		helper('form');
	}
	public function index() //Lista
	{
		if(!session()->get("IdUsu")) return redirect()->to('/login');

		$d = $this->data;
		$d["lnota"] = $this->model->getAllNotas();

		return view('ctrlfm01/lista',$d);
	}
	public function inf() //informes
	{
		if(!session()->get("IdUsu")) return redirect()->to('/login');

		$d = $this->data;
		$d["lnota"] = $this->model->getAllNotas();

		return view('ctrlfm01/inf',$d);
	}
    public function editar($id='',$edt=0)
	{
		if(!session()->get("IdUsu")) return redirect()->to('/login');
		$d = $this->data;
		$d["dtreg"] = $this->model->getNota($id);
		$d["lprov"] = $this->model->getListProve();
		$d["id"] = $id;
		$d["edt"] = $edt;
		return view('ctrlfm01/editar',$d);
	}
	public function editarprod($id,$nro='',$edt=0) //Editar Producto NI o Crear Nuevo
	{ //Edt 0> Nuevo, 1> Editar, 
		if(!session()->get("IdUsu")) return redirect()->to('/login');

		$d = $this->data;
		$d["dtreg"] = $this->model->getProd($id,$nro);
		$d["lprod"] = $this->model->getListProd();
		$d["id"] = $id;
		$d["edt"] = $edt;
		return view('ctrlfm01/editarprod',$d);
	}
    public function nuevo()
	{
		if(!session()->get("IdUsu")) return redirect()->to('/login');
		$d = $this->data;
		$d["dtreg"] = null;
		return view('ctrlfm01/editar',$d);
	}
    
    //AJAX
    public function ajaxlista() //Ajax lista NI
	{
		// $idu = session()->get("IdUsu");
		$dt = $this->model->getAllNotas();
		return $this->setResponseFormat('json')->respond(["data" => $dt]);
	}
	public function ajaxlistaprod() //Ajax lista productos
	{
		$id = $this->request->getVar("id");
		$dt = $this->model->getAllNotasProd($id);
		return $this->setResponseFormat('json')->respond(["data" => $dt, 'lq' => $this->model->db->getLastQuery()->getQuery()]);
	}
	public function ajaxprodprecio() //Ajax precio Producto
	{
		$id = $this->request->getVar("id");
		$dt = $this->model->getProdPrecio($id);
		return $this->setResponseFormat('json')->respond(["data" => $dt, 'lq' => $this->model->db->getLastQuery()->getQuery()]);
	}
	public function submiteditprod()
	{
		$p = $this->request->getVar();
		$t = false; //Testing
		print_r($p);
		try {
			$b = false;
			$edt = $p["edt"];
			unset($p["edt"]);
			if($edt == 0) { //Nuevo
				$b = $this->model->insertProd($p);
			}
			else{
				$b = $this->model->updateProd($p);
			}

			if($b) session()->setFlashdata('res', ['msg'=>"Éxito al Guardar",'r'=>true]);
			else session()->setFlashdata('res', ['msg'=>"Error al Guardar",'r'=>false,'th'=>'Error al insertar']);
		} catch (\Throwable $th) {
			session()->setFlashdata('res', ['msg'=>"Error en el Servidor",'r'=>false,'th'=>$th->getMessage(),'lq'=>$this->model->db->getLastQuery()->getQuery()]);
		}
		if(!$t) return redirect()->to($this->data['ctrl'].'/editarprod/'.$p['Cod_Producto'].'/'.$p['N°Nota'].'/'.($b?1:$edt));
	}
	public function submiteditnota()
	{
		$p = $this->request->getVar();
		$t = false; //Testing
		if($t) print_r($p);
		try {
			$b = false;
			$edt = $p["edt"];
			unset($p["edt"]);
			$fecha = date_create($p["fecha"]);
			unset($p["fecha"]);
			$p['Año'] = date_format($fecha,'Y');
			$p['Mes'] = date_format($fecha,'m');
			$p['Dia'] = date_format($fecha,'d');
			if($t) print_r($p);
			if($edt == 0) { //Nuevo
				if(!$t) $b = $this->model->insertNota($p);
			}
			else{
				if(!$t) $b = $this->model->updateNota($p);
			}

			if($b) session()->setFlashdata('res', ['msg'=>"Éxito al Guardar",'r'=>true,"q" => $this->model->db->getLastQuery()->getQuery()]);
			else session()->setFlashdata('res', ['msg'=>"Error al Guardar",'r'=>false,'th'=>'Error al insertar']);
		} catch (\Throwable $th) {
			session()->setFlashdata('res', ['msg'=>"Error en el Servidor",'r'=>false,'th'=>$th->getMessage(),'lq'=>$this->model->db->getLastQuery()->getQuery()]);
		}
		if(!$t) return redirect()->to($this->data['ctrl'].'/editar/'.$p['N°Nota'].'/'.($b?1:$edt));
	}
	public function ajaxdelprod() //Ajax Eliminar PNI
	{
		$dt = [];
		$dt['nro'] = $this->request->getVar("nro");
		$dt['codprod'] = $this->request->getVar("codprod");
		$t = true; //Testing
		try {
			$b = false;
			$b = $this->model->deleteProd($dt);

			if($b) return $this->setResponseFormat('json')->respond(["m" => "Éxito al Eliminar", "r"=>true, "q" => $this->model->db->getLastQuery()->getQuery()]);
			else return $this->setResponseFormat('json')->respond(["m" => "Error al Eliminar", "r"=>false]);
		} catch (\Throwable $th) {
			return $this->setResponseFormat('json')->respond(["m" => "Error en el Servidor", "r"=>false,'th'=>$th->getMessage()]);
		}
	}
	public function ajaxdelnota()
	{
		$dt = [];
		$dt['nro'] = $this->request->getVar("nro");
		$t = true; //Testing
		try {
			$b = false;
			$b = $this->model->deleteNota($dt);

			if($b) return $this->setResponseFormat('json')->respond(["m" => "Éxito al Eliminar", "r"=>true, "q" => $this->model->db->getLastQuery()->getQuery()]);
			else return $this->setResponseFormat('json')->respond(["m" => "Error al Eliminar", "r"=>false]);
		} catch (\Throwable $th) {
			return $this->setResponseFormat('json')->respond(["m" => "Error en el Servidor", "r"=>false,'th'=>$th->getMessage()]);
		}
	}
	public function ajaxeli() //Eliminar
	{
		$id = $this->request->getVar("id");
		try {
			$b = $this->model->delete($id);
			if($b) return $this->setResponseFormat('json')->respond(["m" => "Registro eliminada", "r"=>true]);
			else return $this->setResponseFormat('json')->respond(["m" => "Error al eliminar", "r"=>false]);
			// session()->setFlashdata(['msg' => 'Operación correcta','r' => true]);
			// session()->setFlashdata(['msg' => 'Error al guardar, si la Registro tiene pagos o items no se puede eliminar','r' => false]);
		} catch (\Throwable $th) {
			return $this->setResponseFormat('json')->respond(["m" => 'Error en el Servidor', "msg" => $th->getMessage(),'r' => false]);
		}
	}

	//Informe
	public function ajaxinf() //Ajax lista informes
	{
		$num = $this->request->getVar("num");
		$dt = $this->model->getInf($num);
		return $this->setResponseFormat('json')->respond($dt);
	}

	public function verificar()
	{
		// echo 'Get All Notas';
		// var_dump($this->model->getAllNotas());
		// echo '<br>Get Notas';
		// var_dump($this->model->getNota('21-0001628'));
		// echo '<br>Get List Prove';
		// var_dump($this->model->getListProve());
		echo '<br>Get All Notas Prod';
		var_dump($this->model->getAllNotasProd('21-0001628'));
		// echo '<br>Get Prod';
		// var_dump($this->model->getProd('102','21-0001628'));
		// echo '<br>Get Prod Precio';
		// var_dump($this->model->getProdPrecio('112'));
		// echo '<br>Get List Prod';
		// var_dump($this->model->getListProd());
	}
}
