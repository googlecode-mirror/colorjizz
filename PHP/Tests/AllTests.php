<?php
require_once('simpletest/unit_tester.php');
require_once('simpletest/reporter.php');

$test = new GroupTest('All tests');
$test->addTestFile('RGBTest.php');
$test->addTestFile('HexTest.php');
$test->addTestFile('HSVTest.php');
$test->addTestFile('CMYTest.php');
$test->addTestFile('CMYKTest.php');
$test->addTestFile('XYZTest.php');
$test->addTestFile('YxyTest.php');
$test->addTestFile('CIELabTest.php');
$test->addTestFile('CIELChTest.php');
$test->run(new HtmlReporter());
?>