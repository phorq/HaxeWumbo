package utils.intls;
import w2d.Wumbo;

import openfl.events.KeyboardEvent;
import openfl.events.JoystickEvent;
//import flash.events.JoystickEvent;
import openfl.events.MouseEvent;

class Input
{
	static private var keyCode:Array<Int> = new Array<Int>();
	static private var charCode:Array<Int> = new Array<Int>();
	static private var ctrlCode:Array<Int> = new Array<Int>();
	static private var held:Bool = false;
	static private var x:Int;
	static private var click:Bool = false;
	
	public function new() 
	{
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent) {
			charCode.remove(e.charCode);
			charCode.insert(e.charCode, e.charCode);
			keyCode.remove(e.keyCode);
			keyCode.insert(e.keyCode, e.keyCode);
		});
		flash.Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, function(e:KeyboardEvent) {
			charCode.remove(e.charCode);
			keyCode.remove(e.keyCode);
		});
		
		flash.Lib.current.stage.addEventListener( JoystickEvent.AXIS_MOVE, function(e:JoystickEvent) {
			#if android
			var length = 14;
			#end
			#if !android
			var length = 9;
			#end
			for (i in 0...length) ctrlCode.remove(i);

			if (e.x >= .5) ctrlCode.insert(ctrlCode.length, 2);
			else if (e.x <= -.5) ctrlCode.insert(ctrlCode.length, 0);

			if (e.y >= .5) ctrlCode.insert(ctrlCode.length, 3);
			else if (e.y <= -.5) ctrlCode.insert(ctrlCode.length, 1);
			#if !android
			if (e.z >= .5) ctrlCode.insert(ctrlCode.length, 6);
			else if (e.z <= -.5) ctrlCode.insert(ctrlCode.length, 4);

			if (e.axis[3] >= .5) ctrlCode.insert(ctrlCode.length, 7);
			else if (e.axis[3] <= -.5) ctrlCode.insert(ctrlCode.length, 5);
			#end
			#if android
			if (e.axis[11] >= .5) ctrlCode.insert(ctrlCode.length, 6);
			else if (e.axis[11] <= -.5) ctrlCode.insert(ctrlCode.length, 4);

			if (e.axis[14] >= .5) ctrlCode.insert(ctrlCode.length, 7);
			else if (e.axis[14] <= -.5) ctrlCode.insert(ctrlCode.length, 5);
			#end

			if (e.axis[e.axis.length - 2] >= 0) ctrlCode.insert(ctrlCode.length, 8);
			if (e.axis[e.axis.length - 1] >= 0) ctrlCode.insert(ctrlCode.length, 9);
			#if android
			if (e.axis[e.axis.length - 3] < -.5) ctrlCode.insert(ctrlCode.length, 10);
			else if (e.axis[e.axis.length - 3] > .5) ctrlCode.insert(ctrlCode.length, 11);

			if (e.axis[e.axis.length - 4] < -.5) ctrlCode.insert(ctrlCode.length, 12);
			else if (e.axis[e.axis.length - 4] > .5) ctrlCode.insert(ctrlCode.length, 13);
			#end
		});
		
		flash.Lib.current.stage.addEventListener(JoystickEvent.BUTTON_DOWN, function(e:JoystickEvent) {
			var code:Int = translateCtrlCode(e.id + 14);
			
			if (code != -1) {
				ctrlCode.remove(code);
				ctrlCode.insert(code, code);
			}
		});
		flash.Lib.current.stage.addEventListener(JoystickEvent.BUTTON_UP, function(e:JoystickEvent) {
		var code:Int = translateCtrlCode(e.id + 14);
		ctrlCode.remove(code);
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
	
	public function ctrlPressed(ctrlC:Int) {
		var pressed:Bool = false;
		for (i in ctrlCode)
			if (i == ctrlC) pressed = true;
		return pressed;
	}
	
	public function show() {
		var string:String = "";
		for (i in  keyCode) {
			string += i + " ";
		}
		Wumbo.text.print(string, 1, 0, 0, 0xffffff);
		var string:String = "";
		for (i in  charCode) {
			string += i + " ";
		}
		Wumbo.text.print(string, 1, 0, 1, 0xffffff);
		var string:String = "";
		for (i in  ctrlCode) {
			string += i + " ";
		}
	}
	
	public function translateCtrlCode(code:Int) {
		#if android
			if (code == 21) code = 23;
			else if (code == 20) code = 22;
			else if (code == 14) code = 24;
			else if (code == 15) code = 25;
			else if (code == 18) code = 27;
			else if (code == 17) code = 26;
			else if (code == 24) code = 20;
			else if (code == 25) code = 21;
			else if (code == 27) code = 18;
			else if (code == 23 || code == 22) code = -1;
		#end
		#if !android
			if (code == 14) code = 10;
			else if (code == 15) code = 11;
			else if (code == 16) code = 12;
			else if (code == 17) code = 13;
		#end
		
		return code;
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