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

class JKText extends TextField
{
	var textFormat : TextFormat;
		
	public function new( xPos : Float = 0, yPos : Float = 0, ?theWidth : Float
		, ?theHeight : Float, ?theText : String, theTextColor : Int = 0x000000
		, fontSize : Int = 10, alignment : TextFormatAlign = null, fontType : String, ?layer : DisplayObjectContainer ) 
	{
		super();
						
		// Set the positions
		x = xPos;
		y = yPos;
		
		// Set the dimensions
		if ( theWidth != null )
			width = theWidth;
			
		if ( theHeight != null )
			height = theHeight;
			
		// Set the text format		
		multiline = true;									// Enable multiline
		wordWrap = true;									// Enable wordwrap
		textFormat = new TextFormat();		
		textColor = theTextColor;							// We set the textColor
		
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
				
		layer.addChild(this);								// Add to layer
		setTextFormat(textFormat);							// Apply text format
	}
	
	/**
	 * Sets the text to be displayed. Use this instead of accessing text property directly.
	 * @param	theText		The string to display
	 */
	public function setText(theText : String )
	{		
		text = theText;										// We set the actual text
		setTextFormat(textFormat);							// We reapply the text format
	}
}