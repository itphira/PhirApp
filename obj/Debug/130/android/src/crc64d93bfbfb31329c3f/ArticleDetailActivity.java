package crc64d93bfbfb31329c3f;


public class ArticleDetailActivity
	extends androidx.appcompat.app.AppCompatActivity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCreate:(Landroid/os/Bundle;)V:GetOnCreate_Landroid_os_Bundle_Handler\n" +
			"";
		mono.android.Runtime.register ("PhirAPP.ArticleDetailActivity, PhirAPP", ArticleDetailActivity.class, __md_methods);
	}


	public ArticleDetailActivity ()
	{
		super ();
		if (getClass () == ArticleDetailActivity.class) {
			mono.android.TypeManager.Activate ("PhirAPP.ArticleDetailActivity, PhirAPP", "", this, new java.lang.Object[] {  });
		}
	}


	public ArticleDetailActivity (int p0)
	{
		super (p0);
		if (getClass () == ArticleDetailActivity.class) {
			mono.android.TypeManager.Activate ("PhirAPP.ArticleDetailActivity, PhirAPP", "System.Int32, mscorlib", this, new java.lang.Object[] { p0 });
		}
	}


	public void onCreate (android.os.Bundle p0)
	{
		n_onCreate (p0);
	}

	private native void n_onCreate (android.os.Bundle p0);

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
