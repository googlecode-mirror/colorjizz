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
	/**
	 * ...
	 * @author Mikee
	 */
	public class AbstractColor
	{
		protected var toSelf:String;
		public function AbstractColor()
		{
			//throw new Error("You should not initiate this class directly!");
		}
		public function toHex():Hex { return null;  }
		public function toRGB():RGB { return null;  }
		public function toXYZ():XYZ { return null;  }
		public function toCIELab():CIELab {return null;  }
		public function toCIELCh():CIELCh { return null; }
		public function toCMY():CMY { return null; }
		public function toCMYK():CMYK {return null;  }
		public function toHSV():HSV {return null;  }
		public function distance(destinationColor:AbstractColor):Number {
			var a:CIELab = this.toCIELab();
			var b:CIELab = destinationColor.toCIELab();

			return Math.sqrt(Math.pow((a.l - b.l),2)+Math.pow((a.a - b.a),2)+Math.pow((a.b-b.b),2));
		}
		public function websafe():AbstractColor {

			var c:Array = new Array('00','CC','33','66','99','FF');
			var palette:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			for (var i:int = 0; i < 6; i++) {
				for (var j:int = 0; j < 6; j++) {
					for (var k:int = 0; k < 6; k++) {
						palette.push(Hex.fromString(c[i]+c[j]+c[k]));
					}
				}
			}
			return this.match(palette);
		}
		public function match(palette:Vector.<AbstractColor>):AbstractColor {
			var distance:Number = Number.POSITIVE_INFINITY;
			var closest:AbstractColor = null;
			for (var i:int=0; i<palette.length; i++){
				var cdistance:Number = this.distance(palette[i]);
				if (distance == Number.POSITIVE_INFINITY || cdistance < distance) {
					distance = cdistance;
					closest = palette[i];
				}
			}
			return closest[this.toSelf]();
		}
		public function equal(parts:int, includeSelf:Boolean = false):Vector.<AbstractColor> {
			if (parts < 2) parts = 2;
			var current:CIELCh = this.toCIELCh();
			var distance:Number = 360/parts;
			var palette:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			if (includeSelf) palette.push(this);
			for (var i:int=1; i<parts; i++){
				palette.push(new CIELCh(current.l, current.c,current.h+(distance*i))[this.toSelf]());
			}
			return palette;
		}
		public function split(includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var current:CIELCh = this.toCIELCh();
			var distance:Number = 150;
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			rtn.push(new CIELCh(current.l, current.c, current.h + distance)[this.toSelf]());
			rtn.push(new CIELCh(current.l, current.c, current.h - distance)[this.toSelf]());
			if (includeSelf) rtn.unshift(this);
			return rtn;
		}
		public function analogous(includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var current:CIELCh = this.toCIELCh();
			var distance:int = 30;
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			rtn.push(new CIELCh(current.l, current.c, current.h + distance)[this.toSelf]());
			rtn.push(new CIELCh(current.l, current.c, current.h - distance)[this.toSelf]());
			if (includeSelf) rtn.unshift(this);
			return rtn;
		}
		public function rectangle(sideLength:int, includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var side1:int = sideLength;
			var side2:int = (360-(sideLength*2))/2;
			var current:CIELCh = this.toCIELCh();
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			rtn.push(new CIELCh(current.l, current.c,current.h+side1)[this.toSelf]());
			rtn.push(new CIELCh(current.l, current.c,current.h+side1+side2)[this.toSelf]());
			rtn.push(new CIELCh(current.l, current.c,current.h+side1+side2)[this.toSelf]());
			if (includeSelf) rtn.unshift(this);
			return rtn;
		}
		public function range(destinationColor:AbstractColor, steps:int, includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var a:RGB = this.toRGB();
			var b:RGB = destinationColor.toRGB();
			var colors:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			steps--;
			var nr:Number;
			var ng:Number;
			var nb:Number;
			for (var n:int = 1; n < steps; n++) {
				nr = Math.floor(a.r+(n*(b.r-a.r)/steps));
				ng = Math.floor(a.g+(n*(b.g-a.g)/steps));
				nb = Math.floor(a.b+(n*(b.b-a.b)/steps));
				colors.push(new RGB(nr,ng,nb)[this.toSelf]());
			}
			if (includeSelf) {
				colors.unshift(this);
				colors.push(destinationColor[this.toSelf]());
			}
			return colors;
		}
		public function greyscale():AbstractColor
		{
			var a:RGB = this.toRGB();
			var ds:Number = (Math.max(a.r,a.g,a.b) + Math.min(a.r,a.g,a.b))/2;
			return new RGB(ds,ds,ds)[this.toSelf]();
		}
		public function hue(degreeModifier:Number):AbstractColor
		{
			var a:CIELCh = this.toCIELCh();
			a.h += degreeModifier;
			return a[this.toSelf]();
		}
		public function saturation(satModifier:Number):AbstractColor
		{
			var a:HSV = this.toHSV();
			a.s += (satModifier/100);
			a.s = Math.min(1,Math.max(0,a.s));
			return a[this.toSelf]();
		}
		public function brightness(brightnessModifier:Number):AbstractColor
		{
			var a:HSV = this.toHSV();
			a.v += (brightnessModifier/100);
			a.v = Math.min(100,Math.max(0,a.v));
			return a[this.toSelf]();
		}
		protected function roundDec(numIn:Number, decimalPlaces:int):Number {
			var nExp:int = Math.pow(10,decimalPlaces) ;
			var nRetVal:Number = Math.round(numIn * nExp) / nExp
			return nRetVal;
		}
	}

}
