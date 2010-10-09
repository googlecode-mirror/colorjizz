package Tests
{
	import asunit.framework.TestSuite;
	import ColorJizz.Hex;
	
	/**
	 * ...
	 * @author Mikee
	 */
	public class AllTests extends TestSuite 
	{
		
		public function AllTests() 
		{
			super();
   			addTest(new HexConversionTest("convertToRGB"));
   			addTest(new HexConversionTest("convertToHSV"));
   			addTest(new HexConversionTest("convertToCMY"));
   			addTest(new HexConversionTest("convertToCMYK"));
   			addTest(new HexConversionTest("convertToXYZ"));
   			addTest(new HexConversionTest("convertToYxy"));
   			addTest(new HexConversionTest("convertToCIELab"));
   			addTest(new HexConversionTest("convertToCIELCh"));
			
			
   			addTest(new RGBConversionTest("convertToHex"));
   			addTest(new RGBConversionTest("convertToHSV"));
   			addTest(new RGBConversionTest("convertToCMY"));
   			addTest(new RGBConversionTest("convertToCMYK"));
   			addTest(new RGBConversionTest("convertToXYZ"));
   			addTest(new RGBConversionTest("convertToYxy"));
   			addTest(new RGBConversionTest("convertToCIELab"));
   			addTest(new RGBConversionTest("convertToCIELCh"));
			
			
   			addTest(new HSVConversionTest("convertToRGB"));
   			addTest(new HSVConversionTest("convertToHex"));
   			addTest(new HSVConversionTest("convertToCMY"));
   			addTest(new HSVConversionTest("convertToCMYK"));
   			addTest(new HSVConversionTest("convertToXYZ"));
   			addTest(new HSVConversionTest("convertToYxy"));
   			addTest(new HSVConversionTest("convertToCIELab"));
   			addTest(new HSVConversionTest("convertToCIELCh"));		
			
			
   			addTest(new XYZConversionTest("convertToRGB"));
   			addTest(new XYZConversionTest("convertToHex"));
   			addTest(new XYZConversionTest("convertToCMY"));
   			addTest(new XYZConversionTest("convertToCMYK"));
   			addTest(new XYZConversionTest("convertToHex"));
   			addTest(new XYZConversionTest("convertToYxy"));
   			addTest(new XYZConversionTest("convertToCIELab"));
   			addTest(new XYZConversionTest("convertToCIELCh"));		
			
   			addTest(new CIELabConversionTest("convertToRGB"));
   			addTest(new CIELabConversionTest("convertToHex"));
   			addTest(new CIELabConversionTest("convertToCMY"));
   			addTest(new CIELabConversionTest("convertToCMYK"));
   			addTest(new CIELabConversionTest("convertToHex"));
   			addTest(new CIELabConversionTest("convertToXYZ"));
   			addTest(new CIELabConversionTest("convertToYxy"));
   			addTest(new CIELabConversionTest("convertToCIELCh"));
			
			
			addTest(new CMYKConversionTest("convertToRGB"));
   			addTest(new CMYKConversionTest("convertToHex"));
   			addTest(new CMYKConversionTest("convertToCMY"));
   			addTest(new CMYKConversionTest("convertToCIELab"));
   			addTest(new CMYKConversionTest("convertToHex"));
   			addTest(new CMYKConversionTest("convertToXYZ"));
   			addTest(new CMYKConversionTest("convertToYxy"));
   			addTest(new CMYKConversionTest("convertToCIELCh"));
			
			
			
			addTest(new YxyConversionTest("convertToRGB"));
   			addTest(new YxyConversionTest("convertToHex"));
   			addTest(new YxyConversionTest("convertToCMY"));
   			addTest(new YxyConversionTest("convertToCMYK"));
   			addTest(new YxyConversionTest("convertToCIELab"));
   			addTest(new YxyConversionTest("convertToHex"));
   			addTest(new YxyConversionTest("convertToXYZ"));
   			addTest(new YxyConversionTest("convertToCIELCh"));
			
		}
		
	}

}