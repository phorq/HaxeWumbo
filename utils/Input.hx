package utils;
import w2d.Wumbo;

import utils.input.Joystick;
import utils.input.Keyboard;
import utils.input.Mouse;
import utils.input.Multitouch;

class Input
{	
	static private var joystick:Joystick;
	static private var keyboard:Keyboard;
	static private var mouse:Mouse;
	static private var multi:Multitouch;
	
	public function new() 
	{
		joystick = new Joystick();
		keyboard = new Keyboard();
		mouse = new Mouse();
		multi = new Multitouch();
	}
	
	public function ctrlPressed(ctrlR:Int, ctrlC:Int) return joystick.ctrlPressed(ctrlR, ctrlC);
	public function keyPressed(keyCode:Int, ?charCode:Int) return keyboard.keyPressed(keyCode, charCode);
	public function mouseClicked(x:Float, y:Float, w:Float, h:Float) return mouse.mouseClicked(x, y, w, h);
	
	public function show() {
		var string:String = "";
		for (i in  keyboard.getKeyArray()) {
			string += "[" + i[0] + ", " + i[1] + "] ";
		}
		Wumbo.text.print(string, 1, 0, Wumbo.grid.getHeight() - 2, 0xffffff);
		var string:String = "";
		var joy:Int = 0;
		for (i in  joystick.getJoyCode()) {
			if (i.length > 0) {
				string += joystick.getJoyCode().indexOf(i) + ": [";
				for (c in i) {
					string += c;
					if (i[i.length-1] != c) string += ", ";
				}
				string += "] ";
			}joy++;
		}Wumbo.text.print(string, 1, 0, Wumbo.grid.getHeight() -1, 0xffffff);
		Wumbo.text.print(Std.string(joystick.controller), 1, 0, 0, 0xffffff);
	}	
}