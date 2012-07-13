package com.sticksports.nativeExtensions.canOpenUrl;

import java.util.List;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class CanOpenUrlExtensionCanOpenUrl implements FREFunction
{

	@Override
	public FREObject call( FREContext context, FREObject[] args )
	{
		try
		{
			String url = args[0].getAsString();	
			final PackageManager packageManager = context.getActivity().getPackageManager();
			final Intent intent = new Intent( Intent.ACTION_VIEW, Uri.parse( url ) );
			List<ResolveInfo> list = packageManager.queryIntentActivities( intent, PackageManager.MATCH_DEFAULT_ONLY );
			Boolean canOpen = list.size() > 0;
			return FREObject.newObject( canOpen );
		}
		catch ( Exception exception )
		{
			Log.w( "CanOpenUrlExtension", exception );
		}
		return null;
	}

}
