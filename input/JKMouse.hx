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
	public var position : JKPoint;
	
	public function new() 
	{
		super();
		
		position = new JKPoint();
		Lib.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);			
		Lib.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);			
	}
	
	function onMouseDown(e : MouseEvent)
	{		
		isMousePressed = true;		
	}
	
	function onMouseMove(e : MouseEvent )
	{
		position.x = e.stageX;
		position.y = e.stageY;
		
	}
	
	public function justPressed() : Bool
	{
		return isMousePressed;
	}
	
	override private function update():Dynamic 
	{
		super.update();
	}
	
	override private function lateUpdate():Dynamic 
	{
		super.lateUpdate();
		
		isMousePressed = false;
	}
}