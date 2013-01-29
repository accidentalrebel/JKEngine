package jkEngine.input;
import nme.events.KeyboardEvent;
import nme.events.MouseEvent;
import nme.Lib;
/**
 * ...
 * @author Karlo
 */

class JKKeyboard extends JKObject
{
	var lastKeyPressed : Null<Int>;
	var pressedKeyList : Array<Int>;

	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/	
	public function new() 
	{
		pressedKeyList = new Array<Int>();
		
		super();
		lastKeyPressed = null;
		
		Lib.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);			// We listen to a KEY_DOWN event
		Lib.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);			// WE listen to a KEY_UP event		
	}
	
	override private function lateUpdate():Dynamic 
	{
		super.lateUpdate();		
	}
	
	/********************************************************************************
	 * KEYPRESS LISTENERS
	 * ******************************************************************************/	
	/**
	 * Handles what happens when a keyboard key is pressed
	 * @param	e
	 */
	function onKeyPress (e : KeyboardEvent) : Void
	{	
		lastKeyPressed = e.keyCode;
		addToPressedKeyList(e.keyCode);								// We take note of the key that was pressed
	}
	
	/**
	 * Handles what happens when a keyboard key is released
	 * @param	e
	 */
	function onKeyRelease( e : KeyboardEvent ) : Void
	{
		removeFromPressedKeyList(e.keyCode);
	}
	
	/********************************************************************************
	 * PRESSED KEY LIST
	 * ******************************************************************************/	
	function addToPressedKeyList( toAdd : Int )
	{
		for ( pressed in pressedKeyList )
		{
			if ( pressed == toAdd )
				return;
		}
		
		pressedKeyList.push(toAdd);
	}
	
	function removeFromPressedKeyList( toRemove : Int )
	{
		pressedKeyList.remove(toRemove);
	}
			
	/**
	 * Returns the currently pressed key
	 * @return	Currently pressed key
	 */
	public function getLastKeyPressed() : Null<Int>
	{		
		return lastKeyPressed;		
	}
	
	/**
	 * Checks if there is are keys that are currently pressed
	 * @return	True if a key is pressed. Otherwise, false
	 */
	public function isAnyKeyPressed() : Bool
	{
		if ( pressedKeyList.length != 0 )
			return true;
			
		return false;
	}
	
	/**
	 * Checks if a specified key is pressed for this frame
	 * @param	toCheck		The key to check
	 * @return	True if the key is pressed. Otherwise, false
	 */
	public function checkIfKeyPressed(toCheck : Int) : Bool
	{
		for ( pressed in pressedKeyList )
		{
			if ( pressed == toCheck )
			{
				return true;
			}
		}
		
		return false;
	}	
}