package jkEngine;
import nme.display.DisplayObjectContainer;
import nme.display.Sprite;
/**
 * ...
 * @author Karlo
 */

class JKScene extends JKSprite
{
	public function new(?_layer : DisplayObjectContainer) 
	{
		super();
		
		layer = _layer;		
		
		layer.addChild(this);
		hide();
	}
	
	public function show()
	{
		layer.addChild(this);
	}
	
	public function hide()
	{
		layer.removeChild(this);
	}	
}