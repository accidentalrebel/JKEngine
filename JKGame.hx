package jkEngine;

import jkEngine.input.JKMouse;
import nme.display.DisplayObjectContainer;
import nme.Lib;
import nme.events.Event;
import nme.events.EventDispatcher;
import jkEngine.input.JKKeyboard;

class JKGame
{
	var eventDispatcher : EventDispatcher;
	public var keyboard : JKKeyboard;
	public var mouse : JKMouse;
	public var stage : DisplayObjectContainer;
	
	public function new() 
	{
		keyboard = new JKKeyboard();					// We set up the keyboard
		mouse = new JKMouse();							// We set up the mouse		
		
		eventDispatcher = new EventDispatcher();		// We setup the eventDispatcher
		InitializeLoopTimer();							// We initialize the loop timer	
		
		stage = Lib.stage;
	}
	
	/**
	 * Listens to enterFrame which constitutes the game loop
	 */
	function InitializeLoopTimer()
	{
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, update);		
	}
	
	function update(e: Event):Void
	{			
		Lib.current.stage.dispatchEvent(new JKEvent(JKEvent.UPDATE_LOOP));			// We dispatch an updateLoop event
		lateUpdate();																// Once the update has finished, we call the lateUpdate
	}
	
	function lateUpdate() : Void
	{
		Lib.current.stage.dispatchEvent(new JKEvent(JKEvent.LATE_UPDATE_LOOP));		// We dispatch lateUpdate loop event
	}
}