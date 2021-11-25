<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Migrfm01 extends Migration
{
    public function up()
    {
        // tusuarios
		$this->forge->addField([
			'IdNota'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'auto_increment' => true,
			],
			'IdUsu'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
			],
			'FcreFm01'          => [
				'type'           => 'datetime',
				'null'       => true,
			],
			'NroNota'          => [
				'type'           => 'varchar',
				'constraint'     => 12,	
				'comment' => 'Nro Nota de Ingreso'
			],
			'PeriodoNota'          => [
				'type'           => 'varchar',
				'constraint'     => 4,	
				'comment' => 'Año Nota de Ingreso'
			],
			'FregNota'          => [
				'type'           => 'datetime',
				'comment' => 'Fecha de Registro Nota de Ingreso'
			],
			'IdAlmo'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Id Almacen Origen'
			],
			'IdAlmd'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Id Almacen Destino'
			],
			'IdAlmvo'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Id Almacen Virtual Origen'
			],
			'IdAlmvd'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Id Almacen Virtual Destino'
			],
			'ConcNota'          => [
				'type'           => 'TINYINT',
				'constraint'     => 2,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Concepto: Compra,etc'
			],
			'TipodocNota'          => [
				'type'           => 'TINYINT',
				'constraint'     => 2,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Tipo documento: Pedido Provisional,etc'
			],
			'DocoNota'          => [
				'type'           => 'TINYINT',
				'constraint'     => 2,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Documento Origen: Orden Compra'
			],
			'IdPpa'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Id PPA'
			],
			'IdOc'          => [
				'type'           => 'INT',
				'constraint'     => 11,	
				'unsigned'       => true,
				'null'       => true,
				'comment' => 'Id Orden de Compra'
			],
			'FrecNota'          => [
				'type'           => 'datetime',
				'comment' => 'Fecha de Recepción'
			],
			'FdocNota'          => [
				'type'           => 'datetime',
				'comment' => 'Fecha de Documento Origen'
			],
			'IdProv'          => [
				'type'           => 'varchar',
				'constraint'     => 12,	
				'null'       => true,
				'comment' => 'Id Proveedor'
			],
			'RefNota'          => [
				'type'           => 'varchar',
				'constraint'     => 100,	
				'null'       => true,
				'comment' => 'Referencia'
			], //Faltan más Datos, tablas relacionadas y el Detalle nota
		]);
		$this->forge->addKey('IdNota', true);
		// $this->forge->addForeignKey('IdUsu','usuarios','IdUsu');
		$this->forge->createTable('notas',true);
    }

    public function down()
    {
        $this->forge->dropTable('fm01',true);
    }
}
