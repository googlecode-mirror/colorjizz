module("CMYK", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new CMYK(0, 1, 1, 0.2);
    this.colors["green"] = new CMYK(1, 0, 1, 0.2);
    this.colors["blue"] = new CMYK(1, 1, 0, 0.2);
    this.colors["white"] = new CMYK(0, 0, 0, 0);
    this.colors["darkpurple"] = new CMYK(0.40367, 0.79817, 0, 0.57255);
  }
});



test("CMYK -> RGB -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toCMYK().toString(), "CMYK -> RGB -> CMYK - ("+color+")");
    }
});

test("CMYK -> HSV -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toCMYK().toString(), "CMYK -> HSV -> CMYK - ("+color+")");
    }
});


test("CMYK -> CMY -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toCMYK().toString(), "CMYK -> CMY -> CMYK - ("+color+")");
    }
});

test("CMYK -> Hex -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toCMYK().toString(), "CMYK -> Hex -> CMYK - ("+color+")");
    }
});


test("CMYK -> CIELab -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toCMYK().toString(), "CMYK -> CIELab -> CMYK - ("+color+")");
    }
});

test("CMYK -> XYZ -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toCMYK().toString(), "CMYK -> XYZ -> CMYK - ("+color+")");
    }
});

test("CMYK -> Yxy -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toCMYK().toString(), "CIELab -> Yxy -> CIELab - ("+color+")");
    }
});

test("CMYK -> CIELCh -> CMYK", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toCMYK().toString(), "CMYK -> CIELCh -> CMYK - ("+color+")");
    }
});