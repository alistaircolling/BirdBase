package com.vishvish.demoApplication.controller.state
{
	import org.as3commons.logging.ILogger;
	import com.vishvish.demoApplication.model.ApplicationModel;
	import org.birdbase.framework.model.ViewStateModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 *	// TODO ApplicationStateChangedCommand 
	 *	
	 *	// TODO @example 
	 *	
	 *	// TODO @exampleText 
	 *	
	 *	@author 	Vish Vishvanath
	 *	@email 		vish.vishvanath@gmail.com
	 *	@since 		11 January 2011
	 */
	public class ApplicationStateChangedCommand extends SignalCommand
	{
		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var viewState:ViewStateModel;
		
		[Inject]
		public var appModel:ApplicationModel;
		
		[Inject]
		public var swfAddress:SWFAddress;
		
		/**
		 *	// TODO execute 
		 *	
		 *	@return void	
		 */
		override public function execute():void
		{
			logger.debug( "ApplicationStateChangedCommand: execute" );
			logger.info( "SWFAddress::" + swfAddress.getValue() );
			
			// this is where you configure your swfaddress option parameters
			// REMOVE/CHANGE FOR YOUR APPLICATION
			appModel.option1 = swfAddress.getParameter("op1") as String;
			appModel.option2 = swfAddress.getParameter("op2") as String;
					
			viewState.viewName = swfAddress.getPath().substr( 1 );
		}
	}
}