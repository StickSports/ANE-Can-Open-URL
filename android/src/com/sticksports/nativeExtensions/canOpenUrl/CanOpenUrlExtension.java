package com.sticksports.nativeExtensions.canOpenUrl;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class CanOpenUrlExtension implements FREExtension
{
	@Override
	public FREContext createContext( String contextType )
	{
		return new CanOpenUrlExtensionContext();
	}

	@Override
	public void dispose()
	{
	}

	@Override
	public void initialize()
	{
	}
}
