
range : function (destinationColor, steps,include){
  if (include == null) include = false;
  var a = this.toRGB();
  var b = destinationColor.toRGB();
  var colors = [];
  steps--;
  for (n = 1; n < steps;n++){
    var nr = Math.floor(a.r+(n*(b.r-a.r)/steps));
    var ng = Math.floor(a.g+(n*(b.g-a.g)/steps));
    var nb = Math.floor(a.b+(n*(b.b-a.b)/steps));
    colors.push(new RGB(nr,ng,nb)[this.toSelf]());
  }
  if (include) {
    colors.unshift(this);
    colors.push(destinationColor[this.toSelf]());
  }
  return colors;
}