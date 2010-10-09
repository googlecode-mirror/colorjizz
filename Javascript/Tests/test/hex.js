module("Hex", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new Hex(0xCC0000);
    this.colors["green"] = new Hex(0x00CC00);
    this.colors["blue"] = new Hex(0x0000CC);
    this.colors["white"] = new Hex(0xFFFFFF);
    this.colors["darkpurple"] = new Hex(0x41166d);
  }
});


test("Hex -> RGB -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toHex().toString(), "Hex -> RGB -> Hex - ("+color+")");
    }
});

test("Hex -> HSV -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toHex().toString(), "Hex -> HSV -> Hex - ("+color+")");
    }
});

test("Hex -> CIELab -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toHex().toString(), "Hex -> CIELab -> Hex - ("+color+")");
    }
});

test("Hex -> CMY -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMY().toHex().toString(), "Hex -> CMY -> Hex - ("+color+")");
    }
});

test("Hex -> CMYK -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toHex().toString(), "Hex -> CMYK -> Hex - ("+color+")");
    }
});

test("Hex -> XYZ -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toHex().toString(), "Hex -> XYZ -> Hex - ("+color+")");
    }
});

test("Hex -> Yxy -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toHex().toString(), "Hex -> Yxy -> Hex - ("+color+")");
    }
});

test("Hex -> CIELCh -> Hex", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toHex().toString(), "Hex -> CIELCh -> Hex - ("+color+")");
    }
});
