
rectangle : function(sidelength,include){
  if (include == null) include = false;
  var side1 = sidelength;
  var side2 = (360-(sidelength*2))/2;
  var current = this.toCIELCh();
  var rtn = [
    new CIELCh(current.l, current.c,current.h+side1)[this.toSelf](),
    new CIELCh(current.l, current.c,current.h+side1+side2)[this.toSelf](),
    new CIELCh(current.l, current.c,current.h+side1+side2+side1)[this.toSelf]()
  ];
  if (include) rtn.unshift(this);
  return rtn;
}