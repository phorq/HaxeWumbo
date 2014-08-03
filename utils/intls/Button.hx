package utils.intls;
import w2d.Wumbo;

class Button {

	private var graphic:Dynamic;
	public function new(?graphic:Dynamic) { }
	
	public function make(graphic:Dynamic) {
		new Button(graphic);
	}
	
	public function clicked(x:Float, y:Float, w:Float, h:Float) {
		if (Wumbo.input.mouseClicked()) {
			if (x <= Wumbo.input.mouseX() && x+w >= Wumbo.input.mouseX()
				&& y <= Wumbo.input.mouseY() && y + h >= Wumbo.input.mouseY()) {
				return true;	
			} else return false;
		} else return false;
	}
	
}