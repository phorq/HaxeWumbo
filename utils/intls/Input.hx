package utils.intls;

import openfl.events.KeyboardEvent;

class Input
{
	static private var keyCode:Int;
	static private var charCode:Int;
	static private var held:Bool = false;
	static private var x:Int;
	
	
	public function new() 
	{
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent) {
			charCode = e.charCode; 
			keyCode = e.keyCode;
			held = true;
		});
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, function(e:KeyboardEvent) {
			held = false;
		});
	}
	
	public function getKeyCode() {
		if (held) return keyCode;
		return 0;
	}
	
	public function getCharCode() {
		if (held) return charCode;
		else return 0;
	}
	
	public function getFullCode() { }
	
}