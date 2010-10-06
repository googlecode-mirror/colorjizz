
brightness : function (brightnessModifier){
  var a = this.toHSV();
  a.v += (brightnessModifier/100);
  a.v = Math.min(1,Math.max(0,a.v));
  return a[this.toSelf]();
}