/* Lets build upon Dean Edwards "Base" class, as it makes for good foundations for code like this */
/* http://dean.edwards.name/weblog/2006/03/base/ */
var Base = function() {
  if (arguments.length) {
    if (this == window) {
      Base.prototype.extend.call(arguments[0], arguments.callee.prototype);
    } else {
      this.extend(arguments[0]);
    }
  }
};
Base.version = "1.0.2";
Base.prototype = {
  extend: function(source, value) {
    var extend = Base.prototype.extend;
    if (arguments.length == 2) {
      var ancestor = this[source];
      if ((ancestor instanceof Function) && (value instanceof Function) &&
        ancestor.valueOf() != value.valueOf() && /\bbase\b/.test(value)) {
        var method = value;
        value = function() {
          var previous = this.base;
          this.base = ancestor;
          var returnValue = method.apply(this, arguments);
          this.base = previous;
          return returnValue;
        };
        value.valueOf = function() {
          return method;
        };
        value.toString = function() {
          return String(method);
        };
      }
      return this[source] = value;
    } else if (source) {
      var _prototype = {toSource: null};
      var _protected = ["toString", "valueOf"];
      if (Base._prototyping) _protected[2] = "constructor";
      for (var i = 0; (name = _protected[i]); i++) {
        if (source[name] != _prototype[name]) {
          extend.call(this, name, source[name]);
        }
      }
      for (var name in source) {
        if (!_prototype[name]) {
          extend.call(this, name, source[name]);
        }
      }
    }
    return this;
  },
  base: function() {
  }
};
Base.extend = function(_instance, _static) {
  var extend = Base.prototype.extend;
  if (!_instance) _instance = {};
  Base._prototyping = true;
  var _prototype = new this;
  extend.call(_prototype, _instance);
  var constructor = _prototype.constructor;
  _prototype.constructor = this;
  delete Base._prototyping;
  var klass = function() {
    if (!Base._prototyping) constructor.apply(this, arguments);
    this.constructor = klass;
  };
  klass.prototype = _prototype;
  klass.extend = this.extend;
  klass.implement = this.implement;
  klass.toString = function() {
    return String(constructor);
  };
  extend.call(klass, _static);
  var object = constructor ? klass : _prototype;
  if (object.init instanceof Function) object.init();
  return object;
};
Base.implement = function(_interface) {
  if (_interface instanceof Function) _interface = _interface.prototype;
  this.prototype.extend(_interface);
};

var aColor = Base.extend({
<?php include("abstract/constructor/constructor.js"); ?>,
<?php include("abstract/toHex/toHex.js"); ?>,
<?php include("abstract/toRGB/toRGB.js"); ?>,
<?php include("abstract/toXYZ/toXYZ.js"); ?>,
<?php include("abstract/toCIELab/toCIELab.js"); ?>,
<?php include("abstract/toCIELCh/toCIELCh.js"); ?>,
<?php include("abstract/toCMY/toCMY.js"); ?>,
<?php include("abstract/toCMYK/toCMYK.js"); ?>,
<?php include("abstract/toHSV/toHSV.js"); ?>,
<?php include("abstract/distance/distance.js"); ?>,
<?php include("abstract/websafe/websafe.js"); ?>,
<?php include("abstract/match/match.js"); ?>,
<?php include("abstract/equal/equal.js"); ?>,
<?php include("abstract/split/split.js"); ?>,
<?php include("abstract/analogous/analogous.js"); ?>,
<?php include("abstract/rectangle/rectangle.js"); ?>,
<?php include("abstract/range/range.js"); ?>,
<?php include("abstract/greyscale/greyscale.js"); ?>,
<?php include("abstract/hue/hue.js"); ?>,
<?php include("abstract/saturation/saturation.js"); ?>,
<?php include("abstract/brightness/brightness.js"); ?>,
warn : function (){
  alert('aColor should not be created directly. Treat this as an abstract class.');
}
});