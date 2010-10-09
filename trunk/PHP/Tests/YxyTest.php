<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class YxyTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new Yxy(12.837,  0.64007,  0.32997);
      $this->colors["green"] = new Yxy(43.186,  0.30000,  0.60000);
      $this->colors["blue"] = new Yxy(4.360,  0.15002,  0.06001);
      $this->colors["white"] = new Yxy(100.000, 0.31272, 0.32900);
      $this->colors["darkpurple"] = new Yxy(2.802, 0.22964, 0.12309);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toYxy()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toYxy()->toString());
      }
     }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toYxy()->toString());
      }
    }

    function testConvertToCIELCh()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toYxy()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toYxy()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toYxy()->toString());
      }
    }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toYxy()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toYxy()->toString());
      }
    }
}
$test = new YxyTest();
$test->run(new HtmlReporter());
?>