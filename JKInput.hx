package jkEngine;
import nme.events.KeyboardEvent;
import nme.Lib;
/**
 * ...
 * @author Karlo
 */

class JKInput extends JKObject
{
	public static var pressedKey : Null<Int>;
	var isKeyPressed : Bool = false;

	public function new() 
	{
		super();
		pressedKey = null;
		
		Lib.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		Lib.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
	}
	
	function onKeyPress (e : KeyboardEvent) : Void
	{	
		if ( !isKeyPressed )			// Only do this if no key is currently being pressed
		{
			pressedKey = e.keyCode;		// We save the pressed Key
			isKeyPressed = true;		// Set flag
		}
	}
	
	function onKeyRelease( e : KeyboardEvent ) : Void
	{
		if ( isKeyPressed )				// Only do this if key is currently being pressed
			isKeyPressed = false;		// Set flag
	}
	
	public function getKeyboardPress() : Null<Int>
	{
		if ( !isKeyPressed )			
			return pressedKey;
		else
			return null;
	}
	
	override private function LateUpdate():Dynamic 
	{
		super.LateUpdate();
		
		pressedKey = null;				// We reset the value for the next frame
	}
	
	
}