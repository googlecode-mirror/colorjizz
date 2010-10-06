
match : function (palette){
  var distance = null;
  var closest = null;
  for (var i=0; i<palette.length; i++){
    var cdistance = this.distance(palette[i]);
    if (distance == null || distance > cdistance){
      distance = cdistance;
      closest = palette[i];
    }
  }
  return closest[this.toSelf]();
}