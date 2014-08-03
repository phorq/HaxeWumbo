package w2d;

import flash.events.Event;

typedef Line = utils.Line;
typedef Text = utils.Text;
typedef Rectangle = utils.Rectangle;
typedef Grid = utils.intls.Grid;
typedef Input = utils.intls.Input;

class Wumbo {
	
	static public var update:Float->Void = null;
	private var timer:Float = 0;
	
	// Loads base utils
	static public var grid:			Grid = new Grid();
	static public var input:		Input;
	static public var line:			Line = new Line(grid);
	static public var text:			Text = new Text(grid);
	static public var rectangle:	Rectangle = new Rectangle(grid);
	
	public function new(w:Int, h:Int) {
		input = new Input();
		grid.setRatio(w, h);
		flash.Lib.current.addEventListener(Event.ENTER_FRAME, function(e:Event) {
			flash.Lib.current.removeChildren();
			grid.setSize(flash.Lib.current.stage.stageWidth, flash.Lib.current.stage.stageHeight);
			Wumbo.update((flash.Lib.getTimer() - timer) * .001);
			timer = flash.Lib.getTimer();
		});
		
	}
}