package Samples 
{
	import ColorJizz.Hex;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Mikee
	 */
	public class Test extends Sprite
	{
		
		public function Test() 
		{
			trace(new Hex(0xCC0000).toRGB().toCIELab().toHex());
		}
		
	}

}