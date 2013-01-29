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
	
	function populateTileMap<T>(myClass : Class<T>, parameters : Array<Dynamic>) : Void
	{
		for ( i in 0...arrayWidth )
		{
			for ( j in 0...arrayHeight )
			{				
				parameters[0] = i;
				parameters[1] = j;
				var instance = Type.createInstance(myClass, parameters);				
				set(instance, i, j);
			}
		}
	}
	
	public function loadMap(MapData: String)
	{
		for ( j in 0...arrayHeight )
		{
			for ( i in 0...arrayWidth )
			{	
				set(new Tile(i, j, 40, 40, "img/mapTiles.png", theLayer, Std.parseInt(MapData.charAt(( j * arrayWidth ) + i ))), i, j);
			}
		}
	}
}