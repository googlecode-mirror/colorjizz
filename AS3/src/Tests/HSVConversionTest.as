package Tests 
{
import asunit.framework.TestCase;
	import ColorJizz.HSV;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class HSVConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function HSVConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new HSV(0, 100, 80);
			colors["green"] = new HSV(120, 100, 80);
			colors["blue"] = new HSV(240, 100, 80);
			colors["white"] = new HSV(0, 0, 100);
			colors["darkpurple"] = new HSV(270,80,43);
   		}
		protected override function tearDown():void {
   		}
		public function convertToRGB():void
		{
			for each (var color:HSV in colors) {
				assertEquals("HSV -> RGB -> HSV",  color.toString(), color.toRGB().toHSV().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:HSV in colors) {
				assertEquals("HSV -> Hex -> HSV",  color.toString(), color.toHex().toHSV().toString());
			}
   		}
		public function convertToXYZ():void
		{
			for each (var color:HSV in colors) {
				assertEquals("HSV -> XYZ -> HSV",  color.toString(), color.toXYZ().toHSV().toString());
			}
   		}		
		public function convertToYxy():void
		{
   			for each (var color:HSV in colors) {
				assertEquals("HSV -> Yxy -> HSV",  color.toString(), color.toYxy().toHSV().toString());
			}
		}
		public function convertToCMY():void
		{
			for each (var color:HSV in colors) {
				assertEquals("HSV -> CMY -> HSV",  color.toString(), color.toCMY().toHSV().toString());
			}
		}
		public function convertToCMYK():void
		{
 			for each (var color:HSV in colors) {
				assertEquals("HSV -> CMYK -> HSV",  color.toString(), color.toCMYK().toHSV().toString());
			}
		}
		public function convertToCIELab():void
		{
   			for each (var color:HSV in colors) {
				assertEquals("HSV -> CIELab -> HSV",  color.toString(), color.toCIELab().toHSV().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:HSV in colors) {
				assertEquals("HSV -> CIELCh -> HSV",  color.toString(), color.toCIELCh().toHSV().toString());
			}
		}		
	}

}