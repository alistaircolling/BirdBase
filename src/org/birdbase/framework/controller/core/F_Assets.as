package org.birdbase.framework.controller.core
{
	import flash.display.DisplayObject;
	
	import org.assetloader.core.IAssetLoader;
	import org.assetloader.signals.LoaderSignal;
	import org.birdbase.framework.model.IAssetModel;
	import org.birdbase.support.loading.ILoaderView;
	import org.robotlegs.mvcs.Command;
	
	/**
	 * Loads the design assets SWF, which contains the assets that make up the look and feel of the site. e.g. button
	 * backgrounds and shapes, window designs, common logos. The "skin" of the application, if you like.
	 * 
	 * The design assets may be dynamically swapped out at anytime by simply loading a new swf. 
	 *	
	 * @author 	Vish Vishvanath
	 * @since 	11 January 2011
	 */
	public class F_Assets extends Command
	{
		[Inject]
		public var assetModel:IAssetModel;
		
		[Inject(name="loaded")]
		public var assetLoader:IAssetLoader;
		
		public var loaderView:ILoaderView;
		
		/**
		 *	@inheritDoc
		 */
		override public function execute():void
		{
			status();
		}
		
		private function onComplete( s:LoaderSignal, data:* ):void
		{
			info();
			try
			{
				contextView.removeChild( loaderView as DisplayObject );
				loaderView = null;
			}
			catch( e:Error )
			{
				error( e );
			}
			finally
			{
				// IAssetModel fires the complete event once it has loaded the design assets
			}
		}
	}
}