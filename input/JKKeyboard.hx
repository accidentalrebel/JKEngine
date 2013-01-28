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
	var pressedKey : Null<Int>;
	var isMousePressed : Bool;
	var isKeyPressed : Bool = false;
	var keyCode : Hash<Int>;
	var pressedKeyList : Array<Int>;

	public function new() 
	{
		pressedKeyList = new Array<Int>();
		keyCode = new Hash<Int>();
		setupKeyCodeHash();
		
		super();
		pressedKey = null;
		
		Lib.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);			// We listen to a KEY_DOWN event
		Lib.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);			// WE listen to a KEY_UP event		
	}
	
	function setupKeyCodeHash()
	{
		keyCode.set("w", 87);
		keyCode.set("a", 65);
		keyCode.set("s", 83);
		keyCode.set("d", 68);
		keyCode.set("spacebar", 32);
	}
	
	/**
	 * Handles what happens when a keyboard key is pressed
	 * @param	e
	 */
	function onKeyPress (e : KeyboardEvent) : Void
	{	
		addToPressedKeyList(e.keyCode);		
		
		if ( !isKeyPressed )										// Only do this if no key is currently being pressed
		{
			pressedKey = e.keyCode;									// We save the pressed Key
			isKeyPressed = true;									// Set flag
		}
	}
	
	function addToPressedKeyList( toAdd : Int )
	{
		for ( pressed in pressedKeyList )
		{
			if ( pressed == toAdd )
				return;
		}
		
		pressedKeyList.push(toAdd);
		trace("added " + toAdd);
	}
	
	function removeFromPressedKeyList( toRemove : Int )
	{
		pressedKeyList.remove(toRemove);
		trace("removed " + toRemove);
	}
	
	/**
	 * Handles what happens when a keyboard key is released
	 * @param	e
	 */
	function onKeyRelease( e : KeyboardEvent ) : Void
	{
		removeFromPressedKeyList(e.keyCode);
		
		if ( isKeyPressed )											// Only do this if key is currently being pressed
		{
			if ( e.keyCode == pressedKey )							// Make sure that the released key is the currentKey pressed	
			{				
				pressedKey = null;									// We set the pressedKey to null
			}
			isKeyPressed = false;									// Set flag
		}	
	}
			
	/**
	 * Returns the currently pressed key
	 * @return	Currently pressed key
	 */
	public function getPressedKey() : Null<Int>
	{		
		return pressedKey;		
	}
	
	/**
	 * Checks if there is a key that is currently pressed for this frame
	 * @return	True if a key is pressed. Otherwise, false
	 */
	public function isAnyKeyPressed() : Bool
	{
		if ( pressedKey != null )
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
		if ( pressedKey == keyCode.get(toCheck.toLowerCase()) )
			return true;
		else
			return false;
	}
	
	public function checkIfKeyReleased(toCheck : String) : Bool
	{
		if ( pressedKey != keyCode.get(toCheck.toLowerCase()) )
			return true;
		else
			return false;
	}
	
	override private function lateUpdate():Dynamic 
	{
		super.lateUpdate();		
		//pressedKey = null;				// We reset the value for the next frame
		isMousePressed = false;
	}
}