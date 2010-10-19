package ColorJizz
{
	import ColorJizz.CIELab;
	import ColorJizz.CIELCh;
	import ColorJizz.CMY;
	import ColorJizz.CMYK;
	import ColorJizz.Hex;
	import ColorJizz.HSV;
	import ColorJizz.RGB;
	import ColorJizz.XYZ;
	import ColorJizz.Yxy;
	/**
	 * ...
	 * @author Mikee
	 */
	public final class Hex extends AbstractColor
	{
		public var hex:uint;
		public function Hex(hex:uint)
		{
			this.hex = hex;
			this.toSelf = "toHex";
		}
		override public function toHex():Hex
		{
			return this;
		}
		override public function toRGB():RGB
		{
			return new RGB(((hex & 0xFF0000) >> 16), ((hex & 0xFF00) >> 8), ((hex & 0xFF)));
		}
		override public function toXYZ():XYZ
		{
			return this.toRGB().toXYZ();
		}
		override public function toYxy():Yxy
		{
			return this.toRGB().toYxy();
		}
		override public function toHSV():HSV
		{
			return this.toRGB().toHSV();
		}
		override public function toCMY():CMY
		{
			return this.toRGB().toCMY();
		}
		override public function toCMYK():CMYK
		{
			return this.toCMY().toCMYK();
		}
		override public function toCIELab():CIELab
		{
			return this.toXYZ().toCIELab();
		}
		override public function toCIELCh():CIELCh
		{
			return this.toCIELab().toCIELCh();
		}
		public function toString ():String
		{
			return this.hex.toString(16).toUpperCase();
		}
		public static function fromString(str:String):Hex
		{
			if (str.charAt(0) == '#') str = str.substring(1, 7);
			return new Hex(uint(str));
		}
	}

}

