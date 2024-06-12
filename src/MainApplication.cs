using Android.App;
using Android.Runtime;
using Firebase;
using System;

namespace PhirApp
{
    [Application]
    public class MainApplication : Application
    {
        public MainApplication(IntPtr handle, JniHandleOwnership transer) : base(handle, transer)
        {
        }

        public override void OnCreate()
        {
            base.OnCreate();
            // Initialize Firebase
            FirebaseApp.InitializeApp(this);
        }
    }
}
