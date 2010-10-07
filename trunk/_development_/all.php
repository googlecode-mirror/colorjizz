<?php
if (!empty($_POST)){
  foreach ($_POST as $key => $val){
    if (!empty($key) && !empty($val) && $key != "submit"){
      $file = str_replace("_", ".", $key);
      file_put_contents($file, $val);
    }
  }
}
?>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://tomdeater.com/jquery/equalize_columns/jquery.equalizecols.js"></script>
<script type="text/javascript">
$(function (){
  var colcount = $('.col:first *').length;
  for (var i=0; i<colcount; i++){
    $('.c'+i).equalizeCols();
  }
  $(".col *:not(.flerp)").each(function (){

    var self = $(this);
    var ta = $("<textarea name='"+self.attr("rel")+"'></textarea>");
    ta.height(self.height()+20).width(self.width());
    ta.html(self.html());
    $(this).html(ta);
    self.css("height", self.height()+20);



  });
});
</script>
<style type="text/css">
body {
    background-color: #eee;
    margin: 0;
    padding: 0;
}
  div.wrap {
    width: 10000px;
    overflow: hidden;
    zoom: 1;
  }
  pre {
    float: left;
    white-space: pre-wrap; /* CSS2.1 compliant */
    white-space: -moz-pre-wrap; /* Mozilla-based browsers */
    white-space: o-pre-wrap; /* Opera 7+ */
    border-right: 1px solid #000;
    font-size: 11px;
    margin: 0;
    padding: 0;
  }
  textarea {
    width: 100%;
    font-size: 11px;
    margin: 0;
    padding: 0;
  }
  pre div.flerp {
      display: block;
  }
  pre div.innc {
      display: block;
      color: #cc0000;
      background-color: #eee;
  }
  .submit {
     position: fixed;
     top: 0;
     left: 0;
  }
</style>
</head>
<body>
<div class="wrap">
<form action="" method="POST">
<?php
function includeForLanguage($template, $lang){
 $contents = file_get_contents($template);
 $parts = explode("||", $contents);
 echo "<pre class='col'>";
 for ($i=0; $i<sizeof($parts); $i++){
   if (!($i % 2)){
     echo "<div class='c".$i." flerp'>".htmlentities($parts[$i])."</div>";
   }else {
     $file = $parts[$i].".".$lang.".txt";
     echo "<div class='c".$i." innc' rel='".$file."'>";
     if (!file_exists($file)){
       file_put_contents($file, "");
     }
     echo htmlentities(file_get_contents($file));
     echo "</div>";
   }
 }
 echo "</pre>";
}
includeForLanguage("JS.template", "js");
includeForLanguage("AS.template", "as");
includeForLanguage("CS.template", "cs");
includeForLanguage("PHP.template", "php");
?>
</div>
<input type="submit" name="submit" value="submit" class="submit" />
</form>
</body>
</html>