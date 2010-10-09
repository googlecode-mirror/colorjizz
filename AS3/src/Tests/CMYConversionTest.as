package Tests
{
	import asunit.framework.TestCase;
	import ColorJizz.CMY;
	import ColorJizz.CMYK;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class CMYConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function CMYConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new CMY(0.2, 1, 1);
			colors["green"] = new CMY(1,  0.2,  1);
			colors["blue"] = new CMY(1, 1, 0.2);
			colors["white"] = new CMY(0, 0, 0);
			colors["darkpurple"] = new CMY(0.74510,  0.91373,  0.57255);
			
   		}
		protected override function tearDown():void {
   		}
		public function convertToRGB():void
		{
			for each (var color:CMY in colors) {
				assertEquals("CMY -> RGB -> CMY",  color.toString(), color.toRGB().toCMY().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:CMY in colors) {
				assertEquals("CMY -> HSV -> CMY",  color.toString(), color.toHSV().toCMY().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:CMY in colors) {
				assertEquals("CMY -> Hex -> CMY",  color.toString(), color.toHex().toCMY().toString());
			}
   		}
		public function convertToCMYK():void
		{
			for each (var color:CMY in colors) {
				assertEquals("CMY -> CMYK -> CMY",  color.toString(), color.toCMYK().toCMY().toString());
			}
		}
		public function convertToCIELab():void
		{
 			for each (var color:CMY in colors) {
				assertEquals("CMY -> CIELab -> CMY",  color.toString(), color.toCIELab().toCMY().toString());
			}
		}
		public function convertToXYZ():void
		{
   			for each (var color:CMY in colors) {
				assertEquals("CMY -> XYZ -> CMY",  color.toString(), color.toXYZ().toCMY().toString());
			}
		}
		public function convertToYxy():void
		{
   			for each (var color:CMY in colors) {
				assertEquals("CMY -> Yxy -> CMY",  color.toString(), color.toYxy().toCMY().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:CMY in colors) {
				assertEquals("CMY -> CIELCh -> CMY",  color.toString(), color.toCIELCh().toCMY().toString());
			}
		}		
	}

}