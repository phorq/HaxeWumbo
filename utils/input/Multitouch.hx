package utils.input;

import openfl.events.TouchEvent;

class Multitouch
{
	private var touches:Array<Array<Int>>;
	public function new() 
	{
		flash.Lib.current.addEventListener(TouchEvent.TOUCH_BEGIN, function(e:TouchEvent) {
			trace(e.localX);
		});
		
		flash.Lib.current.addEventListener(TouchEvent.TOUCH_MOVE, function(e:TouchEvent) {
			
		});
		
		flash.Lib.current.addEventListener(TouchEvent.TOUCH_END, function(e:TouchEvent) {
			
		});
	}
	
}