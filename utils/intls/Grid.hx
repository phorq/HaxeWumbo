package utils.intls;
import w2d.Wumbo;

class Grid {
	private var fullscreen:Bool = false;
	
	private var width:Int;
	private var height:Int;
	private var borderX:Int;
	private var borderY:Int;
	private var size:Float;
	
	public function new(?w:Int, ?h:Int) {
		width = w;
		height = h;
	}
	
	//sets height and width size for grid tiles automagically
	public function setSize(wx, wy) {
		var winR:Float = wx / wy;
		var gridR:Float = Math.abs(width / height);
		if (winR >  gridR) {
			size = Math.abs(wy / height);
			borderX = Std.int((wx - (size * width)) / 2);
			borderY = 0;
		} else {
			size = Math.abs(wx / width);
			borderY = Std.int((wy - (size * height)) / 2);
			borderX = 0;
		}
	}
	
	public function draw() {
		Wumbo.rectangle.draw(0, 0, width, height);
	}
	
	private var held:Bool = false;	
	public function update(input:Input) {
		draw();
		//Only works on flash for some reason...
		#if !flash
		if (input.getKeyCode() == 90 && input.getCharCode() == 0 && !held) {
			toggleFullscreen();
			held = true;
		} else if (!(input.getKeyCode() == 90 && input.getCharCode() == 0) && held) held = false;
		#end
		#if flash
		if (input.getKeyCode() == 122 && !held) {
			toggleFullscreen();
			held = true;
		} else if (input.getKeyCode() != 122 && held) held = false;
		#end
			
	}
	
	public function toPixelX(x:Float) {
		return Std.int((x * size) + borderX);
	}
	
	public function toPixelY(y:Float) {
		return Std.int((flash.Lib.current.stage.stageHeight - borderY) - (y * size));
	}
	
	public function toGridX(x:Float) {
		return (x - borderX)/size;
	}
	
	public function toGridY(y:Float) {
		return (((flash.Lib.current.stage.stageHeight - y) - borderY) / size);
	}
	
	public function getFullscreen() {
		return fullscreen;
	}
	
	public function getWidth() {
		return width;
	}
	
	public function getHeight() {
		return height;
	}
	
	public function getSize() {
		return size;
	}
	
	public function setRatio(w:Int, h:Int) {
		width = w;
		height = h;
	}
	
	public function setWidth(w:Int) {
		width = w;
	}
	
	public function setHeight(h:Int) {
		height = h;
	}
	
	public function setFullscreen(fullscreen:Bool) {
		this.fullscreen = fullscreen;
		if (fullscreen) flash.Lib.current.stage.displayState = flash.display.StageDisplayState.FULL_SCREEN;
		else flash.Lib.current.stage.displayState = flash.display.StageDisplayState.NORMAL;
	}
	
	public function toggleFullscreen() {
		setFullscreen(!getFullscreen());
	}
	
}