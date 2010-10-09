<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class HSVTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new HSV(0, 100, 80);
      $this->colors["green"] = new HSV(120, 100, 80);
      $this->colors["blue"] = new HSV(240, 100, 80);
      $this->colors["white"] = new HSV(0, 0, 100);
      $this->colors["darkpurple"] = new HSV(270,80,43);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toHSV()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toHSV()->toString());
      }
     }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toHSV()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toHSV()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toHSV()->toString());
      }
    }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toHSV()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toHSV()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toHSV()->toString());
      }
    }
}
$test = new HSVTest();
$test->run(new HtmlReporter());
?>