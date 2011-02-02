package com.vishvish.demoApplication
{
	import com.vishvish.demoApplication.controller.state.ChangeApplicationStateCommand;
	import com.vishvish.demoApplication.model.ApplicationModel;
	import com.vishvish.demoApplication.view.*;
	import com.vishvish.demoApplication.view.mediators.*;
	
	import flash.display.DisplayObjectContainer;
	
	import org.birdbase.framework.BirdbaseContext;
	import org.birdbase.framework.model.*;
	import org.birdbase.framework.service.*;
	import org.birdbase.framework.signals.*;
	import org.birdbase.modules.slideshow.SlideshowModule;
	
	/**
	 *	// TODO MainContext 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class MainContext extends BirdbaseContext
	{
		/**
		 *	// TODO MainContext 
		 *	
		 *	@param contextView 
		 *	
		 *	@return 	
		 */
		public function MainContext( contextView:DisplayObjectContainer )
		{
			super( contextView );
		}
		
		/**
		 *	// TODO startup 
		 *	
		 *	@return void	
		 */
		override public function startup():void
        {
			signalCommandMap.mapSignalClass( ModifyApplicationState, ChangeApplicationStateCommand );

			// models
			injector.mapSingleton( ApplicationModel );
			injector.mapSingleton( SlideshowModule );

			// modules
			viewMap.mapType( SlideshowModule );
			
			mediatorMap.mapView( MainContainerView, MainContainerViewMediator );
			mediatorMap.mapView( FirstView, FirstViewMediator );
			mediatorMap.mapView( SecondView, SecondViewMediator );
			mediatorMap.mapView( ThirdView, ThirdViewMediator );

			super.startup();
        }
	}
}