package Tests
{
	import asunit.framework.TestCase;
	import ColorJizz.CIELab;
	import ColorJizz.Yxy;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class CIELabConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function CIELabConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new CIELab(42.517,   67.710,   56.816);
			colors["green"] = new CIELab(71.681,  -72.845,   70.307);
			colors["blue"] = new CIELab(24.826,   66.939,  -91.169);
			colors["white"] = new CIELab(100.000,    0.005,   -0.010);
			colors["darkpurple"] = new CIELab(19.232,   38.282,  -41.933);
			
   		}
		protected override function tearDown():void {
   		}
		
		private function checkMatch(one:CIELab, two:CIELab):Boolean
		{
			return (
				one.l == two.l &&
				one.a == two.a &&
				one.b == two.b
			);
		}
		
		public function convertToRGB():void
		{
			for each (var color:CIELab in colors)
			{
				assertEquals("CIELab -> RGB -> CIELab",  color.toString(), color.toRGB().toCIELab().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> HSV -> CIELab",  color.toString(), color.toHSV().toCIELab().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> Hex -> CIELab",  color.toString(), color.toHex().toCIELab().toString());
			}
   		}
		public function convertToCMY():void
		{
			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> CMY -> CIELab",  color.toString(), color.toCMY().toCIELab().toString());
			}
		}
		public function convertToCMYK():void
		{
 			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> CMYK -> CIELab",  color.toString(), color.toCMYK().toCIELab().toString());
			}
		}
		public function convertToXYZ():void
		{
   			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> XYZ -> CIELab",  color.toString(), color.toXYZ().toCIELab().toString());
			}
		}
		public function convertToYxy():void
		{
   			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> Yxy -> CIELab",  color.toString(), color.toYxy().toCIELab().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:CIELab in colors) {
				assertEquals("CIELab -> CIELCh -> CIELab",  color.toString(), color.toCIELCh().toCIELab().toString());
			}
		}		
	}

}