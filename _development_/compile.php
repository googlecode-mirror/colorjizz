<?php
$contents = file_get_contents("JS.template");
$parts = explode("||", $contents);
$contents = "";
for ($i=0; $i<sizeof($parts); $i++){
   if (!($i % 2)){
     $contents .=  $parts[$i];
   }else {
     $file = $parts[$i].".js.txt";
     if (!file_exists($file)){
        file_put_contents($file, "");
      }
      $contents .= file_get_contents($file);
   }
}

echo $contents;
?>