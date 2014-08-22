package w2d;

import openfl.events.Event;

typedef Line = utils.Line;
typedef Text = utils.Text;
typedef Rectangle = utils.Rectangle;
typedef Grid = utils.Grid;
typedef Input = utils.Input;

class Wumbo extends Grid{
	
	//public var update:Float->Void = null;
	public var draw:Void->Void;
	
	private var timer:Float = 0;
	
	// Loads base utils
	static public var grid:			Grid = new Grid();
	static public var input:		Input;
	static public var line:			Line = new Line();
	static public var text:			Text = new Text();
	static public var rectangle:	Rectangle = new Rectangle();
	
	static public function refresh() {
		flash.Lib.current.removeChildren();
		Wumbo.draw();
	}
	
	public function new(w:Int, h:Int) {
		super(w, h);
		input = new Input();
		setSize(flash.Lib.current.stage.stageWidth, flash.Lib.current.stage.stageHeight);
		flash.Lib.current.addEventListener(Event.ENTER_FRAME, function(e:Event) {
			Wumbo.update((flash.Lib.getTimer() - timer) * .001);
			timer = flash.Lib.getTimer();
		});
		
	}
}