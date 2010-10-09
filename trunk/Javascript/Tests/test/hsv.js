module("HSV", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new HSV(0, 100, 80);
    this.colors["green"] = new HSV(120, 100, 80);
    this.colors["blue"] = new HSV(240, 100, 80);
    this.colors["white"] = new HSV(0, 0, 100);
    this.colors["darkpurple"] = new HSV(270,80,43);
  }
});



test("HSV -> RGB -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toHSV().toString(), "HSV -> RGB -> HSV - ("+color+")");
    }
});

test("HSV -> XYZ -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toHSV().toString(), "HSV -> XYZ -> HSV - ("+color+")");
    }
});


test("HSV -> CIELab -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toHSV().toString(), "HSV -> CIELab -> HSV - ("+color+")");
    }
});

test("HSV -> CMY -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toHSV().toString(), "HSV -> CMY -> HSV - ("+color+")");
    }
});

test("HSV -> CMYK -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toHSV().toString(), "HSV -> CMYK -> HSV - ("+color+")");
    }
});

test("HSV -> XYZ -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toHSV().toString(), "HSV -> XYZ -> HSV - ("+color+")");
    }
});

test("HSV -> Yxy -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toHSV().toString(), "HSV -> Yxy -> HSV - ("+color+")");
    }
});

test("HSV -> CIELCh -> HSV", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toHSV().toString(), "HSV -> CIELCh -> HSV - ("+color+")");
    }
});