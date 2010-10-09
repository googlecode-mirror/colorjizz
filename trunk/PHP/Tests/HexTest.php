<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class HexTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new Hex(0xCC0000);
      $this->colors["green"] = new Hex(0x00CC00);
      $this->colors["blue"] = new Hex(0x0000CC);
      $this->colors["white"] = new Hex(0xFFFFFF);
      $this->colors["darkpurple"] = new Hex(0x41166d);
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toHex()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toHex()->toString());
      }
     }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toHex()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toHex()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toHex()->toString());
      }
    }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toHex()->toString());
      }
    }
    function testConvertToCIELab()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELab()->toHex()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toHex()->toString());
      }
    }
}
$test = new HexTest();
$test->run(new HtmlReporter());
?>