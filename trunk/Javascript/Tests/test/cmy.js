module("CMY", {
  setup: function() {
    this.colors = {};
    this.colors["red"] = new CMY(0.2, 1, 1);
    this.colors["green"] = new CMY(1,  0.2,  1);
    this.colors["blue"] = new CMY(1, 1, 0.2);
    this.colors["white"] = new CMY(0, 0, 0);
    this.colors["darkpurple"] = new CMY(0.74510,  0.91373,  0.57255);
  }
});

test("CMY -> RGB -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toRGB().toCMY().toString(), "CMY -> RGB -> CMY - ("+color+")");
    }
});

test("CMY -> HSV -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHSV().toCMY().toString(), "CMY -> HSV -> CMY - ("+color+")");
    }
});


test("CMY -> CMYK -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCMYK().toCMY().toString(), "CMY -> CMYK -> CMY - ("+color+")");
    }
});

test("CMY -> Hex -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toHex().toCMY().toString(), "CMY -> Hex -> CMY - ("+color+")");
    }
});


test("CMY -> CIELab -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELab().toCMY().toString(), "CMY -> CIELab -> CMY - ("+color+")");
    }
});

test("CMY -> XYZ -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toXYZ().toCMY().toString(), "CMY -> XYZ -> CMY - ("+color+")");
    }
});

test("CMY -> Yxy -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toYxy().toCMY().toString(), "CIELab -> Yxy -> CIELab - ("+color+")");
    }
});

test("CMY -> CIELCh -> CMY", function () {
    for (color in this.colors){
      var c = this.colors[color];
      equals(c.toString(), c.toCIELCh().toCMY().toString(), "CMY -> CIELCh -> CMY - ("+color+")");
    }
});