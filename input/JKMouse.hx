package jkEngine.input;
import jkEngine.JKObject;
import jkengine.JKPoint;
import nme.events.MouseEvent;
import nme.Lib;

/**
 * ...
 * @author Karlo
 */
 
class JKMouse extends JKObject
{
	var mousePressed : Int ;
	var isMousePressed : Bool = false;
	
	public function new() 
	{
		super();
		
		Lib.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);			// WE listen to a KEY_UP event
	}
	
	function onMouseDown(e : MouseEvent)
	{
		isMousePressed = true;
	}
	
	public function justPressed() : Bool
	{
		return isMousePressed;
	}
	
	override private function lateUpdate():Dynamic 
	{
		super.lateUpdate();
		
		isMousePressed = false;
	}
}