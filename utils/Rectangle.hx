package utils;
import w2d.Wumbo;

class Rectangle {
	
	private var x:Float;
	private var y:Float;
	private var w:Float;
	private var h:Float;
	private var t:Float;
	private var c:Int;
	
	public function new (?x:Float, ?y:Float, ?w:Float, ?h:Float, ?t:Float, ?c:Int) {
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
		this.t = t;
		this.c = c;
	}
	
	public function draw (?x:Float, ?y:Float, ?w:Float, ?h:Float, ?t:Float, ?c:Int) {
		Wumbo.line.draw(w + x, y, w + x, h + y, t, c);
		Wumbo.line.draw(x, h + y, w + x, h + y, t, c);
		Wumbo.line.draw(x, y, x, h + y, t, c);
		Wumbo.line.draw(x, y, w + x, y, t, c);
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
	
	public function getThickness() {
		return t;
	}
	
	public function getColor() {
		return c;
	}
	
	public function setX(x:Float) {
		this.x = x;
	}
	
	public function setY(y:Float) {
		this.y = y;
	}
	
	public function setWidth(width:Float) {
		w = width;
	}
	
	public function setHeight(height:Float) {
		h = height;
	}
	
	public function setThickness(thickness:Float) {
		t = thickness;
	}
	
	public function setColor(color:Int) {
		c = color;
	}
}