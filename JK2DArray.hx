package jkEngine;
import nme.Lib;

/**
 * ...
 * @author Karlo
 */

class JK2DArray extends JKSprite
{
	var pitch: Int; 
	public var array : Array<Dynamic>;
	public var arrayWidth : Int;
	public var arrayHeight : Int;
	
    public function new(_width: Int, _height: Int, ?toPopulateWith : Dynamic) 
    { 
		super();
		
		array = new Array<Dynamic>();		 
		arrayWidth = _width;
		arrayHeight = _height;
		pitch = _width;
		
		populate(toPopulateWith);		
    }
	
	public function populate(?toPopulateWith : Dynamic)
	{
		for ( i in 0...arrayWidth )
		{
			for ( j in 0...arrayHeight )
			{
				set(toPopulateWith, i, j);
			}
		}
	}

	/**
	 * Get's the content of the array at the x and y positions
	 * @param	xPos	the x position
	 * @param	yPos	the y position
	 */
    public function get(xPos: Int, yPos: Int) 
    {
		return array[yPos * pitch + xPos]; 
    }
		
	/**
	 * Places a value "toPut" at the specified x and y positions
	 * @param	toPut	The object to be placed at position
	 * @param	xPos	The x position
	 * @param	yPos	The y position
	 */
	public function set(toPut : Dynamic, xPos: Int, yPos: Int) 
    { 
		array[yPos * pitch + xPos] = toPut;
    }
	
	/**
	 * Displays the content of the whole array using trace()
	 */
	public function displayAllContent()
	{
		var xElementCount : Int = 1;
		var i : Int = 0;
		var toDisplay : String = "\n";			// We set up the toDisplay string
		for ( element in array )				// We loop through each element
		{
			if ( element == null )				// If the element is empty, "N" is displayed
				toDisplay += "N";
			else
				toDisplay += "1";				// If element is not empty, "1" is displayed
			
			if ( xElementCount >= pitch )		// This checks whether we should go to the next line
			{
				xElementCount = 0;				// We reset the xElement count
				toDisplay += "\n";				// We then add a new line
			}
			
			xElementCount ++;
			i++;
		}
		
		Lib.trace(toDisplay);						// We display the generated string
	}	
}