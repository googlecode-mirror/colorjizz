package Tests 
{
	import asunit.framework.TestCase;
	import ColorJizz.Hex;
	import ColorJizz.RGB;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class RGBConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function RGBConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new RGB(204, 0, 0);
			colors["green"] = new RGB(0, 204, 0);
			colors["blue"] = new RGB(0, 0, 204);
			colors["white"] = new RGB(255, 255, 255);
			colors["darkpurple"] = new RGB(65, 22, 109);
   		}
		protected override function tearDown():void {
   		}
		public function convertToHex():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> Hex -> RGB",  color.toString(), color.toHex().toRGB().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> HSV -> RGB",  color.toString(), color.toHSV().toRGB().toString());
			}
   		}
		public function convertToXYZ():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> XYZ -> RGB",  color.toString(), color.toXYZ().toRGB().toString());
			}
   		}
		public function convertToYxy():void
		{
   			for each (var color:RGB in colors) {
				assertEquals("RGB -> Yxy -> RGB",  color.toString(), color.toYxy().toRGB().toString());
			}
		}
		public function convertToCMY():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> CMY -> RGB",  color.toString(), color.toCMY().toRGB().toString());
			}
		}
		public function convertToCMYK():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> CMYK -> RGB",  color.toString(), color.toCMYK().toRGB().toString());
			}
		}
		public function convertToCIELab():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> CIELab -> RGB",  color.toString(), color.toCIELab().toRGB().toString());
			}
		}
		public function convertToCIELCh():void
		{
			for each (var color:RGB in colors) {
				assertEquals("RGB -> CIELCh -> RGB",  color.toString(), color.toCIELCh().toRGB().toString());
			}
		}		
	}

}