package mono.android.app;

public class ApplicationRegistration {

	public static void registerApplications ()
	{
				// Application and Instrumentation ACWs must be registered first.
		mono.android.Runtime.register ("PhirApp.MainApplication, PhirAPP, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", crc64c50d2a9c6ad6703b.MainApplication.class, crc64c50d2a9c6ad6703b.MainApplication.__md_methods);
		
	}
}
