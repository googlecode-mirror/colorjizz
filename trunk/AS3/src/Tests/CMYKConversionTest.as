package Tests
{
	import asunit.framework.TestCase;
	import ColorJizz.CMYK;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class CMYKConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function CMYKConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new CMYK(0, 1, 1, 0.2);
			colors["green"] = new CMYK(1, 0, 1, 0.2);
			colors["blue"] = new CMYK(1, 1, 0, 0.2);
			colors["white"] = new CMYK(0, 0, 0, 0);
			colors["darkpurple"] = new CMYK(0.40367, 0.79817, 0, 0.57255);
			
   		}
		protected override function tearDown():void {
   		}
		public function convertToRGB():void
		{
			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> RGB -> CMYK",  color.toString(), color.toRGB().toCMYK().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> HSV -> CMYK",  color.toString(), color.toHSV().toCMYK().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> Hex -> CMYK",  color.toString(), color.toHex().toCMYK().toString());
			}
   		}
		public function convertToCMY():void
		{
			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> CMY -> CMYK",  color.toString(), color.toCMY().toCMYK().toString());
			}
		}
		public function convertToCIELab():void
		{
 			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> CIELab -> CMYK",  color.toString(), color.toCIELab().toCMYK().toString());
			}
		}
		public function convertToXYZ():void
		{
   			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> XYZ -> CMYK",  color.toString(), color.toXYZ().toCMYK().toString());
			}
		}
		public function convertToYxy():void
		{
   			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> Yxy -> CMYK",  color.toString(), color.toYxy().toCMYK().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:CMYK in colors) {
				assertEquals("CMYK -> CIELCh -> CMYK",  color.toString(), color.toCIELCh().toCMYK().toString());
			}
		}		
	}

}