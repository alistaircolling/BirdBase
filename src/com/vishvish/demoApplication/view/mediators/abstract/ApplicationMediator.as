package com.vishvish.demoApplication.view.mediators.abstract
{
	import org.birdbase.framework.view.helpers.ViewHelper;
	import org.birdbase.framework.model.ApplicationModel;
	
	import org.as3commons.logging.ILogger;
	import org.birdbase.framework.model.ConfigurationModel;
	import org.birdbase.framework.utils.swfaddress.SWFAddress;
	import org.birdbase.framework.view.AbstractBirdbaseMediator;
	
	/**
	 * Abstract superclass for mediators, holding application-level injected objects.
	 * 
	 * Models go here. ViewHelpers go here.
	 *  
	 * @author Vish Vishvanath
	 * @since 7 February 2011
	 */
	public class ApplicationMediator extends AbstractBirdbaseMediator
	{
		[Inject]
		public var appModel:ApplicationModel;

		[Inject]
		public var config:ConfigurationModel;

		[Inject]
		public var helper:ViewHelper;

		[Inject]
		public var logger:ILogger;
		
		[Inject]
		public var swfAddress:SWFAddress;

		public function ApplicationMediator()
		{
			super();
		}
	}
}