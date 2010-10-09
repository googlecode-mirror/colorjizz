module("CIELCh", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new CIELCh(42.517,   88.390,   40.000);
    this.colors["green"] = new CIELCh(71.681,  101.239,  136.016);
    this.colors["blue"] = new CIELCh(24.826,  113.104,  306.287);
    this.colors["white"] = new CIELCh(100.000,  0.012, 296.813);
    this.colors["darkpurple"] = new CIELCh(19.232,   56.779,  312.394);
  }
});


test("CIELCh -> RGB -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toCIELCh().toString(), "CIELCh -> RGB -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> HSV -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toCIELCh().toString(), "CIELCh -> HSV -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> Hex -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toCIELCh().toString(), "CIELCh -> Hex -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> CMY -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toCIELCh().toString(), "CIELCh -> CMY -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> CMYK -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toCIELCh().toString(), "CIELCh -> CMYK -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> XYZ -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toCIELCh().toString(), "CIELCh -> XYZ -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> Yxy -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toCIELCh().toString(), "CIELCh -> Yxy -> CIELCh - ("+color+")");
    }
});

test("CIELCh -> CIELab -> CIELCh", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toCIELCh().toString(), "CIELCh -> CIELab -> CIELCh - ("+color+")");
    }
});
