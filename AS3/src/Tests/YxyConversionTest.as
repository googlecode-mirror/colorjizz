package Tests
{
	import asunit.framework.TestCase;
	import ColorJizz.XYZ;
	import ColorJizz.Yxy;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class YxyConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function YxyConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new Yxy(12.837,  0.64007,  0.32997);
			colors["green"] = new Yxy(43.186,  0.30000,  0.60000);
			colors["blue"] = new Yxy(4.360,  0.15002,  0.06001);
			colors["white"] = new Yxy(100.000, 0.31272, 0.32900);
			colors["darkpurple"] = new Yxy(2.802, 0.22964, 0.12309);
   		}
		protected override function tearDown():void {
   		}
		public function convertToRGB():void
		{
			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> RGB -> Yxy",  color.toString(), color.toRGB().toYxy().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> HSV -> Yxy",  color.toString(), color.toHSV().toYxy().toString());
			}
   		}
		public function convertToHex():void
		{
			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> Hex ->Yxy",  color.toString(), color.toHex().toYxy().toString());
			}
   		}
		public function convertToCMY():void
		{
			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> CMY -> Yxy",  color.toString(), color.toCMY().toYxy().toString());
			}
		}
		public function convertToXYZ():void
		{
			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> XYZ -> Yxy",  color.toString(), color.toXYZ().toYxy().toString());
			}
		}
		public function convertToCMYK():void
		{
 			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> CMYK -> Yxy",  color.toString(), color.toCMYK().toYxy().toString());
			}
		}
		public function convertToCIELab():void
		{
   			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> CIELab -> Yxy",  color.toString(), color.toCIELab().toYxy().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:Yxy in colors) {
				assertEquals("Yxy -> CIELCh -> Yxy",  color.toString(), color.toCIELCh().toYxy().toString());
			}
		}		
	}

}