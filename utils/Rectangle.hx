package utils;
import utils.intls.Grid;
import w2d.Wumbo;

class Rectangle {
	
	private var grid:Grid;
	private var x:Float;
	private var y:Float;
	private var w:Float;
	private var h:Float;
	
	public function new (?grid:Grid, ?x:Float, ?y:Float, ?w:Float, ?h:Float) {
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
	}
	
	public function draw (?x:Float, ?y:Float, ?w:Float, ?h:Float) {
		var output:Rectangle = new Rectangle(x, y, w, h);
		Wumbo.line.draw(w + x, y, w + x, h + y);
		Wumbo.line.draw(x, h + y, w + x, h + y);
		Wumbo.line.draw(x, y, x, h + y);
		Wumbo.line.draw(x, y, w + x, y);
		return output;
	}
	
	public function getX() {
		return x;
	}
	
	public function getY() {
		return y;
	}
	
	public function getWidth() {
		return w;
	}
	
	public function getHeight() {
		return h;
	}
	
}