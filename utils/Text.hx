package utils;
import w2d.Wumbo;

class Text
{
	private var string:String;
	private var size:Float;
	private var x:Float;
	private var y:Float;
	private var font:String;
	private var color:Int;
	

	public function new(?string:String, ?size:Float, ?x:Float, ?y:Float, ?color:Int, ?font:String) {
		this.string = Std.string(string);
		this.size = size;
		this.x = x;
		this.y = y;
		this.color = color;
		this.font = font;
	}
	
	public function print(?string:String, ?size:Float, ?x:Float, ?y:Float, ?color:Int, ?font:String) {
		var output:Text = new Text(string, size, x, y, color, font);
		var out:flash.text.TextField = new flash.text.TextField();
		var format: flash.text.TextFormat = new flash.text.TextFormat();
		format.font = output.font;
		format.size = Std.int(Wumbo.grid.getSize() * output.size);
		format.color = output.color;
		out.defaultTextFormat = format;
		out.text = output.string;
		out.x = Wumbo.grid.toPixelX(output.x);
		out.y = Wumbo.grid.toPixelY(output.y) - format.size;
		out.width = out.textWidth + Wumbo.grid.getSize() * size;
		out.height = (out.y + Wumbo.grid.toPixelY(y - size)) + output.size;
		out.selectable = false;
		flash.Lib.current.addChild(out);
		return output;
	}
	
	public function getString() {
		return string;
	}
	
	public function getSize() {
		return size;
	}
	
	public function getX() {
		return x;
	}
	
	public function getY() {
		return y;
	}
	
	public function getFont() {
		return font;
	}
	
	public function getColor() {
		return color;
	}
	
	public function setString(string:String) {
		this.string = string;
	}
	
	public function setSize(size:Float) {
		this.size = size;
	}
	
	public function setX(x:Float) {
		this.x = x;
	}
	
	public function setY(y:Float) {
		this.y = y;
	}
	
	public function setFont(font:String) {
		this.font = font;
	}
	
	public function setColor(color:Int) {
		this.color = color;
	}
	
	
}