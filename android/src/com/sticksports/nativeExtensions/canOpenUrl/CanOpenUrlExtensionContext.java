package com.sticksports.nativeExtensions.canOpenUrl;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class CanOpenUrlExtensionContext extends FREContext
{

	@Override
	public void dispose()
	{
	}

	@Override
	public Map<String, FREFunction> getFunctions()
	{
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put( "canOpenUrl", new CanOpenUrlExtensionCanOpenUrl() );
		return functionMap;
	}

}
