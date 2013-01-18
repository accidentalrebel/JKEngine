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
}