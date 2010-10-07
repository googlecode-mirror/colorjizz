<?php

require_once("../ColorJizz.php");

$h = new Hex("#CC0000");

var_dump($h->toRGB()->toCIELab()->toHex());

?>