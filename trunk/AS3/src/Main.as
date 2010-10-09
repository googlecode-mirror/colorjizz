package 
{
	import ColorJizz.CMYK;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Mikee
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			trace(new CMYK(0,  1,  1, 0.2).toCMY().toYxy().toRGB().toHex());
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}