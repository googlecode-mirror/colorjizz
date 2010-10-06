
analogous : function(include){
  if (include == null) include = false;
  var current = this.toCIELCh();
  var distance = 30;
  var rtn = [
    new CIELCh(current.l, current.c,current.h+distance)[this.toSelf](),
    new CIELCh(current.l, current.c,current.h-distance)[this.toSelf]()
  ];
  if (include) rtn.unshift(this);
  return rtn;
}