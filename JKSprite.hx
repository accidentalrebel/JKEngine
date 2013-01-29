package jkEngine;

import nme.display.DisplayObjectContainer;
import nme.display.Bitmap;
import nme.events.Event;
import nme.geom.Rectangle;
import nme.Lib;
import nme.utils.Timer;
 
class AnimSet
{
	public var animName : String;
	public var animFrames : Array<Int>;
	public var animSpeed : Float;

	public function new(AnimName : String, AnimFrames : Array<Int>, AnimSpeed : Float)
	{
		animName = AnimName;
		animFrames = AnimFrames;
		animSpeed = AnimSpeed;
	}
}

enum GraphicDirection
{
	Left;
	Right;
}

class JKSprite extends JKObject
{		
	public var isShown : Bool = false;	
	public var xAcceleration : Float = 0;
	public var yAcceleration : Float = 0;
	private var frameWidth : Null<Float>;
	private var frameHeight : Null<Float>;
		
	var savedScreenSize : JKPoint;
	
	var animationList : Hash<AnimSet>;
	var canPlayAnimation : Bool = false;
	var layer : DisplayObjectContainer;
	var spriteGraphic : Bitmap;
	var currentGraphicDirection : GraphicDirection;
	
	var isAnimated : Bool;
	var currentlyPlaying : String;
	var lastAnimationFrame : Float;
	var currentAnimationSet : AnimSet;
	var currentFrame : Int = 0;
	var frameCount : Int = 0;
	
	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/
	public function new( xPos : Float = 0, yPos : Float = 0, ?FrameWidth : Float
		, ?FrameHeight : Float, ?graphicFileLocation : String, IsAnimated : Bool = false, ?theLayer : DisplayObjectContainer ) 
	{
		currentGraphicDirection = GraphicDirection.Right;
		
		super();
				
		layer = theLayer;										// We save the layer
				
		frameWidth = FrameWidth;
		frameHeight = FrameHeight;
		
		// Set the positions
		x = xPos;
		y = yPos;
		
		savedScreenSize = new JKPoint( Lib.stage.stageWidth, Lib.stage.stageHeight );
			
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
			animationList = new Hash<AnimSet>();			
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
		spriteGraphic = new Bitmap(ApplicationMain.getAsset(fileLocation));					// We load the bitmap from the file location
		
		// Set the frameWidth and Height
		if ( frameWidth == null )
			frameWidth = spriteGraphic.width;
		if ( frameHeight == null )
			frameHeight = spriteGraphic.height;
		
		spriteGraphic.scrollRect = new Rectangle(0, 0, frameWidth, frameHeight);
		addChild(spriteGraphic);															// We add the graphic to this object					
	}
	
	/**
	 * Updates the graphic rectangle viewport according to the current frame of animation
	 */
	function updateGraphicRect()
	{
		if ( spriteGraphic == null )
			return;
			
		spriteGraphic.scrollRect = new Rectangle(currentFrame * frameWidth, 0, frameWidth, frameHeight);
	}
	
	/**
	 * Flips the bitmap graphic according top the specified direction
	 * @param	direction	Left or Right
	 */
	function flipGraphic(direction : GraphicDirection)
	{		
		if ( currentGraphicDirection == direction )						// Dont do anything if we are already facing that direction
			return;
		
		if ( direction == GraphicDirection.Left )	
		{
			spriteGraphic.scaleX = -1;									// We flip the scale
			spriteGraphic.x += frameWidth;								// We adjust the x position
		}
		else
		{
			spriteGraphic.scaleX = 1;									// We normalize the scale
			spriteGraphic.x -= frameWidth;								// We adjust the x position
		}
		
		currentGraphicDirection = direction;
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
	}
	
	/**
	 * Hides this object by removing it from the layer
	 */
	public function hide()
	{
		isShown = false;
		alpha = 0;
	}	
	
	/********************************************************************************
	 * ANIMATION
	 * ******************************************************************************/
	/**
	 * Adds an animation for this sprite
	 * @param	AnimName			The name of the animation
	 * @param	Frames				The frames associated with this animation
	 * @param	AnimationSpeed		The speed of the animation
	 * @param	Looped				Whether the animation loops continuously or just plays once
	 */
	public function addAnimation( AnimName : String, Frames : Array<Int>, AnimationSpeed : Float = 0, Looped : Bool = true ) : Void
	{
		if ( !isAnimated )
		{
			trace("Cannot add animation. Sprite is not animated");
			return;
		}
		
		animationList.set(AnimName, new AnimSet(AnimName, Frames, AnimationSpeed));			// We create a new animation set and add it to the hash
	}
	
	/**
	 * Applies the animation per update
	 */
	public function applyAnimation()
	{
		if ( !canPlayAnimation )															// If we cannot play animation, do not continue
			return;
			
		if ( Lib.getTimer() - lastAnimationFrame > currentAnimationSet.animSpeed )			// Handles the timing
		{				
			updateGraphicRect();															// We update the rectangle viewport according to the newly set currentFrame
			lastAnimationFrame = Lib.getTimer();											// We then set the lastAnimationFrame
			frameCount ++;																	// We increase the frame count			
			currentFrame++;																	// We point to the next frame
			
			if ( frameCount >= currentAnimationSet.animFrames.length)						// Makes sure that we loop from the start if we reach the end
			{
				currentFrame = currentAnimationSet.animFrames[0];							// We point to the first frame of this animation
				frameCount = 0;																// We move the frame count 
			}
		}
	}
	
	/**
	 * Plays an animation
	 * @param	animationToPlay		The name of the animation to play
	 */
	public function play(animationToPlay : String)
	{
		if ( currentlyPlaying == animationToPlay )											// Do not continue if we are already playing this
			return;
		
		currentlyPlaying = animationToPlay;													// We set what animation is currentlyPlaying
		currentAnimationSet = animationList.get(animationToPlay);							// We get the current animationSet		
		currentFrame = currentAnimationSet.animFrames[0];									// We get the current frame ( in this case the first frame)
		
		canPlayAnimation = true;															// We can now play the aniamtion
		frameCount = 0;																		// We start the frameCount
		lastAnimationFrame = Lib.getTimer();												// We save this frame as the lastAniamtionFrame
	}
	
	/**
	 * Stops the current animation
	 */
	public function stop()
	{
		canPlayAnimation = false;
	}
	
	/********************************************************************************
	 * SCREEN
	 * ******************************************************************************/	
	override private function onScreenResize(e:Event):Void 
	{
		super.onScreenResize(e);
		
		var newScreenSize : JKPoint = new JKPoint( Lib.stage.stageWidth, Lib.stage.stageHeight);
		var ratio : JKPoint = new JKPoint();
		ratio.x = newScreenSize.x / savedScreenSize.x;
		ratio.y = newScreenSize.y / savedScreenSize.y;
		trace(ratio.x + "," + ratio.y);
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