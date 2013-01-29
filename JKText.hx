package jkEngine;

import nme.display.DisplayObjectContainer;
import nme.text.TextFormatAlign;
import nme.text.TextFieldType;
import nme.text.TextFormat;
import nme.text.TextField;
import nme.Lib;

/**
 * ...
 * @author Karlo
 */

class JKText extends JKSprite
{
	var textFormat : TextFormat;
	var textField : TextField;
	
	public function new( xPos : Float = 0, yPos : Float = 0, ?textWidth : Float, ?textHeight : Float, ?theText : String, theTextColor : Int = 0x000000, fontSize : Int = 10, alignment : TextFormatAlign = null, fontType : String, ?theLayer : DisplayObjectContainer ) 
	{
		layer = theLayer;
		textField = new TextField();
		
		super(xPos, yPos, theLayer);
		
		// Set the dimensions
		if ( textWidth != null )
			textField.width = textWidth;
			
		if ( textHeight != null )
			textField.height = textHeight;
			
		// Set the text format		
		textField.multiline = true;							// Enable multiline
		textField.wordWrap = true;							// Enable wordwrap
		textFormat = new TextFormat();		
		textField.textColor = theTextColor;					// We set the textColor
		
		if ( alignment != null )		
			textFormat.align = alignment;					// We set the alignment
			
		textFormat.size = fontSize;							// We set the font size
		textFormat.font = fontType;							// We set the font type
		
		// Set the text
		if ( theText != null )
			setText(theText);								// We set the actual text
			
		// Setting of layer
		if ( layer == null )
			layer = Lib.stage;			
				
		layer.addChild(this);								// We add this object to the layer		
		addChild(textField);								// We add the textField to this object
		textField.setTextFormat(textFormat);				// Apply text format
	}
	
	/**
	 * Sets the text to be displayed. Use this instead of accessing text property directly.
	 * @param	theText		The string to display
	 */
	public function setText(theText : String )
	{		
		textField.text = theText;							// We set the actual text
		textField.setTextFormat(textFormat);				// We reapply the text format
	}
	
	/********************************************************************************
	 * DESTROY
	 * ******************************************************************************/
	override public function destroy():Dynamic 
	{	
		removeChild(this);									// We remove the textField from this object
		layer.removeChild(this);							// We remove the object from its layer		
		super.destroy();									// We then start destroying
	}
}