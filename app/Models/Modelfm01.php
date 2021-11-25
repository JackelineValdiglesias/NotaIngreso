<?php

namespace App\Models;

use CodeIgniter\Model;

class Modelfm01 extends Model
{
    protected $DBGroup              = 'default';
    protected $table                = 'nota_ingreso';
    protected $primaryKey           = 'N°Nota';
    protected $useAutoIncrement     = true;
    protected $insertID             = 0;
    protected $returnType           = 'array';
    protected $useSoftDeletes       = false;
    protected $protectFields        = false;
    // protected $allowedFields        = [];

    // Dates
    protected $useTimestamps        = false;
    protected $dateFormat           = 'datetime';
    protected $createdField         = 'FcreFm01';
    protected $updatedField         = 'FmodFm01';
    // protected $deletedField         = 'deleted_at';
    public function getAllNotas()
    {
        return $this->db->query("call getAllNota()")->getResultArray();
    }
    //Editar Nota Ingreso
    public function getNota($id) //Datos de una Nota de ingreso
    {
        return $this->db->query("call getNota('".$id."')")->getRowArray();
    }
    public function insertNota($dt) //Insertar NI
    {
        $sql = "call ins_nota_ingreso('".$dt['N°Nota']."','".$dt['Tip_Doc_Origen']."','".$dt['Proveedor']."','".$dt['Nro_Doc_Origen']."',".$dt['Mes'].",".$dt['Año'].",".$dt['Dia'].",'".$dt['Hora']."');";
        return $this->db->query($sql,$dt);
    }
    public function updateNota($dt) //Actualizar NI
    {
        $sql = "call mod_nota_ingreso('".$dt['N°Nota']."','".$dt['Tip_Doc_Origen']."','".$dt['Proveedor']."','".$dt['Nro_Doc_Origen']."',".$dt['Mes'].",".$dt['Año'].",".$dt['Dia'].",'".$dt['Hora']."');";
        return $this->db->query($sql,$dt);
    }
    public function deleteNota($dt) //Eliminar NI
    {
        $sql = "call eliminar_nota_ingreso('".$dt['nro']."');";
        return $this->db->query($sql,$dt);
    }
    public function getListProve() //Listado de todos los proveedores
    {
        $l = $this->db->query("call ListProve()")->getResultArray();
        $l2 = [];
        foreach ($l as $k => $prove) {
            $l2[$prove["RUC_Prove"]] = $prove["Nombre proveedor"];
        }
        return $l2;
    }
    public function getAllNotasProd($id) //Listado de Productos de una Nota de Ingreso
    {
        return $this->db->query('call getAllNotasProd("'.$id.'")')->getResultArray();
    }

    //Editar Nota Ingreso Producto
    public function getProd($id, $nro) //Datos de un Producto Nota de ingreso
    {
        return $this->db->query("call GetProd('".$id."','".$nro."')")->getRowArray();
    }
    public function getProdPrecio($id) //Precio de un producto
    {
        $row = $this->db->query("call getProdPrecio('".$id."')")->getRowArray();
        return $row["precio"];
    }
    public function insertProd($dt) //Precio de un producto
    {
        $sql = "call insertar_produ_nota_ingreso('".$dt['N°Nota']."','".$dt['Cod_Producto']."',".$dt['Cant_Producto'].",".$dt['Importe'].");";
        return $this->db->query($sql,$dt);
    }
    public function updateProd($dt) //Precio de un producto
    {
        $sql = "call mod_prod_nota_ingreso('".$dt['N°Nota']."','".$dt['Cod_Producto']."',".$dt['Cant_Producto'].",".$dt['Importe'].");";
        return $this->db->query($sql,$dt);
    }
    public function deleteProd($dt) //Precio de un producto
    {
        $sql = "call eli_produ_nota_ingreso('".$dt['nro']."','".$dt['codprod']."');";
        return $this->db->query($sql,$dt);
    }
    public function getListProd() //Listado de todos los Productos
    {
        $l = $this->db->query("call getListProd()")->getResultArray();
        $l2 = [];
        foreach ($l as $k => $prove) {
            $l2[$prove["cod"]] = $prove["pre"];
        }
        return $l2;
    }

