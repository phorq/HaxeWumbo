package utils.intls;
import w2d.Wumbo;

import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

class Input
{
	static private var keyCode:Int;
	static private var charCode:Int;
	static private var held:Bool = false;
	static private var x:Int;
	static private var click:Bool = false;
	
	
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
		
		flash.Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
			click = true;
		});
		
		flash.Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
			click = false;
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
	
	public function mouseClicked() {
		return click;
	}
	
	public function mouseX() {
		return Wumbo.grid.toGridX(flash.Lib.current.mouseX);
	}
	
	public function mouseY() {
		return Wumbo.grid.toGridY(flash.Lib.current.mouseY);
	}
	
}