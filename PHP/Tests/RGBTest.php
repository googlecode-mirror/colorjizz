<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class RGBTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new RGB(204, 0, 0);
      $this->colors["green"] = new RGB(0, 204, 0);
      $this->colors["blue"] = new RGB(0, 0, 204);
      $this->colors["white"] = new RGB(255, 255, 255);
      $this->colors["darkpurple"] = new RGB(65, 22, 109);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toRGB()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toRGB()->toString());
      }
     }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toRGB()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toRGB()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toRGB()->toString());
      }
    }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toRGB()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toRGB()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toRGB()->toString());
      }
    }
}
$test = new RGBTest();
$test->run(new HtmlReporter());
?>