
hue : function (degreeModifier){
  var a = this.toCIELCh();
  a.h += degreeModifier;
  return a[this.toSelf]();
}