<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');
require_once('../ColorJizz.php');

class CIELabTest extends UnitTestCase {
    function setUp() {
      $this->colors = array();
      $this->colors["red"] = new CIELab(42.517,   67.710,   56.816);
      $this->colors["green"] = new CIELab(71.681,  -72.845,   70.307);
      $this->colors["blue"] = new CIELab(24.826,   66.939,  -91.169);
      $this->colors["white"] = new CIELab(100.000,    0.005,   -0.010);
      $this->colors["darkpurple"] = new CIELab(19.232,   38.282,  -41.933);
    }
    function testConvertToHex()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHex()->toCIELab()->toString());
      }
    }
    function testConvertToRGB()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toRGB()->toCIELab()->toString());
      }
     }
    function testConvertToCMYK()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMYK()->toCIELab()->toString());
      }
    }

    function testConvertToYxy()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toYxy()->toCIELab()->toString());
      }
    }
    function testConvertToHSV()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toHSV()->toCIELab()->toString());
      }
    }
    function testConvertToCMY()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCMY()->toCIELab()->toString());
      }
    }
    function testConvertToXYZ()
    {
      foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toXYZ()->toCIELab()->toString());
      }
    }
    function testConvertToCIELCh()
    {
        foreach ($this->colors as $color) {
        $this->assertEqual($color->toString(), $color->toCIELCh()->toCIELab()->toString());
      }
    }
}
$test = new CIELabTest();
$test->run(new HtmlReporter());
?>