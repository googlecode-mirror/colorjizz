module("RGB", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new RGB(204, 0, 0);
    this.colors["green"] = new RGB(0, 204, 0);
    this.colors["blue"] = new RGB(0, 0, 204);
    this.colors["white"] = new RGB(255, 255, 255);
    this.colors["darkpurple"] = new RGB(65, 22, 109);
  }
});

test("RGB -> HSV -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toRGB().toString(), "RGB -> HSV -> RGB - ("+color+")");
    }
});

test("RGB -> Hex -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toRGB().toString(), "RGB -> Hex -> RGB - ("+color+")");
    }
});


test("RGB -> CIELab -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toRGB().toString(), "RGB -> CIELab -> RGB - ("+color+")");
    }
});

test("RGB -> CMY -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toRGB().toString(), "RGB -> CMY -> RGB - ("+color+")");
    }
});

test("RGB -> CMYK -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toRGB().toString(), "RGB -> CMYK -> RGB - ("+color+")");
    }
});

test("RGB -> XYZ -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toRGB().toString(), "RGB -> XYZ -> RGB - ("+color+")");
    }
});

test("RGB -> Yxy -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toRGB().toString(), "RGB -> Yxy -> RGB - ("+color+")");
    }
});

test("RGB -> CIELCh -> RGB", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toRGB().toString(), "RGB -> CIELCh -> RGB - ("+color+")");
    }
});