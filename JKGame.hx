package jkEngine;

import nme.Lib;
import nme.events.Event;
import nme.events.EventDispatcher;

class JKGame
{
	var eventDispatcher : EventDispatcher;
	
	public function new() 
	{
		new JKInput();		
		new JKLayers();
		
		eventDispatcher = new EventDispatcher();		
		InitializeLoopTimer();
	}
	
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