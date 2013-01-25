package jkEngine;
import jkEngine.JK2DArray;

/**
 * ...
 * @author Karlo
 */

class JKTileMap extends JK2DArray
{
	public function new(_width: Int, _height: Int) 
	{
		super(_width, _height, null);		
		populateTileMap();
	}
	
	function populateTileMap() : Void
	{
		for ( i in 0...arrayWidth )
		{
			for ( j in 0...arrayHeight )
			{					
				set(new JKTile(i, j), i, j);
			}
		}
	}	
}