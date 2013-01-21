package jkEngine;

/**
 * ...
 * @author Karlo
 */

class JK2DArray
{
	var pitch: Int; 
	var array : Array<Dynamic>;
	
    public function new(width: Int, height: Int) 
    { 
		array = new Array<Dynamic>();		 
		pitch = width;
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
	public function traceAllContent()
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
		
		trace(toDisplay);						// We display the generated string
	}	
}