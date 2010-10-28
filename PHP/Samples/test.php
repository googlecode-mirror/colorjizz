<?php

require_once("../ColorJizz.php");


$h = new RGB(254, 254, 254);

print_r($h->toHSV()->toRGB());

?>