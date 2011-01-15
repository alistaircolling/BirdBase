package org.birdbase.application.view
{
	import com.tfto.button.BasicButton;
	import com.tfto.text.BasicTextField;
	
	import flash.text.TextFieldAutoSize;

	/**
	 *	// TODO FirstView 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class FirstView extends AbstractTransitioningView
	{
		public var blueButton:BasicButton;

		public var redButton:BasicButton;
		
		protected var textTF:BasicTextField;
		
		public function FirstView()
		{
			super();
		}
		
		override public function main():void
		{
			cleanup();
			textTF = new BasicTextField();
			textTF.width = 400;
			textTF.multiline = true;
			textTF.wordWrap = true;
			textTF.autoSize = TextFieldAutoSize.LEFT;
			addChild(textTF);
			
			blueButton = new BasicButton( 0x0000FF, 0xFFFFFF );
			blueButton.text = "Blue Button";
			addChild( blueButton );
			blueButton.y = 60;
			
			redButton = new BasicButton( 0xFF0000 );
			redButton.text = "Red Button";
			addChild( redButton );
			redButton.y = 60;
			redButton.x = 110;
		}
	}
}