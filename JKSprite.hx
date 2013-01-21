package jkEngine;

import nme.display.DisplayObjectContainer;
import nme.display.Bitmap;
import nme.events.Event;
import nme.Lib;
 
class JKSprite extends JKObject
{		
	public var isShown : Bool = false;	
	public var xAcceleration : Float = 0;
	public var yAcceleration : Float = 0;
	var layer : DisplayObjectContainer;
	var Graphic : Bitmap;
	
	public function new( xPos : Float = 0, yPos : Float = 0, ?theWidth : Float
		, ?theHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer ) 
	{
		super();
		
		layer = theLayer;										// We save the layer
		
		// Set the positions
		x = xPos;
		y = yPos;
		
		// Set the dimensions
		if ( theWidth != null )
			width = theWidth;
			
		if ( theHeight != null )
			height = theHeight;
			
		// Set the graphic
		if ( graphicFileLocation != null )
			loadGraphic(graphicFileLocation);
				
		// Setting of layer
		if ( layer == null )
			layer = Lib.stage;	
			
		layer.addChild(this);									// We add this object to layer
	}
	
	/**
	 * Loads the graphic from a specified file location and adds it to this object
	 * @param	fileLocation	The file location to load the graphic from
	 */
	function loadGraphic(fileLocation : String)
	{				
		Graphic = new Bitmap(ApplicationMain.getAsset(fileLocation));	// We load the bitmap from the file location
		addChild(Graphic);										// We add the graphic to this object					
	}
	
	override private function update():Dynamic 
	{
		super.update();
		ApplyMovement();
	}	
	
	/**
	 * Applies movement changes
	 */
	function ApplyMovement()
	{
		if ( xAcceleration != 0 )
			x += xAcceleration;
		
		if ( yAcceleration != 0 )
			y += yAcceleration;
	}
	
	/**
	 * Shows this object by adding it to the layer
	 */
	public function show()
	{
		isShown = true;
		layer.addChild(this);
	}
	
	/**
	 * Hides this object by removing it from the layer
	 */
	public function hide()
	{
		isShown = false;
		layer.removeChild(this);
	}	
	
	override public function destroy():Dynamic 
	{		
		isShown = false;									// We unshow the object
		layer.removeChild(this);							// We remove the object from its layer
		super.destroy();									// We then start destroying
	}
}