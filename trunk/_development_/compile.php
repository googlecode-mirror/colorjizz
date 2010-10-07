<?php
$lang = @$_GET["lang"];
$language= empty($lang) ? "js" :  $lang;


$contents = file_get_contents(strtoupper($language).".template");
$parts = explode("||", $contents);
$contents = "";
for ($i=0; $i<sizeof($parts); $i++){
   if (!($i % 2)){
     $contents .=  $parts[$i];
   }else {
     $file = $parts[$i].".".$language.".txt";
     if (!file_exists($file)){
        file_put_contents($file, "");
      }
      $contents .= file_get_contents($file);
   }
}

echo $contents;
?>