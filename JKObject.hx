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
	}
	
	private function updateLoop(event:Event)
	{		
		Update();
	}
	
	private function lateUpdateLoop(event:Event)
	{		
		LateUpdate();
	}	
	
	function Update()
	{
		// Intentionally left blank that can be overriden by children
	}
	
	function LateUpdate()
	{
		// Intentionally left blank that can be overriden by children
	}
	
	public function Destroy()
	{		
		Lib.current.stage.removeEventListener(JKEvent.LATE_UPDATE_LOOP, LateUpdateLoop);	// We remove the listener for update loop event
		Lib.current.stage.removeEventListener(JKEvent.UPDATE_LOOP, UpdateLoop);				// We remove the listener for the late update loop event
	}
}