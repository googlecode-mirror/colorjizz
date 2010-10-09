<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class CMYTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new CMY(0.2, 1, 1);
      $this->colors["green"] = new CMY(1,  0.2,  1);
      $this->colors["blue"] = new CMY(1, 1, 0.2);
      $this->colors["white"] = new CMY(0, 0, 0);
      $this->colors["darkpurple"] = new CMY(0.74510,  0.91373,  0.57255);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toCMY()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toCMY()->toString());
      }
     }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toCMY()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toCMY()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toCMY()->toString());
      }
    }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toCMY()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toCMY()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toCMY()->toString());
      }
    }
}
$test = new CMYTest();
$test->run(new HtmlReporter());
?>