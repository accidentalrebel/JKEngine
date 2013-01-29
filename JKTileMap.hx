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
	
	/**
	 * Populates the whole map with the given class
	 * @param	myClass			The class to instantiate with	
	 * @param	parameters		The parameters that will be set for the class
	 */
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

	/**
	 * Instantiates the tile class according to the given map data and places them in their respective positions
	 * @param	MapData			The map data
	 * @param	myClass			The class to insntiate
	 * @param	parameters		The parameters for the class. Note: Class must have a constructor for XCoord and YCoord.
	 */
	public function loadMap<T>(MapData: String, myClass : Class<T>, parameters : Array<Dynamic>)
	{
		var valueIndex : Int = parameters.length;
		for ( j in 0...arrayHeight )
		{
			for ( i in 0...arrayWidth )
			{	
				parameters[0] = i;												// We override the value of xCoordinate
				parameters[1] = j;												// We override the value of yCoordinate
				parameters[valueIndex] = Std.parseInt(MapData.charAt(( j * arrayWidth ) + i ));		// We set the tile value according to the map data
				var instance = Type.createInstance(myClass, parameters);		// We create the class instance
				set(instance, i, j);											// We set the instance inside our array
			}
		}
	}
}