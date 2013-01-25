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
	var tileValue : Int = 0;
	
	/*********************************************************************************************
	 * MAIN 
	 * *******************************************************************************************/
	public function new( XCoord : Int = 0, YCoord : Int = 0, ?TileWidth : Float
		, ?TileHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer, TileValue : Int = 0 ) 
	{
		super(x, y, TileWidth, TileHeight, graphicFileLocation, theLayer);		
		setCoordinates(XCoord, YCoord);
	}
	
	/*********************************************************************************************
	 * COORDINATES
	 * *******************************************************************************************/
	public function setCoordinates( X : Int, Y : Int)
	{
		xCoord = X;
		yCoord = Y;
		
		x = xCoord * frameWidth;
		y = yCoord * frameHeight;
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