package Tests
{
	import asunit.framework.TestCase;
	import ColorJizz.XYZ;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class XYZConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function XYZConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new XYZ(24.902,12.837,1.165);
			colors["green"] = new XYZ(21.593, 43.186, 7.198);
			colors["blue"] = new XYZ(10.899, 4.360, 57.394);
			colors["white"] = new XYZ(95.050, 100.000, 108.900);
			colors["darkpurple"] = new XYZ(5.227, 2.802, 14.733);
   		}
		protected override function tearDown():void {
   		}
		public function convertToRGB():void
		{
			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> RGB -> XYZ",  color.toString(), color.toRGB().toXYZ().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> HSV -> XYZ",  color.toString(), color.toHSV().toXYZ().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> Hex ->XYZ",  color.toString(), color.toHex().toXYZ().toString());
			}
   		}
		public function convertToCMY():void
		{
			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> CMY -> XYZ",  color.toString(), color.toCMY().toXYZ().toString());
			}
		}
		public function convertToYxy():void
		{
   			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> Yxy -> XYZ",  color.toString(), color.toYxy().toXYZ().toString());
			}
		}
		public function convertToCMYK():void
		{
 			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> CMYK -> XYZ",  color.toString(), color.toCMYK().toXYZ().toString());
			}
		}
		public function convertToCIELab():void
		{
   			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> CIELab -> XYZ",  color.toString(), color.toCIELab().toXYZ().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:XYZ in colors) {
				assertEquals("XYZ -> CIELCh -> XYZ",  color.toString(), color.toCIELCh().toXYZ().toString());
			}
		}		
	}

}