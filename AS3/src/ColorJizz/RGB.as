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
	public final class RGB extends AbstractColor
	{
		public var r:int;
		public var g:int;
		public var b:int;
		public function RGB(r:int, g:int, b:int) {
			this.toSelf = "toRGB";
			this.r = (r < 0) ? 0 : (r > 0xff) ? 0xff : r;
			this.g = (g < 0) ? 0 : (g > 0xff) ? 0xff : g;
			this.b = (b < 0) ? 0 : (b > 0xff) ? 0xff : b;
		}
		override public function toHex():Hex {
			return new Hex(this.r << 16 | this.g << 8 | this.b);
		}
		override public function toRGB():RGB {
			return this;
		}
		override public function toXYZ():XYZ
		{
			var tmp_r:Number = this.r/255;
			var tmp_g:Number = this.g/255;
			var tmp_b:Number = this.b/255;
			if(tmp_r > 0.04045) {
				tmp_r = Math.pow(((tmp_r + 0.055) / 1.055), 2.4);
			}else {
				tmp_r = tmp_r / 12.92;
			}
			if(tmp_g > 0.04045) {
				tmp_g = Math.pow(((tmp_g + 0.055) / 1.055), 2.4)
			}else {
				tmp_g = tmp_g / 12.92;
			}
			if(tmp_b > 0.04045) {
				tmp_b = Math.pow(((tmp_b + 0.055) / 1.055), 2.4);
			}else {
				tmp_b = tmp_b / 12.92;
			}
			tmp_r = tmp_r * 100;
			tmp_g = tmp_g * 100;
			tmp_b = tmp_b * 100;
			var x:Number = tmp_r * 0.4124 + tmp_g * 0.3576 + tmp_b * 0.1805;
			var y:Number = tmp_r * 0.2126 + tmp_g * 0.7152 + tmp_b * 0.0722;
			var z:Number = tmp_r * 0.0193 + tmp_g * 0.1192 + tmp_b * 0.9505;
			return new XYZ(x,y,z);
		}
		override public function toYxy():Yxy
		{
			return this.toXYZ().toYxy();
		}
		override public function toHSV():HSV
		{
			var r:Number, g:Number, b:Number;
			r = this.r/255;
			g = this.g/255;
			b = this.b/255;

			var h:Number, s:Number, v:Number;
			var min:Number, max:Number, delta:Number;

			//min = Math.min( r, g, b );
			min = (r < g && r < b) ? r : (g < r && g < b) ? g : b;
			//max = Math.max( r, g, b );
			max = (r > g && r > b) ? r : (g > r && g > b) ? g : b;

			v = max;
			delta = max - min;
			if(max != 0){
				s = delta / max;
			} else {
				return new HSV(-1, 0, v);
			}
			if (r == max) {
				h = (g - b) / delta;
			} else if( g == max){
				h = 2 + (b - r) / delta;
			}else{
				h = 4 + (r - g) / delta;
			}
			h *= 60;
			if(h < 0) h += 360;
			
			return new HSV(h, s*100, v*100);
		}
		override public function toCMY():CMY
		{
			return new CMY(1 - ( this.r / 255 ), 1 - ( this.g / 255 ), 1 - ( this.b / 255 ));
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
		public function toString ():String {
			return this.r+','+this.g+','+this.b;
		}
	}

}

