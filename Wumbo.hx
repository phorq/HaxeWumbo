package w2d;

import flash.display.Stage;
import openfl.events.Event;

typedef Line = utils.Line;
typedef Text = utils.Text;
typedef Rectangle = utils.Rectangle;
typedef Grid = utils.Grid;
typedef Input = utils.Input;

class Wumbo{
		
	static public var update:Float->Void = null;
	static public var draw:Void->Void = null;
	
	private var timer:Float = 0;
	
	// Loads base utils
	static public var grid:			Grid = new Grid();
	static public var input:		Input;
	static public var line:			Line = new Line();
	static public var text:			Text = new Text();
	static public var rectangle:	Rectangle = new Rectangle();
	
	static public function refresh() {
		flash.Lib.current.removeChildren();
		draw();
	}
	
	public function add(w:Wumbo) {
		grid.add(w);
	}
	
	public function get(ndx:Int) {
		for (i in grid.getNest()) {
			ndx--;
			if(ndx == 0) return i;
		}
		return null;
	}
	
	public function remove(w:Wumbo) {
		grid.remove(w);
	}
	
	public function new(w:Int, h:Int) {
		//super();
		input = new Input();
		grid.setRatio(w, h);
		grid.setSize(flash.Lib.current.stage.stageWidth, flash.Lib.current.stage.stageHeight);
		flash.Lib.current.addEventListener(Event.ENTER_FRAME, function(e:Event) {
			update((flash.Lib.getTimer() - timer) * .001);
			timer = flash.Lib.getTimer();
		});
		
	}
}