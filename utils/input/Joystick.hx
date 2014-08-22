package utils.input;
import openfl.events.JoystickEvent;
import w2d.Wumbo;

class Joystick {
	
	private var ctrlCode:Array<Array<Int>>;
	public var controller:Int;
	private var deviceCode:Array<Int>;
	
	public function new() {
		ctrlCode = new Array<Array<Int>>();
		ctrlCode[0] = new Array<Int>();
		deviceCode = new Array<Int>();
		controller = 0;
		flash.Lib.current.stage.addEventListener( JoystickEvent.DEVICE_ADDED, function(e:JoystickEvent) {
			deviceCode.insert(deviceCode.length, e.device);
			ctrlCode.insert(getCtrlr(e), new Array<Int>());
			controller++;
		});
		
		/*flash.Lib.current.stage.addEventListener( JoystickEvent.DEVICE_REMOVED, function(e:JoystickEvent) {
			ctrlCode.remove(ctrlCode[e.device]);
			deviceCode.remove(deviceCode.indexOf(e.device)-1);
		});*/
		
		flash.Lib.current.stage.addEventListener( JoystickEvent.AXIS_MOVE, function(e:JoystickEvent) {
			fixCtrlr(e);
			#if android
			var length = 14;
			#end
			#if !android
			var length = 10;
			#end
			for (i in 0...length) ctrlCode[getCtrlr(e)].remove(i);
			for (i in axisCode(e)) ctrlCode[getCtrlr(e)].insert(i, i);
			//controller = e.device;
			Wumbo.refresh();
		});
		
		flash.Lib.current.stage.addEventListener(JoystickEvent.BUTTON_DOWN, function(e:JoystickEvent) {
			fixCtrlr(e);
			var code:Int = translateCode(e.id + 14);
			
			if (code != -1) {
				ctrlCode[getCtrlr(e)].remove(code);
				ctrlCode[getCtrlr(e)].insert(code, code);
			}
			//controller = e.device;
			Wumbo.refresh();
		});
		flash.Lib.current.stage.addEventListener(JoystickEvent.BUTTON_UP, function(e:JoystickEvent) {
			fixCtrlr(e);
			var code:Int = translateCode(e.id + 14);
			ctrlCode[getCtrlr(e)].remove(code);
			//controller = e.device;
			Wumbo.refresh();
		});
		
	}
	static public function axisCode(e:JoystickEvent) {
		var ctrlCode:Array<Int> = new Array<Int>();
		
			if (e.x >= .5) ctrlCode.insert(ctrlCode.length, 2);
			else if (e.x <= -.5) ctrlCode.insert(ctrlCode.length, 0);

			if (e.y >= .5) ctrlCode.insert(ctrlCode.length, 3);
			else if (e.y <= -.5) ctrlCode.insert(ctrlCode.length, 1);
		#if !android
			if (e.z >= .5) ctrlCode.insert(ctrlCode.length, 6);
			else if (e.z <= -.5) ctrlCode.insert(ctrlCode.length, 4);

			if (e.axis[3] >= .5) ctrlCode.insert(ctrlCode.length, 7);
			else if (e.axis[3] <= -.5) ctrlCode.insert(ctrlCode.length, 5);
		#end
		#if android
			if (e.axis[11] >= .5) ctrlCode.insert(ctrlCode.length, 6);
			else if (e.axis[11] <= -.5) ctrlCode.insert(ctrlCode.length, 4);

			if (e.axis[14] >= .5) ctrlCode.insert(ctrlCode.length, 7);
			else if (e.axis[14] <= -.5) ctrlCode.insert(ctrlCode.length, 5);
		#end

			if (e.axis[e.axis.length - 2] >= 0) ctrlCode.insert(ctrlCode.length, 8);
			if (e.axis[e.axis.length - 1] >= 0) ctrlCode.insert(ctrlCode.length, 9);
		#if android
			if (e.axis[e.axis.length - 3] < -.5) ctrlCode.insert(ctrlCode.length, 10);
			else if (e.axis[e.axis.length - 3] > .5) ctrlCode.insert(ctrlCode.length, 11);

			if (e.axis[e.axis.length - 4] < -.5) ctrlCode.insert(ctrlCode.length, 12);
			else if (e.axis[e.axis.length - 4] > .5) ctrlCode.insert(ctrlCode.length, 13);
		#end
		return ctrlCode;
	}
	
	static public function translateCode(code:Int) {
		#if android
			if (code == 21) code = 23;
			else if (code == 20) code = 22;
			else if (code == 14) code = 24;
			else if (code == 15) code = 25;
			else if (code == 18) code = 27;
			else if (code == 17) code = 26;
			else if (code == 24) code = 20;
			else if (code == 25) code = 21;
			else if (code == 26) code = 18;
			else if (code == 23 || code == 22) code = -1;
		#end
		#if !android
			if (code == 14) code = 10;
			else if (code == 15) code = 11;
			else if (code == 16) code = 12;
			else if (code == 17) code = 13;
		#end
		
		return code;
	}
	
	public function getJoyCode() {
		return ctrlCode;
	}
	
	public function ctrlPressed(ctrlC:Int) {
		var pressed:Bool = false;
		for (i in ctrlCode[0])
			if (i == ctrlC) pressed = true;
		return pressed;
	}
	
	public function getCtrlr(e:JoystickEvent) {
		return deviceCode.indexOf(e.device);
	}
	
	public function fixCtrlr(e:JoystickEvent) {
		for (i in deviceCode)
			if (i == e.device) return;
		deviceCode.insert(deviceCode.length, e.device);
		ctrlCode.insert(getCtrlr(e), new Array<Int>());
		controller++;
	}
}