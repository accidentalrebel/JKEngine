package jkEngine;

import nme.display.DisplayObjectContainer;
import nme.display.Bitmap;
import nme.events.Event;
import nme.geom.Rectangle;
import nme.Lib;
import nme.utils.Timer;
 
class JKSprite extends JKObject
{		
	public var isShown : Bool = false;	
	public var xAcceleration : Float = 0;
	public var yAcceleration : Float = 0;
	private var frameWidth : Null<Float>;
	private var frameHeight : Null<Float>;
		
	var animationList : Hash<Array<Int>>;
	var canPlayAnimation : Bool = false;
	var layer : DisplayObjectContainer;
	var spriteGraphic : Bitmap;
	
	var isAnimated : Bool;
	var lastAnimationFrame : Float;
	var currentAnimation : String;
	
	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/
	public function new( xPos : Float = 0, yPos : Float = 0, ?FrameWidth : Float
		, ?FrameHeight : Float, ?graphicFileLocation : String, IsAnimated : Bool = false, ?theLayer : DisplayObjectContainer ) 
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
		
		// We set up the animation
		isAnimated = IsAnimated;		
		if ( isAnimated )
		{
			animationList = new Hash<Array<Int>>();			
		}
	}
	
	override private function update():Dynamic 
	{
		super.update();
		ApplyMovement();
		
		if ( isAnimated && canPlayAnimation )
			applyAnimation();
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
		spriteGraphic = new Bitmap(ApplicationMain.getAsset(fileLocation));	// We load the bitmap from the file location
		
		// Set the frameWidth and Height
		if ( frameWidth == null )
			frameWidth = spriteGraphic.width;
		if ( frameHeight == null )
			frameHeight = spriteGraphic.height;
		
		spriteGraphic.scrollRect = new Rectangle(0, 0, frameWidth, frameHeight);
		addChild(spriteGraphic);										// We add the graphic to this object					
	}
	
	//function setScrollRect( newRect : Rectangle )
	//{
		//spriteGraphic.scrollRect = newRect;
	//}
	
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
	 * ANIMATION
	 * ******************************************************************************/
	public function addAnimation( AnimName : String, Frames : Array<Int>, FrameRate : Float = 0, Looped : Bool = true ) : Void
	{
		if ( !isAnimated )
		{
			trace("Cannot add animation. Sprite is not animated");
			return;
		}
		
		animationList.set(AnimName, Frames);
		trace(animationList.get(AnimName));
	}
	
	public function applyAnimation()
	{
		if ( !canPlayAnimation )
			return;
			
		if ( Lib.getTimer() - lastAnimationFrame > 1000 )
		{
			trace("firing");
			lastAnimationFrame = Lib.getTimer();
		}
	}
	
	public function play(animationToPlay : String)
	{
		currentAnimation = animationToPlay;		
		canPlayAnimation = true;
		lastAnimationFrame = Lib.getTimer();
	}
	
	public function stop()
	{
		canPlayAnimation = false;
	}
	
	/********************************************************************************
	 * DESTROY
	 * ******************************************************************************/
	override public function destroy():Dynamic 
	{		
		isShown = false;									// We unshow the object
		removeChild(spriteGraphic);
		layer.removeChild(this);							// We remove the object from its layer
		super.destroy();									// We then start destroying
	}
}