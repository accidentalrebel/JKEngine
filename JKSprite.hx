package jkEngine;

import nme.display.DisplayObjectContainer;
import nme.display.Bitmap;
import nme.events.Event;
import nme.Lib;
 
class JKSprite extends JKObject
{		
	var Graphic : Bitmap;
	public var xAcceleration : Float = 0;
	public var yAcceleration : Float = 0;
	var layer : DisplayObjectContainer;
	
	public function new( xPos : Float = 0, yPos : Float = 0, ?theWidth : Float
		, ?theHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer ) 
	{
		super();
		
		layer = theLayer;
		
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
			LoadGraphic(graphicFileLocation);
		
		// Setting of layer
		if ( layer == null )
			layer = Lib.stage;			
				
		layer.addChild(this);				// Add to layer
	}
	
	function LoadGraphic(fileLocation : String)
	{				
		Graphic = new Bitmap(ApplicationMain.getAsset(fileLocation));	
		addChild(Graphic);	
	}
	
	override private function update():Dynamic 
	{
		super.update();
		ApplyMovement();
	}	
	
	function ApplyMovement()
	{
		if ( xAcceleration != 0 )
			x += xAcceleration;
		
		if ( yAcceleration != 0 )
			y += yAcceleration;
	}
	
	override public function destroy():Dynamic 
	{					
		layer.removeChild(this);
		super.destroy();
	}
}