    public function getInf($num)//Obtener el informe correspondiente
    {
        $dt = [];
        $lq = 
        [
            "SELECT * FROM nota_ingreso WHERE Tip_Doc_Origen LIKE 'Devol%'",
            "SELECT ni.*, pni.cant_producto * pr.precio_unitario AS 'Monto Total' FROM nota_ingreso ni
                INNER JOIN producto_nota_ingreso pni on pni.N°Nota=ni.N°Nota
                JOIN Producto pr on pr.Cod_Producto=pni.Cod_Producto
                WHERE ni.Dia= 10 AND ni.Mes=10 AND ni.Año=2021;",
            "Select p.cod_producto, datediff(fecha_vencimiento,curdate()) as F ,
                pg.cant_producto as 'Cantidad Guia', round(pg.cant_producto * p.precio_unitario,2) as 'Monto Perdido Guía',
                po.cant_producto as 'Cantidad Orden', round(po.cant_producto * p.precio_unitario,2) as 'Monto Perdido Orden'
                from Producto p
                LEFT JOIN producto_guia_devolucion pg on pg.cod_producto=p.cod_producto
                LEFT JOIN producto_orden_compra po on po.cod_producto=p.cod_producto;",
            "SELECT o.N°Orden_Compra, o.RUC_Prove, p.nom_prove, p.direc_prove FROM orden_compra o JOIN proveedor  p on p.RUC_prove=o.RUC_prove;",
            "SELECT Cod_Producto, Precio_unitario, ROUND((Precio_unitario*1.2),2) AS 'Precio Comercial' FROM Producto WHERE N°Orden_Compra IS NOT NULL;",
            "SELECT p.* FROM sismed.orden_compra o JOIN Producto_orden_compra p on p.N°Orden_Compra=o.N°Orden_Compra WHERE N°Nota IS NULL;",
            "SELECT ni.*, p.Cod_Producto  FROM nota_ingreso ni JOIN producto_Nota_ingreso p on p.N°Nota=ni.N°Nota WHERE Tip_Doc_Origen LIKE 'Dona%';",
            "SELECT ni.*, oc.N°Orden_Compra, pni.Cod_Producto, pr.descripcion FROM nota_ingreso ni
                INNER JOIN orden_compra oc on oc.N°Nota=ni.N°Nota
                INNER JOIN producto_nota_ingreso pni on pni.N°Nota=ni.N°Nota
                INNER JOIN Producto pr on pr.Cod_Producto=pni.Cod_Producto
                WHERE ni.Dia= DAY(CURDATE()) AND ni.Mes=MONTH(CURDATE()) AND ni.Año=YEAR(CURDATE());",
            "SELECT gd.*, p.Nom_producto FROM guia_devolucion  gd
                JOIN Establecimiento e on gd.Cod_Establecimiento=e.Codigo_EBL
                JOIN Producto p on p.Codigo_EBL=e.Codigo_EBL 
                JOIN producto_nota_ingreso pni on p.cod_Producto=pni.Cod_Producto 
                JOIN nota_ingreso ni on pni.N°Nota=ni.N°Nota
                WHERE ni.MES=MONTH(curdate());",
            "SELECT p.Cod_Producto, p.Precio_unitario, ni.* FROM Producto p JOIN nota_ingreso ni;",
        ];
        $dt['dt'] = $this->db->query($lq[$num])->getResultArray();

        $lcols = 
        [
            ["N°Nota","Tip_Doc_Origen","Proveedor","Nro_Doc_Origen","Mes","Año","Dia","Hora"],
            ["N°Nota","Tip_Doc_Origen","Proveedor","Nro_Doc_Origen","Mes","Año","Dia","Hora","cant_producto","Monto Total"],
            ["cod_producto","F","Cantidad Guia","Monto Perdido Guía","Cantidad Orden","Monto Perdido Orden"],
            ["N°Orden_Compra","RUC_Prove","nom_prove","direc_prove"],
            ["Cod_Producto","Precio_unitario","Precio Comercial"],
            ["N°Orden_Compra","Cod_Producto","Cant_Producto","Precio_Total"],
            ["N°Nota","Tip_Doc_Origen","Proveedor","Nro_Doc_Origen","Mes","Año","Dia","Hora","Cod_Producto"],
            ["N°Nota","Tip_Doc_Origen","Proveedor","Nro_Doc_Origen","Mes","Año","Dia","Hora","N°Orden_Compra","Cod_Producto","descripcion"],
            ["N°GuiaD","N°Nota","Cod_Establecimiento","Encargado","Concepto","Nom_producto"],
            ["Cod_Producto","Precio_unitario","N°Nota","Tip_Doc_Origen","Proveedor","Nro_Doc_Origen","Mes","Año","Dia","Hora"],
        ];
        $dt['cols'] = $lcols[$num];
        return $dt;
    }
}

