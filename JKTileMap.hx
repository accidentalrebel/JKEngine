package jkEngine;
import jkEngine.JK2DArray;
import nme.display.DisplayObjectContainer;
/**
 * ...
 * @author Karlo
 */

class JKTileMap extends JK2DArray
{
	public function new(_width: Int, _height: Int, theLayer : DisplayObjectContainer) 
	{
		super(_width, _height, theLayer);		
		populateTileMap(theLayer);
	}
	
	function populateTileMap(theLayer : DisplayObjectContainer) : Void
	{
		for ( i in 0...arrayWidth )
		{
			for ( j in 0...arrayHeight )
			{	
				set(new JKTile(i, j, theLayer), i, j);
			}
		}
	}	
}