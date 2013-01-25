package jkEngine;
import jkEngine.JK2DArray;
import nme.display.DisplayObjectContainer;
/**
 * ...
 * @author Karlo
 */

class JKTileMap extends JK2DArray
{
	var theLayer : DisplayObjectContainer;
	
	public function new(_width: Int, _height: Int, TheLayer : DisplayObjectContainer) 
	{
		theLayer = TheLayer;
		
		super(_width, _height, theLayer);		
		//populateTileMap(TheLayer);
	}
	
	function populateTileMap() : Void
	{
		for ( i in 0...arrayWidth )
		{
			for ( j in 0...arrayHeight )
			{	
				set(new JKTile(i, j, theLayer), i, j);
			}
		}
	}
	
	public function loadMap(MapData: String)
	{
		for ( i in 0...arrayWidth )
		{
			for ( j in 0...arrayHeight )
			{	
				set(new JKTile(i, j, theLayer, Std.parseInt(MapData.charAt(
					( i * arrayHeight ) + j ))
					), i, j);
			}
		}
	}
}