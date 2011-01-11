package com.tfto.birdbase.view.mediators
{
	import com.tfto.birdbase.model.L10nModel;
	import com.tfto.birdbase.model.PreferencesModel;
	import com.tfto.birdbase.model.ViewStateModel;
	import com.tfto.birdbase.signals.ViewStateChanged;
	import com.tfto.birdbase.view.FirstView;
	import com.tfto.birdbase.view.IView;
	import com.tfto.birdbase.view.MainUI;
	import com.tfto.birdbase.view.SecondView;
	import com.tfto.birdbase.view.ThirdView;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import org.as3commons.logging.ILogger;
	import org.osflash.signals.Signal;
	import org.osflash.signals.natives.NativeSignal;
	import org.robotlegs.mvcs.Mediator;
	
	import swfaddress.SWFAddress;

	/**
	 *	// TODO MainUIMediator 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class MainUIMediator extends Mediator
	{
		[Inject]
		/**
		 *	// TODO view 
		 */
		public var view:MainUI;
		
		[Inject]
		/**
		 *	// TODO viewStateChanged 
		 */
		public var viewStateChanged:ViewStateChanged;
		
		[Inject]
		/**
		 *	// TODO viewState 
		 */
		public var viewState:ViewStateModel;
		
		[Inject]
		/**
		 *	// TODO swfAddress 
		 */
		public var swfAddress:SWFAddress;
		
		[Inject]
		/**
		 *	// TODO pm 
		 */
		public var pm:PreferencesModel;
		
		[Inject]
		/**
		 *	// TODO l10n 
		 */
		public var l10n:L10nModel;
		
		[Inject]
		/**
		 *	// TODO logger 
		 */
		public var logger:ILogger;
		
		/**
		 *	// TODO views 
		 */
		protected var views:Object;
		
		/**
		 *	// TODO currentView 
		 */
		protected var currentView:IView;
		
		/**
		 *	// TODO MainUIMediator 
		 */
		public function MainUIMediator()
		{
			super();
		}

		/**
		 *	// TODO onRegister 
		 *	
		 *	@return void	
		 */
		override public function onRegister():void
		{
			logger.debug( "MainUIMediator::onRegister" );
			viewStateChanged.add(onViewStateChange);
			
			view.main();
			
			view.tf.text = l10n.getProperty( "welcome" );
			
			views = {};
			views[""] = FirstView;
			views["view2"] = SecondView;
			views["view3"] = ThirdView;
			
			var ns:NativeSignal = new NativeSignal(view.logo,MouseEvent.CLICK,MouseEvent);
			ns.add(gotoHome);
			
		}
		
		/**
		 *	// TODO gotoHome 
		 *	
		 *	@param myEvent 
		 *	
		 *	@return void	
		 */
		protected function gotoHome(myEvent:MouseEvent):void
		{	
			trace("GotoHome");
			swfAddress.setValue("/");
			
		}
		/**
		 *	// TODO onViewStateChange 
		 *	
		 *	@return void	
		 */
		protected function onViewStateChange():void
		{
			var viewName:String = viewState.viewName;
			logger.debug( "MainUIMediator::onViewStateChanged: " + viewName );
			
			if(views.hasOwnProperty(viewName))
			{
				if(views[viewName] is Class)
				{
					views[viewName] = new views[viewName];
				}
				
				if(currentView != null)
				{
					var s:Signal = new Signal();
					s.addOnce(function():void { view.viewContainer.removeChildAt(0); showView(views[viewName]);});
					currentView.hide(s);
				}
				else
				{
					showView(views[viewName]);
				}
			}
		}
		
		/**
		 *	// TODO showView 
		 *	
		 *	@param newView 
		 *	
		 *	@return void	
		 */
		protected function showView(newView:IView):void
		{
			currentView = newView;
			view.viewContainer.addChild(DisplayObject(currentView));
			currentView.show(null);
		}
	}
}