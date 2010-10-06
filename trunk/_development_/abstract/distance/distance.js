
distance : function (destinationColor){
  var a = this.toCIELab();
  var b = destinationColor.toCIELab();
  return Math.sqrt(Math.pow((a.l - b.l),2)+Math.pow((a.a - b.a),2)+Math.pow((a.b-b.b),2));
}