package jkEngine;
import nme.text.TextField;
import nme.display.DisplayObjectContainer;
import nme.Lib;
import nme.text.TextFieldType;
import nme.text.TextFormat;
import nme.text.TextFormatAlign;

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
		multiline = true;
		wordWrap = true;
		textFormat = new TextFormat();		
		textColor = theTextColor;	
		
		if ( alignment != null )		
			textFormat.align = alignment;		
			
		textFormat.size = fontSize;	
		textFormat.font = fontType;
		
		// Set the text
		if ( theText != null )
			setText(theText);
			
		// Setting of layer
		if ( layer == null )
			layer = Lib.stage;			
				
		layer.addChild(this);				// Add to layer
		setTextFormat(textFormat);			// Apply text format
	}
	
	public function setText(theText : String )
	{		
		text = theText;
		setTextFormat(textFormat);
	}
}