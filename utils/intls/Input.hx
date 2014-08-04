package utils.intls;
import w2d.Wumbo;

import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;

class Input
{
	static private var keyCode:Array<Int> = new Array<Int>();
	static private var charCode:Array<Int> = new Array<Int>();
	static private var held:Bool = false;
	static private var x:Int;
	static private var click:Bool = false;
	
	
	public function new() 
	{
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent) {
			for(i in charCode)
				if (Std.int(i) == Std.int(e.charCode)) charCode.remove(e.charCode);
			charCode.insert(e.charCode, e.charCode);
			for(i in keyCode)
				if (Std.int(i) == Std.int(e.keyCode)) keyCode.remove(e.keyCode);
			keyCode.insert(e.keyCode, e.keyCode);
		});
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, function(e:KeyboardEvent) {
			for(i in charCode)
				if (Std.int(i) == Std.int(e.charCode)) charCode.remove(e.charCode);
			for(i in keyCode)
				if (Std.int(i) == Std.int(e.keyCode)) keyCode.remove(e.keyCode);
		});
		
		flash.Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
			click = true;
		});
		
		flash.Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
			click = false;
		});
	}
	
	
	
	public function keyPressed(keyC:Int) {
		var pressed:Bool = false;
		for (i in keyCode)
			if (i == keyC) pressed = true;
		return pressed;
	}
	
	public function charPressed(charC:Int) {
		var pressed:Bool = false;
		for (i in charCode)
			if (i == charC) pressed = true;
		return pressed;
	}
	
	public function show() {
		var string:String = "";
		for (i in  keyCode) {
			string += i + " ";
		}
		Wumbo.text.print(string, 1, 0, 0);
		var string:String = "";
		for (i in  charCode) {
			string += i + " ";
		}
		Wumbo.text.print(string, 1, 0, 1);
	}
	
	public function getCharCode() {
		return charCode[charCode.length-1];
	}

	public function getKeyCode() {
		return keyCode[keyCode.length-1];
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