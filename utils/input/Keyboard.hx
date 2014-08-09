package utils.input;
import openfl.events.KeyboardEvent;
import w2d.Wumbo;

class Keyboard
{
	static private var keyArray:Array<Array<Int>> = new Array<Array<Int>>();

	public function new() 
	{
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent) {
			keyAdd(e.keyCode, e.charCode);
			Wumbo.refresh();
		});
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, function(e:KeyboardEvent) {
			keyRemove(e.keyCode, e.charCode);
			Wumbo.refresh();
		});
	}
	
	private function keyRemove(keyCode:Int, charCode:Int) {
		for (k in keyArray) {
			if (k[0] == keyCode && k[1] == charCode) keyArray.remove(k);
		} 
	}
	
	private function keyAdd(keyCode:Int, charCode:Int) {
		if (!keyPressed(keyCode, charCode)) {
			var r:Array<Int> = new Array<Int>();
			r[0] = keyCode;
			r[1] = charCode;
			keyArray.insert(keyArray.length, r);
		}
	}
	
	public function keyPressed(keyCode:Int, ?charCode:Int) {
		for (k in keyArray) {
			if (k[0] == keyCode && k[1] == charCode) return true;
		} 

		return false;
	}
	
	public function getKeyArray() {
		return keyArray;
	}
	
}