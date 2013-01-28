package jkEngine;
import nme.display.DisplayObjectContainer;
/**
 * ...
 * @author Karlo
 */

class JKButton extends JKSprite
{
	var isClicked : Bool = false;

	/********************************************************************************
	 * MAIN
	 * ******************************************************************************/	
	public function new( xPos : Float = 0, yPos : Float = 0, ?theWidth : Float
		, ?theHeight : Float, ?graphicFileLocation : String, ?theLayer : DisplayObjectContainer ) 
	{
		super(xPos, yPos, theWidth, theHeight, graphicFileLocation, theLayer);
	}
	
	override private function update():Dynamic 
	{
		if ( Registry.game.mouse.justPressed() )			// If the mouse is pressed
			checkIfClicked();
			
		return super.update();
	}
	
	override private function lateUpdate():Dynamic 
	{
		isClicked = false;
		super.lateUpdate();
	}	
	
	/********************************************************************************
	 * SENSORS
	 * ******************************************************************************/	
	/**
	 * Checks if this particular button is clicked
	 */
	function checkIfClicked()
	{		
		if ( mouseX > 0 && mouseX < width					// We use the mouseX and mouseY positions to determine
			&& mouseY > 0 && mouseY < height )				// If this button is clicked
		{
			isClicked = true;
		}		
	}	
}