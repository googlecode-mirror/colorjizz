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
	public final class CMYK extends AbstractColor
	{
		public var c:Number;
		public var m:Number;
		public var y:Number;
		public var k:Number;
		public function CMYK(c:Number, m:Number, y:Number, k:Number)
		{
			this.toSelf = "toCMYK";
			this.c = c;
			this.m = m;
			this.y = y;
			this.k = k;
		}
		override public function toHex():Hex
		{
			return this.toRGB().toHex();
		}
		override public function toRGB():RGB
		{
			return this.toCMY().toRGB();
		}
		override public function toXYZ():XYZ
		{
			return this.toRGB().toXYZ();
		}
		override public function toYxy():Yxy
		{
			return this.toXYZ().toYxy();
		}
		override public function toHSV():HSV
		{
			return this.toRGB().toHSV();
		}
		override public function toCMY():CMY
		{
			return new CMY(( c * ( 1 - k ) + k ), ( m * ( 1 - k ) + k ), ( y * ( 1 - k ) + k ));
		}
		override public function toCMYK():CMYK
		{
			return this;
		}
		override public function toCIELab():CIELab
		{
			return this.toRGB().toCIELab();
		}
		override public function toCIELCh():CIELCh
		{
			return this.toCIELab().toCIELCh();
		}
		public function toString():String
		{
			return this.c+','+this.m+','+this.y+','+this.k;
		}
	}

}

