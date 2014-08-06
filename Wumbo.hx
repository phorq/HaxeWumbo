package w2d;

import openfl.events.Event;
typedef Button = utils.intls.Button;

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
	static public var line:			Line = new Line();
	static public var text:			Text = new Text();
	static public var rectangle:	Rectangle = new Rectangle();
	static public var button:		Button = new Button();
	
	public function new(w:Int, h:Int) {
		input = new Input();
		grid.setRatio(w, h);
		grid.setSize(flash.Lib.current.stage.stageWidth, flash.Lib.current.stage.stageHeight);
		flash.Lib.current.addEventListener(Event.ENTER_FRAME, function(e:Event) {
			flash.Lib.current.removeChildren();
			#if !android
			if (timer % 10 == 0) grid.setSize(flash.Lib.current.stage.stageWidth, flash.Lib.current.stage.stageHeight);
			#end
			Wumbo.update((flash.Lib.getTimer() - timer) * .001);
			timer = flash.Lib.getTimer();
		});
		
	}
}