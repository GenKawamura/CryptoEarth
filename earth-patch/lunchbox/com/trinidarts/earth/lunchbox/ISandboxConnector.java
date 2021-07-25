package com.trinidarts.earth.lunchbox;

import java.lang.Thread.UncaughtExceptionHandler;

import com.trinidarts.earth.lunchbox.pub.IApplet;

/**
 * 
 * Extends ISandboxConnector, so that the Sandbox class can call functions that can't be called from inside the sandbox.
 * 
 * @author github.com/Black-Mantha
 *
 */
public interface ISandboxConnector extends com.trinidarts.earth.lunchbox.pub.ISandboxConnector, UncaughtExceptionHandler {
	void notifyConstructed(IApplet app);
	void appletCompleted();
}
