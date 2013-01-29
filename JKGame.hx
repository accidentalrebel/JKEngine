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
	
	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/	
	public function new() 
	{
		super();
		
		keyboard = new JKKeyboard();					// We set up the keyboard
		mouse = new JKMouse();							// We set up the mouse		
		
		eventDispatcher = new EventDispatcher();		// We setup the eventDispatcher		
	}
}