
greyscale : function (){
  var a = this.toRGB();
  var ds = (Math.max(a.r,a.g,a.b) + Math.min(a.r,a.g,a.b))/2;
  return new RGB(ds,ds,ds)[this.toSelf]();
}