
equal : function(parts, include){
  if (include == null) include = false;
  if (parts < 2) parts = 2;
  var current = this.toCIELCh();
  var distance = 360/parts;
  var palette = [];
  if (include) palette.push(this);
  for (var i=1; i < parts; i++){
    palette.push(new CIELCh(current.l, current.c,current.h+(distance*i))[this.toSelf]());
  }

  return palette;
}