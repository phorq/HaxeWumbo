package utils;
import utils.intls.Grid;
import w2d.Wumbo;
class Text
{
	private var grid:Grid;
	private var string:String;
	private var size:Float;
	private var x:Float;
	private var y:Float;
	private var font:String;
	

	public function new(grid:Grid, ?string:String, ?size:Float, ?x:Float, ?y:Float, ?font:String) {
		this.grid = grid;
		this.string = Std.string(string);
		this.size = size;
		this.x = x;
		this.y = y;
		this.font = font;
	}
	
	public function print(?string:String, ?size:Float, ?x:Float, ?y:Float, ?font:String) {
		var output:Text = new Text(grid, string, size, x, y, font);
		var out:flash.text.TextField = new flash.text.TextField();
		var format: flash.text.TextFormat = new flash.text.TextFormat();
		format.font = output.font;
		format.size = Std.int(grid.getSize() * output.size);
		format.color = 0xff0000;
		out.defaultTextFormat = format;
		out.text = output.string;
		out.x = grid.toPixelX(output.x);
		out.y = grid.toPixelY(output.y) - format.size;
		out.width = out.textWidth + grid.getSize() * size;
		out.height = (out.y + grid.toPixelY(y - size)) + output.size;
		out.selectable = false;
		//out.embedFonts = true;
		flash.Lib.current.addChild(out);
		return output;
	}
	
	
}