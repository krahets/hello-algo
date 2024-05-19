<?php

/**
 * File: Vertex.php
 * Created Time: 2024-05-19
 * Author: DoWake (admin@mengxing.cc)
 */

/* 顶点类 */
class Vertex
{
  public $val;

  /* 构造方法 */
  public function __construct($val)
  {
    $this->val = $val;
  }

  /* 输入值列表 vals ，返回顶点列表 vets */
  public static function valsToVets($vals)
  {
    $vets = [];
    foreach ($vals as $val) {
      $vets[] = new Vertex($val);
    }
    return $vets;
  }

  /* 输入顶点列表 vets ，返回值列表 vals */
  public static function vetsToVals($vets)
  {
    $vals = [];
    foreach ($vets as $vet) {
      $vals[] = $vet->val;
    }
    return $vals;
  }
}
