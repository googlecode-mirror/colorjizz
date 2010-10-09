module("Yxy", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new Yxy(12.837,  0.64007,  0.32997);
    this.colors["green"] = new Yxy(43.186,  0.30000,  0.60000);
    this.colors["blue"] = new Yxy(4.360,  0.15002,  0.06001);
    this.colors["white"] = new Yxy(100.000, 0.31272, 0.32900);
    this.colors["darkpurple"] = new Yxy(2.802, 0.22964, 0.12309);
  }
});


test("Yxy -> RGB -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toYxy().toString(), "Yxy -> RGB -> Yxy - ("+color+")");
    }
});

test("Yxy -> HSV -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toYxy().toString(), "Yxy -> HSV -> Yxy - ("+color+")");
    }
});

test("Yxy -> CIELab -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toYxy().toString(), "Yxy -> CIELab -> Yxy - ("+color+")");
    }
});

test("Yxy -> CMY -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toYxy().toString(), "Yxy -> CMY -> Yxy - ("+color+")");
    }
});

test("Yxy -> CMYK -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toYxy().toString(), "Yxy -> CMYK -> Yxy - ("+color+")");
    }
});

test("Yxy -> Hex -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toYxy().toString(), "Yxy -> Hex -> Yxy - ("+color+")");
    }
});

test("Yxy -> XYZ -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toYxy().toString(), "Yxy -> XYZ -> Yxy - ("+color+")");
    }
});

test("Yxy -> CIELCh -> Yxy", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toYxy().toString(), "Yxy -> CIELCh -> Yxy - ("+color+")");
    }
});
