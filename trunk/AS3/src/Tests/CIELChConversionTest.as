package Tests
{
	import asunit.framework.TestCase;
	import ColorJizz.CIELCh;
	import ColorJizz.Yxy;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class CIELChConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function CIELChConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new CIELCh(42.517,   88.390,   40.000);
			colors["green"] = new CIELCh(71.681,  101.239,  136.016);
			colors["blue"] = new CIELCh(24.826,  113.104,  306.287);
			colors["white"] = new CIELCh(100.000,  0.012, 296.813);
			colors["darkpurple"] = new CIELCh(19.232,   56.779,  312.394);
   		}
		protected override function tearDown():void {
   		}
				
		public function convertToRGB():void
		{
			for each (var color:CIELCh in colors)
			{
				assertEquals("CIELCh -> RGB -> CIELCh",  color.toString(), color.toRGB().toCIELCh().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> HSV -> CIELCh",  color.toString(), color.toHSV().toCIELCh().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> Hex -> CIELCh",  color.toString(), color.toHex().toCIELCh().toString());
			}
   		}
		public function convertToCMY():void
		{
			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> CMY -> CIELCh",  color.toString(), color.toCMY().toCIELCh().toString());
			}
		}
		public function convertToCMYK():void
		{
 			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> CMYK -> CIELCh",  color.toString(), color.toCMYK().toCIELCh().toString());
			}
		}
		public function convertToXYZ():void
		{
   			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> XYZ -> CIELCh",  color.toString(), color.toXYZ().toCIELCh().toString());
			}
		}
		public function convertToYxy():void
		{
   			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> Yxy -> CIELCh",  color.toString(), color.toYxy().toCIELCh().toString());
			}
		}
		public function convertToCIELab():void
		{
   			for each (var color:CIELCh in colors) {
				assertEquals("CIELCh -> CIELab -> CIELCh",  color.toString(), color.toCIELab().toCIELCh().toString());
			}
		}		
	}

}