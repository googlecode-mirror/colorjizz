<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class XYZTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new XYZ(24.902,12.837,1.165);
      $this->colors["green"] = new XYZ(21.593, 43.186, 7.198);
      $this->colors["blue"] = new XYZ(10.899, 4.360, 57.394);
      $this->colors["white"] = new XYZ(95.050, 100.000, 108.900);
      $this->colors["darkpurple"] = new XYZ(5.227, 2.802, 14.733);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toXYZ()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toXYZ()->toString());
      }
     }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toXYZ()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toXYZ()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toXYZ()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toXYZ()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toXYZ()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toXYZ()->toString());
      }
    }
}
$test = new XYZTest();
$test->run(new HtmlReporter());
?>