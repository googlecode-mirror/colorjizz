<?php

require_once("../ColorJizz.php");


$h = new Hex(0xCC0000);

var_dump($h->toRGB()->toHex()->toRGB());

?>