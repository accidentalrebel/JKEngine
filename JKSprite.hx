package jkEngine;

import nme.display.DisplayObjectContainer;
import nme.display.Bitmap;
import nme.events.Event;
import nme.geom.Rectangle;
import nme.Lib;
 
class JKSprite extends JKObject
{		
	public var isShown : Bool = false;	
	public var xAcceleration : Float = 0;
	public var yAcceleration : Float = 0;
	private var frameWidth : Null<Float>;
	private var frameHeight : Null<Float>;
	var layer : DisplayObjectContainer;
	var Graphic : Bitmap;
	
	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/
	public function new( xPos : Float = 0, yPos : Float = 0, ?FrameWidth : Float
		, ?FrameHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer ) 
	{
		super();
		
		layer = theLayer;										// We save the layer
				
		frameWidth = FrameWidth;
		frameHeight = FrameHeight;
		
		// Set the positions
		x = xPos;
		y = yPos;
			
		// Set the graphic
		if ( graphicFileLocation != null)
			loadGraphic(graphicFileLocation);
				
		// Setting of layer
		if ( layer == null )
			layer = Lib.stage;	
			
		layer.addChild(this);									// We add this object to layer
	}
	
	override private function update():Dynamic 
	{
		super.update();
		ApplyMovement();
	}	
	
	/********************************************************************************
	 * GRAPHIC
	 * ******************************************************************************/
	/**
	 * Loads the graphic from a specified file location and adds it to this object
	 * @param	fileLocation	The file location to load the graphic from
	 */
	function loadGraphic(fileLocation : String )
	{				
		Graphic = new Bitmap(ApplicationMain.getAsset(fileLocation));	// We load the bitmap from the file location
		
		// Set the frameWidth and Height
		if ( frameWidth == null )
			frameWidth = Graphic.width;
		if ( frameHeight == null )
			frameHeight = Graphic.height;
		
		Graphic.scrollRect = new Rectangle(0, 0, frameWidth, frameHeight);
		addChild(Graphic);										// We add the graphic to this object					
	}
	
	/********************************************************************************
	 * MOVEMENT
	 * ******************************************************************************/	
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
	
	/********************************************************************************
	 * VISIBILITY
	 * ******************************************************************************/	
	/**
	 * Shows this object by adding it to the layer
	 */
	public function show()
	{
		isShown = true;
		alpha = 1;
		//layer.addChild(this);
	}
	
	/**
	 * Hides this object by removing it from the layer
	 */
	public function hide()
	{
		isShown = false;
		alpha = 0;
		// layer.removeChild(this);
	}	
	
	/********************************************************************************
	 * DESTROY
	 * ******************************************************************************/
	override public function destroy():Dynamic 
	{		
		isShown = false;									// We unshow the object
		removeChild(Graphic);
		layer.removeChild(this);							// We remove the object from its layer
		super.destroy();									// We then start destroying
	}
}