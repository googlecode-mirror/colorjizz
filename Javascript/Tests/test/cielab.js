module("CIELab", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new CIELab(42.517,   67.710,   56.816);
    this.colors["green"] = new CIELab(71.681,  -72.845,   70.307);
    this.colors["blue"] = new CIELab(24.826,   66.939,  -91.169);
    this.colors["white"] = new CIELab(100.000,    0.005,   -0.010);
    this.colors["darkpurple"] = new CIELab(19.232,   38.282,  -41.933);
  }
});


test("CIELab -> RGB -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toCIELab().toString(), "CIELab -> RGB -> CIELab - ("+color+")");
    }
});

test("CIELab -> HSV -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toCIELab().toString(), "CIELab -> HSV -> CIELab - ("+color+")");
    }
});

test("CIELab -> Hex -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toCIELab().toString(), "CIELab -> Hex -> CIELab - ("+color+")");
    }
});

test("CIELab -> CMY -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toCIELab().toString(), "CIELab -> CMY -> CIELab - ("+color+")");
    }
});

test("CIELab -> CMYK -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toCIELab().toString(), "CIELab -> CMYK -> CIELab - ("+color+")");
    }
});

test("CIELab -> XYZ -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toCIELab().toString(), "CIELab -> XYZ -> CIELab - ("+color+")");
    }
});

test("CIELab -> Yxy -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toCIELab().toString(), "CIELab -> Yxy -> CIELab - ("+color+")");
    }
});

test("CIELab -> CIELCh -> CIELab", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toCIELab().toString(), "CIELab -> CIELCh -> CIELab - ("+color+")");
    }
});
