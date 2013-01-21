package jkEngine;

import nme.events.Event;

class JKEvent extends Event
{
	public inline static var UPDATE_LOOP : String = "update";
	public inline static var LATE_UPDATE_LOOP : String = "fixedUpdate";
	
	public function new(type : String, bubbles : Bool = false, cancelable : Bool = false) : Void
	{
		super(type, bubbles, cancelable);
	}	
}