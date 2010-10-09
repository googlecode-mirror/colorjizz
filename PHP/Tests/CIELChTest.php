<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class CIELChTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new CIELCh(42.517,   88.390,   40.000);
      $this->colors["green"] = new CIELCh(71.681,  101.239,  136.016);
      $this->colors["blue"] = new CIELCh(24.826,  113.104,  306.287);
      $this->colors["white"] = new CIELCh(100.000,  0.012, 296.813);
      $this->colors["darkpurple"] = new CIELCh(19.232,   56.779,  312.394);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toCIELCh()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toCIELCh()->toString());
      }
     }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toCIELCh()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toCIELCh()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toCIELCh()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toCIELCh()->toString());
      }
    }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toCIELCh()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toCIELCh()->toString());
      }
    }
}
$test = new CIELChTest();
$test->run(new HtmlReporter());
?>