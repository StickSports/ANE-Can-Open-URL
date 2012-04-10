package com.sticksports.nativeExtensions.canOpenUrl
{
	import flash.external.ExtensionContext;
	
	public class CanOpenUrl
	{
		private static var extensionContext : ExtensionContext;

		/**
		 * Find if a url scheme exists to open the specified url
		 */
		public static function canOpen( url : String ) : Boolean
		{
			if ( !extensionContext )
			{
				extensionContext = ExtensionContext.createExtensionContext( "com.sticksports.nativeExtensions.CanOpenUrl", null );
			}
			if( !url )
			{
				return false;
			}
			return extensionContext.call( "canOpenUrl", url ) as Boolean;
		}
	}
}
