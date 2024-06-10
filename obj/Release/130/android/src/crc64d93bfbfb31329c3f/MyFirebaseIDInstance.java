package crc64d93bfbfb31329c3f;


public class MyFirebaseIDInstance
	extends com.google.firebase.iid.FirebaseInstanceIdService
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onTokenRefresh:()V:GetOnTokenRefreshHandler\n" +
			"";
		mono.android.Runtime.register ("PhirAPP.MyFirebaseIDInstance, PhirAPP", MyFirebaseIDInstance.class, __md_methods);
	}


	public MyFirebaseIDInstance ()
	{
		super ();
		if (getClass () == MyFirebaseIDInstance.class) {
			mono.android.TypeManager.Activate ("PhirAPP.MyFirebaseIDInstance, PhirAPP", "", this, new java.lang.Object[] {  });
		}
	}


	public void onTokenRefresh ()
	{
		n_onTokenRefresh ();
	}

	private native void n_onTokenRefresh ();

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
