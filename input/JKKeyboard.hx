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
	var keyCode : Hash<Int>;
	var pressedKeyList : Array<Int>;

	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/	
	public function new() 
	{
		pressedKeyList = new Array<Int>();
		keyCode = new Hash<Int>();
		setupKeyCodeHash();
		
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
	 * INITIALIZATION
	 * ******************************************************************************/	
	/**
	 * We assign a keyCode integer to a string for easy access
	 */
	function setupKeyCodeHash()
	{
		keyCode.set("w", 87);
		keyCode.set("a", 65);
		keyCode.set("s", 83);
		keyCode.set("d", 68);
		keyCode.set("spacebar", 32);
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
	public function checkIfKeyPressed(toCheck : String) : Bool
	{
		for ( pressed in pressedKeyList )
		{
			if ( pressed == keyCode.get(toCheck.toLowerCase()) )
			{
				return true;
			}
		}
		
		return false;
	}	
}