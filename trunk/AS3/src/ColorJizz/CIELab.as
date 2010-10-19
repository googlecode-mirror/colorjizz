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
	public final class CIELab extends AbstractColor
	{
		public var l:Number;
		public var a:Number;
		public var b:Number;
		public function CIELab(l:Number, a:Number, b:Number)
		{
			this.toSelf = "toCIELab";
			this.l = l;// this.roundDec(l, 3);
			this.a = a;//this.roundDec(a, 3);
			this.b = b;//this.roundDec(b, 3);
		}
		override public function toHex():Hex
		{
			return this.toRGB().toHex();
		}
		override public function toRGB():RGB
		{
			return this.toXYZ().toRGB();
		}
		override public function toXYZ():XYZ
		{
			var var_Y:Number = (this.l + 16 ) * 0.00862068966; // 1/116==0.00862068966
			var var_X:Number = this.a * 0.002 + var_Y; // 1/500==0.002
			var var_Z:Number = var_Y - this.b * 0.005;// 1/200==0.005;

			if (Math.pow(var_Y,3) > 0.008856){
				var_Y = Math.pow(var_Y,3);
			}else {
				var_Y = (var_Y - 0.137931034) * 0.12841916; //16 / 116 == 0.137931034 // 1/7.787==0.12841916
			}
			if(Math.pow(var_X,3) > 0.008856){
				var_X = Math.pow(var_X,3);
			}else {
				var_X = (var_X - 0.137931034) * 0.12841916;
			}
			if (Math.pow(var_Z,3) > 0.008856){
				var_Z = Math.pow(var_Z,3);
			}else {
				var_Z = (var_Z - 0.137931034) * 0.12841916;
			}
			return new XYZ(95.047 * var_X, 100 * var_Y, 108.883 * var_Z);
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
			return this.toRGB().toCMY();
		}
		override public function toCMYK():CMYK
		{
			return this.toCMY().toCMYK();
		}
		override public function toCIELab():CIELab
		{
			return this;
		}
		override public function toCIELCh():CIELCh
		{
			var var_H:Number = Math.atan2( this.b, this.a );

			if ( var_H > 0 ) {
				var_H = ( var_H * 0.318309886 ) * 180; //0.318309886==1/Math.PI
			}else{
				var_H = 360 - ( (var_H < 0 ? -var_H:var_H) * 0.318309886 ) * 180
			}
			
			return new CIELCh(l, Math.sqrt(Math.pow(this.a, 2) + Math.pow(this.b, 2)), var_H);
		}
		public function toString ():String
		{
			return this.l+','+this.a+','+this.b;
		}
	}

}
