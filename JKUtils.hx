package jkEngine;
import nme.geom.Rectangle;
import nme.Lib;
class JKUtils 
{	
	public function new() 
	{
		
	}	
	
	// TODO: Make use of the collision checking from the platformer project
	
	/**
	 * Checks if there is a collision
	 */
	public static function collide(?object1 : JKObject, ?group1 : Array<JKObject>, ?object2 : JKObject, ?group2 : Array<JKObject>) : Bool
	{
		var object1Bounds : Rectangle = object1.getBounds(Lib.stage);
		if ( object1.hitTestObject(object2))
		{
			trace("collision!");
			return true;
		}
		
		return false;
	}
}