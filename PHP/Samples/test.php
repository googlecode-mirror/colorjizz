<?php

require_once("../ColorJizz.php");


$h = new Hex(0x000000);
$g = new Hex(0x2491B5);
$range = $h->range($g, 10, TRUE);
foreach ($range as $col){
echo $col->toString()."<br />";
}

?>