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
	var screenCenter : JKPoint;
	
	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/	
	public function new() 
	{
		screenCenter = getScreenCenter();
		trace(screenCenter.x + "," + screenCenter.y);
		super();
		
		keyboard = new JKKeyboard();					// We set up the keyboard
		mouse = new JKMouse();							// We set up the mouse		
		
		eventDispatcher = new EventDispatcher();		// We setup the eventDispatcher		
		Lib.stage.addEventListener(Event.RESIZE, onScreenResize);		
	}
	
	/********************************************************************************
	 * SCREEN
	 * ******************************************************************************/	
	function onScreenResize(e : Event) : Void
	{
		screenCenter = getScreenCenter();
		trace(screenCenter.x + "," + screenCenter.y);
	}
	
	function getScreenCenter() : JKPoint
	{
		return new JKPoint((Lib.stage.stageWidth / 2), (Lib.stage.stageHeight / 2));
	}
}