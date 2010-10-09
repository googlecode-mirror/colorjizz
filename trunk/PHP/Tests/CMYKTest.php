<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class CMYKTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new CMYK(0, 1, 1, 0.2);
      $this->colors["green"] = new CMYK(1, 0, 1, 0.2);
      $this->colors["blue"] = new CMYK(1, 1, 0, 0.2);
      $this->colors["white"] = new CMYK(0, 0, 0, 0);
      $this->colors["darkpurple"] = new CMYK(0.40367, 0.79817, 0, 0.57255);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toCMYK()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toCMYK()->toString());
      }
     }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toCMYK()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toCMYK()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toCMYK()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toCMYK()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toCMYK()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toCMYK()->toString());
      }
    }
}
$test = new CMYKTest();
$test->run(new HtmlReporter());
?>