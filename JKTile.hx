package jkEngine;
import nme.display.DisplayObjectContainer;
/**
 * ...
 * @author Karlo
 */

class JKTile extends JKSprite
{
	private var xCoord : Int = 0;
	private var yCoord : Int = 0;
	
	/*********************************************************************************************
	 * MAIN 
	 * *******************************************************************************************/
	public function new( XCoord : Int = 0, YCoord : Int = 0, ?theWidth : Float
		, ?theHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer ) 
	{
		super(x, y, theWidth, theHeight, graphicFileLocation, theLayer);		
		setCoordinates(XCoord, YCoord);
	}
	
	/*********************************************************************************************
	 * COORDINATES
	 * *******************************************************************************************/
	public function setCoordinates( X : Int, Y : Int)
	{
		xCoord = X;
		yCoord = Y;
		
		x = xCoord * width;
		y = yCoord * height;
	}
	
	public function getXCoord() : Int
	{
		return xCoord;
	}
	
	public function getYCoord() : Int
	{
		return yCoord;
	}
}