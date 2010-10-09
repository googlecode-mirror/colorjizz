module("XYZ", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new XYZ(24.902,12.837,1.165);
    this.colors["green"] = new XYZ(21.593, 43.186, 7.198);
    this.colors["blue"] = new XYZ(10.899, 4.360, 57.394);
    this.colors["white"] = new XYZ(95.050, 100.000, 108.900);
    this.colors["darkpurple"] = new XYZ(5.227, 2.802, 14.733);
  }
});


test("XYZ -> RGB -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toXYZ().toString(), "XYZ -> RGB -> XYZ - ("+color+")");
    }
});

test("XYZ -> HSV -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toXYZ().toString(), "XYZ -> HSV -> XYZ - ("+color+")");
    }
});

test("XYZ -> CIELab -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toXYZ().toString(), "XYZ -> CIELab -> XYZ - ("+color+")");
    }
});

test("XYZ -> CMY -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toXYZ().toString(), "XYZ -> CMY -> XYZ - ("+color+")");
    }
});

test("XYZ -> CMYK -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toXYZ().toString(), "XYZ -> CMYK -> XYZ - ("+color+")");
    }
});

test("XYZ -> Hex -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toXYZ().toString(), "XYZ -> Hex -> XYZ - ("+color+")");
    }
});

test("XYZ -> Yxy -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toXYZ().toString(), "XYZ -> Yxy -> XYZ - ("+color+")");
    }
});

test("XYZ -> CIELCh -> XYZ", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toXYZ().toString(), "XYZ -> CIELCh -> XYZ - ("+color+")");
    }
});
