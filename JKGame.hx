package jkEngine;

import jkEngine.input.JKMouse;
import nme.display.DisplayObjectContainer;
import nme.Lib;
import nme.events.Event;
import nme.events.EventDispatcher;
import jkEngine.input.JKKeyboard;

class JKGame extends JKObject
{
	var eventDispatcher : EventDispatcher;
	public var keyboard : JKKeyboard;
	public var mouse : JKMouse;
	var center : JKPoint;
	
	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/	
	public function new() 
	{
		super();
		
		center = new JKPoint(0, 0);
		Lib.stage.addEventListener(Event.RESIZE, onScreenResize);		
		
		keyboard = new JKKeyboard();					// We set up the keyboard
		mouse = new JKMouse();							// We set up the mouse		
		
		eventDispatcher = new EventDispatcher();		// We setup the eventDispatcher		
	}
		
	/********************************************************************************
	 * SCREEN
	 * ******************************************************************************/	
	function onScreenResize(e : Event) : Void
	{
		center.x = (Lib.stage.stageWidth / 2);
		center.y = (Lib.stage.stageHeight / 2);
		trace(center.x + "," + center.y);
	}
}