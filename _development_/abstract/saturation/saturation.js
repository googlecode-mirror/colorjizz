
saturation : function (satModifier){
  var a = this.toHSV();
  a.s += (satModifier/100);
  a.s = Math.min(1,Math.max(0,a.s));
  return a[this.toSelf]();
}