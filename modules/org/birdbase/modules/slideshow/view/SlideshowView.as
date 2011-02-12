package org.birdbase.modules.slideshow.view
{
	import com.bit101.components.Text;
	
	import flash.display.Sprite;
	
	import org.birdbase.framework.view.IView;
	import org.osflash.signals.Signal;
	
	public class SlideshowView extends Sprite implements IView
	{
		protected var _viewTitle:Text;

		public function SlideshowView()
		{
			super();
		}
		
		public function main():void
		{
			trace( "SlideshowView::main" );
			this.graphics.beginFill( 0xFFFF00, 0.5 );
			this.graphics.drawCircle( 400, 100, 50 );
			this.graphics.endFill();
		}

		public function show( signal:Signal ):void
		{
			// TODO Auto-generated method stub
		}

		public function hide( signal:Signal ):void
		{
			// TODO Auto-generated method stub
		}

		public function get viewTitle():Text
		{
			return _viewTitle;
		}
		
		public function set viewTitle(value:Text):void
		{
			_viewTitle = value;
		}
		
	}
}