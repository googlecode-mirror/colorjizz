<?php
$lang = @$_GET["lang"];
$language= empty($lang) ? "js" :  strtolower($lang);


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

$classes = array(
  "AbstractColor",
  "Hex",
  "RGB",
  "HSV",
  "CMY",
  "CMYK",
  "XYZ",
  "CIELCh",
  "CIELab"
  );

switch($language){
  case "js":
    file_put_contents("../Javascript/ColorJizz.js", $contents);
    break;
  case "php":
    file_put_contents("../PHP/ColorJizz.php", $contents);
    break;
  case "as":
    $packages = explode("package ", $contents);
    for ($i=1; $i<sizeof($packages); $i++){
      $c = "package ".$packages[$i];
      file_put_contents("../AS3/src/ColorJizz/".$classes[$i-1].".as", $c);
    }
    break;
  case "cs":
    $x = explode("/*------------------*/", $contents);
    for ($i=0; $i<sizeof($x); $i++){
      file_put_contents("../C#/ColorJizz/".$classes[$i].".cs", $x[$i]);
    }
    break;

}

//echo $contents;
?>