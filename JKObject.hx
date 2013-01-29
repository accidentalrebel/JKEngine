package jkEngine;

 import jkEngine.JKPoint;
 import nme.display.Sprite;
 import nme.Lib;
 import nme.events.Event;
 
class JKObject extends Sprite
{			
	public var objectName : String;
	var velocity : JKPoint;
	var velocityDelta : JKPoint;
	var acceleration : JKPoint;
	var maxVelocity : JKPoint;
	
	public function new() 
	{
		velocity = new JKPoint(0, 0);
		velocityDelta = new JKPoint(0, 0);
		maxVelocity = new JKPoint(1, 1);
		acceleration = new JKPoint(0, 0);
		
		super();	
		Lib.current.stage.addEventListener(JKEvent.UPDATE_LOOP, updateLoop);				// We listen for an update loop event
		Lib.current.stage.addEventListener(JKEvent.LATE_UPDATE_LOOP, lateUpdateLoop);		// We listen for a late update loop event
	}
	
	/********************************************************************************
	 * LISTENERS
	 * ******************************************************************************/	
	private function updateLoop(event:Event)
	{		
		update();
	}
	
	private function lateUpdateLoop(event:Event)
	{		
		lateUpdate();
	}	
	
	/********************************************************************************
	 * LOOPS
	 * ******************************************************************************/	
	function update()
	{
		// Intentionally left blank that can be overriden by children
	}
	
	function lateUpdate()
	{
		// Intentionally left blank that can be overriden by children
	}
	
	/********************************************************************************
	 * DESTROY
	 * ******************************************************************************/	
	public function destroy()
	{		
		Lib.current.stage.removeEventListener(JKEvent.LATE_UPDATE_LOOP, lateUpdateLoop);	// We remove the listener for update loop event
		Lib.current.stage.removeEventListener(JKEvent.UPDATE_LOOP, updateLoop);				// We remove the listener for the late update loop event
	}
	
	/********************************************************************************
	 * MOVEMENT
	 * ******************************************************************************/	
	/**
	 * Applies movement changes
	 */
	function ApplyMovement()
	{
		// We apply acceleration for Y
		if ( acceleration.y != 0 )
		{
			velocity.y += acceleration.y;													// We apply the acceleration to the velocity
			acceleration.y -= velocity.y;													// After application, we reduce the acceleration amount
		}
		
		// We apply acceleration for X
		if ( acceleration.x != 0 )
		{
			velocity.x += acceleration.x;
			acceleration.x -= velocity.x;
		}
		
		// We apply the velocity for Y
		if ( velocityDelta.y < maxVelocity.y )
		{
			if ( velocity.y != 0 )
				velocityDelta.y += velocity.y;												
		}
		
		// We apply the velocity for x
		if ( velocityDelta.x < maxVelocity.x )
		{
			if ( velocity.x != 0 )
				velocityDelta.x += velocity.x;
		}
		
		// We adjust the positions
		y += velocityDelta.y;																
		x += velocityDelta.x;	
	}
	
	
}