package jkEngine;

import nme.Lib;
import nme.events.Event;
import nme.events.EventDispatcher;

class JKGame
{
	var eventDispatcher : EventDispatcher;
	public var inputHandler : JKInput;
	
	public function new() 
	{
		inputHandler = new JKInput();									// We automatically set up JKInput	
		new JKLayers();									// We automatically set up the Layers
		
		eventDispatcher = new EventDispatcher();		// We setup the eventDispatcher
		InitializeLoopTimer();							// We initialize the loop timer		
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