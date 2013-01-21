package jkEngine;

 import nme.display.Sprite;
 import nme.Lib;
 import nme.events.Event;
 
class JKObject extends Sprite
{			
	public function new() 
	{
		super();	
		Lib.current.stage.addEventListener(JKEvent.UPDATE_LOOP, updateLoop);				// We listen for an update loop event
		Lib.current.stage.addEventListener(JKEvent.LATE_UPDATE_LOOP, lateUpdateLoop);		// We listen for a late update loop event
		
		start();
	}
	
	private function updateLoop(event:Event)
	{		
		update();
	}
	
	private function lateUpdateLoop(event:Event)
	{		
		lateUpdate();
	}	
	
	function start()
	{
		// Intentionally left blank that can be overriden by children		
	}
	
	function update()
	{
		// Intentionally left blank that can be overriden by children
	}
	
	function lateUpdate()
	{
		// Intentionally left blank that can be overriden by children
	}
	
	public function destroy()
	{		
		Lib.current.stage.removeEventListener(JKEvent.LATE_UPDATE_LOOP, lateUpdateLoop);	// We remove the listener for update loop event
		Lib.current.stage.removeEventListener(JKEvent.UPDATE_LOOP, updateLoop);				// We remove the listener for the late update loop event
	}
}