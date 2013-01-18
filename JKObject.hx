package jkEngine;

 import nme.display.Sprite;
 import nme.Lib;
 import nme.events.Event;
 
class JKObject extends Sprite
{			
	public function new() 
	{
		super();	
		Lib.current.stage.addEventListener(JKEvent.UPDATE_LOOP, UpdateLoop);
		Lib.current.stage.addEventListener(JKEvent.FIXED_UPDATE_LOOP, LateUpdateLoop);
	}
	
	private function UpdateLoop(event:Event)
	{		
		Update();
	}
	
	private function LateUpdateLoop(event:Event)
	{		
		LateUpdate();
	}	
	
	function Update()
	{
		
	}
	
	function LateUpdate()
	{
		
	}
	
	public function Destroy()
	{
		Lib.current.stage.removeEventListener(JKEvent.UPDATE_LOOP, UpdateLoop);
	}
}