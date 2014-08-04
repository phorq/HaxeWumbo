package utils;

class Line {
	
	private var grid:utils.intls.Grid;
	private var x1:Float;
	private var y1:Float;
	private var x2:Float;
	private var y2:Float;
	private var thickness:Float;
	private var color:Int;
	
	public function new (grid:utils.intls.Grid, ?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float, ?thickness:Float, ?color:Int) {
		this.grid = grid;
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
		this.thickness = thickness;
		this.color = color;
	}
	
	public function draw (?x1:Float, ?y1:Float, ?x2:Float, ?y2:Float, ?thickness:Float, ?color:Int) {
		var output:Line = new Line(grid, x1, y1, x2, y2, thickness, color);
		var line = new flash.display.Sprite();
		line.graphics.lineStyle(grid.getSize() * thickness, color);
		line.graphics.moveTo(grid.toPixelX(output.x1), grid.toPixelY(output.y1));
		line.graphics.lineTo(grid.toPixelX(output.x2), grid.toPixelY(output.y2));
		flash.Lib.current.addChild(line);
		return output;
	}
	
	public function getX() {
		return x1;
	}
	
	public function getY() {
		return y1;
	}
	
	public function getWidth() {
		return (x2 - x1);
	}
	
	public function getHeight() {
		return (y2 - y1);
	}
	
	public function getLength() {
		return Math.sqrt(getWidth() * getWidth() + getHeight() * getHeight());
	}
	
	public function getThickness() {
		return thickness;
	}
	
	public function getColor() {
		return color;
	}
	
	public function setX(x:Float) {
		this.x1 = x;
	}
	
	public function setY(y:Float) {
		this.y1 = y;
	}
	
	public function setWidth(w:Float) {
		this.x2 = x1 + w;
	}
	
	public function setHeight(h:Float) {
		this.y2 = y1 + h;
	}
	
	public function setThickness(t:Float) {
		thickness = t;
	}
	
	public function setColor(c:Int) {
		color = c;
	}
}