package jkEngine;
import nme.display.DisplayObjectContainer;
import nme.display.Sprite;
/**
 * ...
 * @author Karlo
 */

class JKScene extends Sprite
{
	var layer : DisplayObjectContainer;

	public function new(?_layer : DisplayObjectContainer) 
	{
		super();
		
		layer = _layer;		
		show();
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