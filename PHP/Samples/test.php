<?php

require_once("../ColorJizz.php");


$h = new Hex(0xCC0000);

print_r($h->toRGB()->toYxy()->toRGB());

?>