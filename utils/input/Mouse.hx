package utils.input;
import w2d.Wumbo;

import openfl.events.MouseEvent;

class Mouse
{
	static private var click:Bool = false;

	public function new() 
	{
		flash.Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) {
			click = true;
		});
		
		flash.Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
			click = false;
		});
	}
	
	public function mouseClicked(x:Float, y:Float, w:Float, h:Float) {
		if (click) {
			if (x <= mouseX() && x+w >= mouseX()
				&& y <= mouseY() && y + h >= mouseY()) {
				return true;	
			} else return false;
		} else return false;
	}
	
	public function mouseX() {
		return Wumbo.grid.toGridX(flash.Lib.current.mouseX);
	}
	
	public function mouseY() {
		return Wumbo.grid.toGridY(flash.Lib.current.mouseY);
	}
	
}