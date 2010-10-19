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
		public function toYxy():Yxy { return null; }
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

			const c:Vector.<String> = Vector.<String>(['00', 'CC', '33', '66', '99', 'FF']);
			c.fixed = true;
			var palette:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			for (var i:int = 0; i < 6; i++) {
				for (var j:int = 0; j < 6; j++) {
					for (var k:int = 0; k < 6; k++) {
						palette.push(Hex.fromString(c[i]+c[j]+c[k]));
					}
				}
			}
			palette.fixed = true;
			return match(palette);
		}
		public function match(palette:Vector.<AbstractColor>):AbstractColor {
			var distance:Number = Number.POSITIVE_INFINITY;
			var closest:AbstractColor = null;
			var n:int = palette.length;
			for (var i:int=0; i<n; i++){
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
			var current	:CIELCh = this.toCIELCh();
			var distance:Number = 360/parts;
			var palette	:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			if (includeSelf) palette.push(this);
			for (var i:int=1; i<parts; i++){
				palette.push(new CIELCh(current.l, current.c,current.h+(distance*i))[this.toSelf]());
			}
			palette.fixed = true;
			return palette;
		}
		public function split(includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			rtn.push(this.hue(150)[this.toSelf]());
			if (includeSelf){
				rtn.push(this);
			}
			rtn.push(this.hue( -150)[this.toSelf]());
			rtn.fixed = true;
			return rtn;
		}
		public function complement(includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			rtn.push(this.hue(180)[this.toSelf]());
			if (includeSelf) rtn.unshift(this);
			rtn.fixed = true;
			return rtn;
		}
		public function sweetspot(includeSelf:Boolean = false):Vector.<AbstractColor> {
			var colors:Vector.<HSV> = new Vector.<HSV>(6,true);
			colors[0] = this.toHSV();
			colors[1] = new HSV(colors[0].h, Math.round(colors[0].s * 0.3), Math.min(Math.round(colors[0].v * 1.3),100));
			colors[3] = new HSV((colors[0].h+300)%360, colors[0].s, colors[0].v);
			colors[2] = new HSV(colors[1].h, Math.min(Math.round(colors[1].s * 1.2),100), Math.min(Math.round(colors[1].v * 0.5),100));
			colors[4] = new HSV(colors[2].h, 0, (colors[2].v + 50) % 100);
			colors[5] = new HSV(colors[4].h, colors[4].s, (colors[4].v + 50) % 100);
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			var n:int = colors.length;
			for (var i:int=includeSelf?0:1; i<n;i++){
				rtn.push(colors[i][this.toSelf]());
			}
			return rtn;
		}
		public function analogous(includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			rtn.push(this.hue(30)[this.toSelf]());
			if (includeSelf){
				rtn.push(this);
			}
			rtn.push(this.hue(-30)[this.toSelf]());
			return rtn;
		}
		public function rectangle(sideLength:int, includeSelf:Boolean = false):Vector.<AbstractColor>
		{
			var side1:int = sideLength;
			var side2:int = (360-(sideLength*2))/2;
			var current:CIELCh = this.toCIELCh();
			var rtn:Vector.<AbstractColor> = new Vector.<AbstractColor>();
			if (includeSelf) rtn.push(this);
			rtn.push(new CIELCh(current.l, current.c,current.h+side1)[this.toSelf]());
			rtn.push(new CIELCh(current.l, current.c,current.h+side1+side2)[this.toSelf]());
			rtn.push(new CIELCh(current.l, current.c, current.h + side1 + side2)[this.toSelf]());
			rtn.fixed = true;
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
			var iS:Number = 1 / steps;
			for (var n:int = 1; n < steps; n++) {
				nr = Math.floor(a.r+(n*(b.r-a.r)*iS));
				ng = Math.floor(a.g+(n*(b.g-a.g)*iS));
				nb = Math.floor(a.b+(n*(b.b-a.b)*iS));
				colors.push(new RGB(nr,ng,nb)[this.toSelf]());
			}
			if (includeSelf) {
				colors.unshift(this);
				colors.push(destinationColor[this.toSelf]());
			}
			colors.fixed = true;
			return colors;
		}
		public function greyscale():AbstractColor
		{
			var a:RGB = this.toRGB();
			var ds:Number = a.r*0.3 + a.g*0.59+ a.b*0.11;
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
			a.s += (satModifier*0.01);
			//a.s = Math.min(1,Math.max(0,a.s));
			a.s = ((a.s > 0) ? a.s : 0) > 1 ? 1 : a.s;
			return a[this.toSelf]();
		}
		public function brightness(brightnessModifier:Number):AbstractColor
		{
			var a:CIELab = this.toCIELab();
			a.l += brightnessModifier;
			return a[this.toSelf]();
		}
		protected function roundDec(numIn:Number, decimalPlaces:int=0):Number {
			if (decimalPlaces == 0) return Math.round(numIn);
			const m:Number = Math.pow(10, decimalPlaces);
			return Math.round(numIn * m) / m;
		}
	}

}

