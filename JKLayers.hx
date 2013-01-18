package jkEngine;
import nme.display.Sprite;
import nme.Lib;

/**
 * ...
 * @author Karlo
 */

class JKLayers 
{
	public static var overlayLayer : Sprite;
	public static var FGLayer : Sprite;
	public static var BGLayer : Sprite;
	
	public function new() 
	{
		overlayLayer = new Sprite();			
		BGLayer = new Sprite();
		FGLayer = new Sprite();
		Lib.stage.addChild(overlayLayer);
		Lib.stage.addChild(BGLayer);		
		Lib.stage.addChild(FGLayer);		
	}
}