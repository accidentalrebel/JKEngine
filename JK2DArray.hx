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

    public function get(width: Int, height: Int) 
    {
		return array[height * pitch + width]; 
    }
	
	public function set(toPut : Dynamic, width: Int, height: Int) 
    { 
		array[height * pitch + width] = toPut;
    }
	
	public function traceAllContent()
	{
		var xElementCount : Int = 1;
		var i : Int = 0;
		var toDisplay : String = "\n";
		for ( element in array )
		{
			if ( element == null )
				toDisplay += "N";
			else
				toDisplay += "1";
			
			if ( xElementCount >= pitch )
			{
				xElementCount = 0;
				toDisplay += "\n";
			}
			
			xElementCount ++;
			i++;
		}
		
		trace(toDisplay);
	}	
}