/*

//1
SELECT * FROM nota_ingreso WHERE Tip_Doc_Origen LIKE 'Devol%';

//2
SELECT ni.*, pni.cant_producto * pr.precio_unitario AS 'Monto Total' FROM nota_ingreso ni
    INNER JOIN producto_nota_ingreso pni on pni.N°Nota=ni.N°Nota
    JOIN Producto pr on pr.Cod_Producto=pni.Cod_Producto
    WHERE Dia= DAY(CURDATE()) AND Mes=MONTH(CURDATE()) AND Año=YEAR(CURDATE());
//3
SELECT ni.*, pni.cant_producto * pr.precio_unitario AS 'Monto Total' FROM nota_ingreso ni
    INNER JOIN producto_nota_ingreso pni on pni.N°Nota=ni.N°Nota
    JOIN Producto pr on pr.Cod_Producto=pni.Cod_Producto
    WHERE ni.Dia= 10 AND ni.Mes=1 AND ni.Año=2021;

//4
Select p.cod_producto, datediff(fecha_vencimiento,curdate()) as F , 
        pg.cant_producto as 'Cantidad Guia', round(pg.cant_producto * p.precio_unitario,2) as 'Monto Perdido Guía',
        po.cant_producto as 'Cantidad Orden', round(po.cant_producto * p.precio_unitario,2) as 'Monto Perdido Orden'
    from Producto p 
        LEFT JOIN producto_guia_devolucion pg on pg.cod_producto=p.cod_producto 
        LEFT JOIN producto_orden_compra po on po.cod_producto=p.cod_producto;

//5
SELECT o.N°Orden_Compra, o.RUC_Prove, p.nom_prove, p.direc_prove FROM orden_compra o JOIN proveedor  p on p.RUC_prove=o.RUC_prove;

//6
SELECT Cod_Producto, Precio_unitario, ROUND((Precio_unitario*1.2),2) AS 'Precio Comercial' FROM Producto WHERE N°Orden_Compra IS NOT NULL;

//7
SELECT p.* FROM sismed.orden_compra o JOIN Producto_orden_compra p on p.N°Orden_Compra=o.N°Orden_Compra WHERE N°Nota IS NULL;

//8
SELECT ni.*, p.Cod_Producto  FROM nota_ingreso ni JOIN producto_Nota_ingreso p on p.N°Nota=ni.N°Nota WHERE Tip_Doc_Origen LIKE 'Dona%';

//9
SELECT ni.*, oc.N°Orden_Compra, pni.Cod_Producto, pr.descripcion FROM nota_ingreso ni
    INNER JOIN orden_compra oc on oc.N°Nota=ni.N°Nota
    INNER JOIN producto_nota_ingreso pni on pni.N°Nota=ni.N°Nota
    INNER JOIN Producto pr on pr.Cod_Producto=pni.Cod_Producto
    WHERE ni.Dia= DAY(CURDATE()) AND ni.Mes=MONTH(CURDATE()) AND ni.Año=YEAR(CURDATE());
//10
SELECT gd.*, p.Nom_producto FROM guia_devolucion  gd
    JOIN Establecimiento e on gd.Cod_Establecimiento=e.Codigo_EBL
    JOIN Producto p on p.Codigo_EBL=e.Codigo_EBL 
    JOIN producto_nota_ingreso pni on p.cod_Producto=pni.Cod_Producto 
    JOIN nota_ingreso ni on pni.N°Nota=ni.N°Nota
    WHERE ni.MES=MONTH(curdate()); 

//11
SELECT p.Cod_Producto, p.Precio_unitario, ni.* FROM Producto p JOIN nota_ingreso ni;

*/
