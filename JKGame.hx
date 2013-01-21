package jkEngine;

import nme.Lib;
import nme.events.Event;
import nme.events.EventDispatcher;

class JKGame
{
	var eventDispatcher : EventDispatcher;
	
	public function new() 
	{
		new JKInput();									// We automatically set up JKInput	
		new JKLayers();									// We automatically set up the Layers
		
		eventDispatcher = new EventDispatcher();		// We setup the eventDispatcher
		InitializeLoopTimer();							// We initialize the loop timer
	}
	
	/**
	 * Listens to enterFrame which constitutes the game loop
	 */
	function InitializeLoopTimer()
	{
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, GameLoop);
	}
	
	function GameLoop(e: Event):Void
	{			
		Lib.current.stage.dispatchEvent(new JKEvent(JKEvent.UPDATE_LOOP));
		lateGameLoop();
	}
	
	function lateGameLoop() : Void
	{
		Lib.current.stage.dispatchEvent(new JKEvent(JKEvent.FIXED_UPDATE_LOOP));
	}
}