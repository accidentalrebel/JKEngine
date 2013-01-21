package jkEngine;
import nme.display.DisplayObjectContainer;
import nme.display.Sprite;
/**
 * ...
 * @author Karlo
 */

class JKScene extends JKSprite
{
	public var isShown : Bool = false;
	
	public function new(?_layer : DisplayObjectContainer) 
	{
		super();
		
		layer = _layer;		
		
		layer.addChild(this);
		hide();
	}
	
	public function show()
	{
		isShown = true;
		layer.addChild(this);
	}
	
	public function hide()
	{
		isShown = false;
		layer.removeChild(this);
	}	
	
	override public function Destroy():Dynamic 
	{
		isShown = false;		
		return super.Destroy();
	}
}