package jkEngine;
import nme.display.DisplayObjectContainer;
/**
 * ...
 * @author Karlo
 */

class JKTile extends JKSprite
{

	public function new( xPos : Float = 0, yPos : Float = 0, ?theWidth : Float
		, ?theHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer ) 
	{
		super(xPos, yPos, theWidth, theHeight, graphicFileLocation, theLayer);
	}	
}