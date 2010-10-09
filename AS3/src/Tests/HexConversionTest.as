package Tests 
{
	import asunit.framework.TestCase;
	import ColorJizz.Hex;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Mikee
	 */
	public class HexConversionTest extends TestCase 
	{
		private var colors:Dictionary = new Dictionary();
		public function HexConversionTest(testMethod:String) {
   			super(testMethod);
   		}
		protected override function setUp():void {
			colors["red"] = new Hex(0xCC0000);
			colors["green"] = new Hex(0x00CC00);
			colors["blue"] = new Hex(0x0000CC);
			colors["white"] = new Hex(0xFFFFFF);
			colors["darkpurple"] = new Hex(0x41166d);
   		}
		protected override function tearDown():void {
   		}
		public function convertToRGB():void
		{
			for each (var color:Hex in colors) {
				assertEquals("Hex -> RGB -> Hex",  color.toString(), color.toRGB().toHex().toString());
			}
   		}
		public function convertToHSV():void
		{
			for each (var color:Hex in colors) {
				assertEquals("Hex -> HSV -> Hex",  color.toString(), color.toHSV().toHex().toString());
			}
   		}
		public function convertToXYZ():void
		{
			for each (var color:Hex in colors) {
				assertEquals("Hex -> XYZ -> Hex",  color.toString(), color.toXYZ().toHex().toString());
			}
   		}
		
		public function convertToYxy():void
		{
   			for each (var color:Hex in colors) {
				assertEquals("Hex -> Yxy -> Hex",  color.toString(), color.toYxy().toHex().toString());
			}
		}
		public function convertToCMY():void
		{
			for each (var color:Hex in colors) {
				assertEquals("Hex -> CMY -> Hex",  color.toString(), color.toCMY().toHex().toString());
			}
		}
		public function convertToCMYK():void
		{
 			for each (var color:Hex in colors) {
				assertEquals("Hex -> CMYK -> Hex",  color.toString(), color.toCMYK().toHex().toString());
			}
		}
		public function convertToCIELab():void
		{
   			for each (var color:Hex in colors) {
				assertEquals("Hex -> CIELab -> Hex",  color.toString(), color.toCIELab().toHex().toString());
			}
		}
		public function convertToCIELCh():void
		{
   			for each (var color:Hex in colors) {
				assertEquals("Hex -> CIELCh -> Hex",  color.toString(), color.toCIELCh().toHex().toString());
			}
		}		
	}

}