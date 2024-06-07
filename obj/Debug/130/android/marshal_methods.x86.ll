; ModuleID = 'obj\Debug\130\android\marshal_methods.x86.ll'
source_filename = "obj\Debug\130\android\marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [288 x i32] [
	i32 28873261, ; 0: Npgsql.dll => 0x1b8922d => 9
	i32 32687329, ; 1: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 73
	i32 34715100, ; 2: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 116
	i32 39109920, ; 3: Newtonsoft.Json.dll => 0x254c520 => 8
	i32 57305218, ; 4: Xamarin.KotlinX.Coroutines.Play.Services => 0x36a6882 => 130
	i32 99966887, ; 5: Xamarin.Firebase.Iid.dll => 0x5f55fa7 => 105
	i32 101534019, ; 6: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 84
	i32 103834273, ; 7: Xamarin.Firebase.Annotations.dll => 0x63062a1 => 97
	i32 120558881, ; 8: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 84
	i32 122350210, ; 9: System.Threading.Channels.dll => 0x74aea82 => 31
	i32 134690465, ; 10: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 125
	i32 165246403, ; 11: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 50
	i32 182336117, ; 12: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 86
	i32 209399409, ; 13: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 48
	i32 230216969, ; 14: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 69
	i32 232815796, ; 15: System.Web.Services => 0xde07cb4 => 140
	i32 261689757, ; 16: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 54
	i32 280482487, ; 17: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 68
	i32 318968648, ; 18: Xamarin.AndroidX.Activity.dll => 0x13031348 => 39
	i32 321597661, ; 19: System.Numerics => 0x132b30dd => 25
	i32 324489690, ; 20: Xamarin.Android.Support.Exif.dll => 0x135751da => 38
	i32 342366114, ; 21: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 70
	i32 347068432, ; 22: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 13
	i32 385762202, ; 23: System.Memory.dll => 0x16fe439a => 23
	i32 441335492, ; 24: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 53
	i32 442521989, ; 25: Xamarin.Essentials => 0x1a605985 => 96
	i32 450948140, ; 26: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 67
	i32 465846621, ; 27: mscorlib => 0x1bc4415d => 7
	i32 469710990, ; 28: System.dll => 0x1bff388e => 22
	i32 476646585, ; 29: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 68
	i32 485140951, ; 30: Xamarin.Google.Android.DataTransport.TransportRuntime => 0x1ceaa9d7 => 113
	i32 486930444, ; 31: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 77
	i32 495452658, ; 32: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x1d8801f2 => 113
	i32 507148113, ; 33: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0x1e3a7751 => 111
	i32 526420162, ; 34: System.Transactions.dll => 0x1f6088c2 => 132
	i32 527452488, ; 35: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 125
	i32 542030372, ; 36: Xamarin.GooglePlayServices.Stats => 0x204eba24 => 120
	i32 548916678, ; 37: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 3
	i32 569601784, ; 38: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 95
	i32 605376203, ; 39: System.IO.Compression.FileSystem => 0x24154ecb => 136
	i32 627609679, ; 40: Xamarin.AndroidX.CustomView => 0x2568904f => 59
	i32 639843206, ; 41: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 65
	i32 662205335, ; 42: System.Text.Encodings.Web.dll => 0x27787397 => 29
	i32 663517072, ; 43: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 91
	i32 666292255, ; 44: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 45
	i32 690569205, ; 45: System.Xml.Linq.dll => 0x29293ff5 => 141
	i32 691348768, ; 46: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 127
	i32 692692150, ; 47: Xamarin.Android.Support.Annotations => 0x2949a4b6 => 37
	i32 700284507, ; 48: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 123
	i32 720511267, ; 49: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 126
	i32 748832960, ; 50: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 11
	i32 755313932, ; 51: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 33
	i32 775507847, ; 52: System.IO.Compression => 0x2e394f87 => 135
	i32 790371945, ; 53: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 60
	i32 809851609, ; 54: System.Drawing.Common.dll => 0x30455ad9 => 134
	i32 843511501, ; 55: Xamarin.AndroidX.Print => 0x3246f6cd => 79
	i32 846667644, ; 56: Xamarin.Firebase.Installations.dll => 0x32771f7c => 107
	i32 882434999, ; 57: Xamarin.Firebase.Installations.InterOp.dll => 0x3498e3b7 => 108
	i32 928116545, ; 58: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 116
	i32 955402788, ; 59: Newtonsoft.Json => 0x38f24a24 => 8
	i32 956575887, ; 60: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 126
	i32 961995525, ; 61: Square.OkIO.dll => 0x3956e305 => 16
	i32 967690846, ; 62: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 70
	i32 996733531, ; 63: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3b68f25b => 112
	i32 1012816738, ; 64: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 83
	i32 1028951442, ; 65: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 4
	i32 1031528504, ; 66: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 115
	i32 1035644815, ; 67: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 44
	i32 1036359102, ; 68: Xamarin.GooglePlayServices.CloudMessaging.dll => 0x3dc595be => 119
	i32 1052210849, ; 69: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 74
	i32 1084122840, ; 70: Xamarin.Kotlin.StdLib => 0x409e66d8 => 124
	i32 1098259244, ; 71: System => 0x41761b2c => 22
	i32 1141947663, ; 72: Xamarin.Firebase.Measurement.Connector.dll => 0x4410bd0f => 109
	i32 1149092582, ; 73: Xamarin.AndroidX.Window => 0x447dc2e6 => 94
	i32 1175144683, ; 74: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 89
	i32 1204270330, ; 75: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 45
	i32 1221286664, ; 76: Square.OkHttp3 => 0x48cb5b08 => 15
	i32 1243150071, ; 77: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 95
	i32 1246548578, ; 78: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 51
	i32 1264511973, ; 79: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 85
	i32 1264890200, ; 80: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 128
	i32 1267360935, ; 81: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 90
	i32 1275534314, ; 82: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 127
	i32 1278448581, ; 83: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 42
	i32 1292207520, ; 84: SQLitePCLRaw.core.dll => 0x4d0585a0 => 12
	i32 1293217323, ; 85: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 62
	i32 1322716291, ; 86: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 94
	i32 1333047053, ; 87: Xamarin.Firebase.Common => 0x4f74af0d => 98
	i32 1365406463, ; 88: System.ServiceModel.Internals.dll => 0x516272ff => 139
	i32 1376866003, ; 89: Xamarin.AndroidX.SavedState => 0x52114ed3 => 83
	i32 1379897097, ; 90: Xamarin.JavaX.Inject => 0x523f8f09 => 122
	i32 1406073936, ; 91: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 55
	i32 1411638395, ; 92: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 27
	i32 1461234159, ; 93: System.Collections.Immutable.dll => 0x5718a9ef => 19
	i32 1462112819, ; 94: System.IO.Compression.dll => 0x57261233 => 135
	i32 1469204771, ; 95: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 43
	i32 1479771757, ; 96: System.Collections.Immutable => 0x5833866d => 19
	i32 1531040989, ; 97: Xamarin.Firebase.Iid.Interop.dll => 0x5b41d4dd => 106
	i32 1582372066, ; 98: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 61
	i32 1592978981, ; 99: System.Runtime.Serialization.dll => 0x5ef2ee25 => 138
	i32 1597949149, ; 100: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 115
	i32 1622152042, ; 101: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 76
	i32 1624863272, ; 102: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 93
	i32 1635184631, ; 103: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 65
	i32 1636350590, ; 104: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 58
	i32 1639515021, ; 105: System.Net.Http.dll => 0x61b9038d => 24
	i32 1657153582, ; 106: System.Runtime => 0x62c6282e => 28
	i32 1658241508, ; 107: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 87
	i32 1658251792, ; 108: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 114
	i32 1670060433, ; 109: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 54
	i32 1711441057, ; 110: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 13
	i32 1729485958, ; 111: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 49
	i32 1766324549, ; 112: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 86
	i32 1776026572, ; 113: System.Core.dll => 0x69dc03cc => 20
	i32 1788241197, ; 114: Xamarin.AndroidX.Fragment => 0x6a96652d => 67
	i32 1796167890, ; 115: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 3
	i32 1808609942, ; 116: Xamarin.AndroidX.Loader => 0x6bcd3296 => 76
	i32 1813058853, ; 117: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 124
	i32 1813201214, ; 118: Xamarin.Google.Android.Material => 0x6c13413e => 114
	i32 1828688058, ; 119: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 5
	i32 1847515442, ; 120: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 33
	i32 1867746548, ; 121: Xamarin.Essentials.dll => 0x6f538cf4 => 96
	i32 1876173635, ; 122: Xamarin.Firebase.Encoders.Proto => 0x6fd42343 => 104
	i32 1885316902, ; 123: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 46
	i32 1908813208, ; 124: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 118
	i32 1919157823, ; 125: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 78
	i32 1933215285, ; 126: Xamarin.Firebase.Messaging.dll => 0x733a8635 => 110
	i32 1985761444, ; 127: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 36
	i32 2011961780, ; 128: System.Buffers.dll => 0x77ec19b4 => 18
	i32 2019465201, ; 129: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 74
	i32 2031763787, ; 130: Xamarin.Android.Glide => 0x791a414b => 35
	i32 2055257422, ; 131: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 71
	i32 2079903147, ; 132: System.Runtime.dll => 0x7bf8cdab => 28
	i32 2090596640, ; 133: System.Numerics.Vectors => 0x7c9bf920 => 26
	i32 2103459038, ; 134: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 14
	i32 2124230737, ; 135: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x7e9d3051 => 112
	i32 2129483829, ; 136: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 117
	i32 2174878672, ; 137: Xamarin.Firebase.Annotations => 0x81a203d0 => 97
	i32 2192057212, ; 138: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 5
	i32 2201107256, ; 139: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 129
	i32 2201231467, ; 140: System.Net.Http => 0x8334206b => 24
	i32 2217644978, ; 141: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 89
	i32 2225853105, ; 142: Xamarin.Firebase.Common.Ktx => 0x84abd2b1 => 99
	i32 2244775296, ; 143: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 77
	i32 2256548716, ; 144: Xamarin.AndroidX.MultiDex => 0x8680336c => 78
	i32 2267999099, ; 145: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 34
	i32 2279755925, ; 146: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 81
	i32 2294913272, ; 147: Npgsql => 0x88c998f8 => 9
	i32 2315684594, ; 148: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 40
	i32 2390616037, ; 149: Xamarin.Android.Support.Exif => 0x8e7de7e5 => 38
	i32 2403452196, ; 150: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 64
	i32 2465273461, ; 151: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 11
	i32 2465532216, ; 152: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 53
	i32 2471841756, ; 153: netstandard.dll => 0x93554fdc => 1
	i32 2475788418, ; 154: Java.Interop.dll => 0x93918882 => 2
	i32 2483661569, ; 155: Xamarin.Firebase.Measurement.Connector => 0x9409ab01 => 109
	i32 2483742551, ; 156: Xamarin.Firebase.Messaging => 0x940ae757 => 110
	i32 2486410006, ; 157: Xamarin.GooglePlayServices.CloudMessaging => 0x94339b16 => 119
	i32 2501346920, ; 158: System.Data.DataSetExtensions => 0x95178668 => 133
	i32 2505896520, ; 159: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 73
	i32 2522472828, ; 160: Xamarin.Android.Glide.dll => 0x9659e17c => 35
	i32 2537149420, ; 161: PhirAPP => 0x9739d3ec => 0
	i32 2570120770, ; 162: System.Text.Encodings.Web => 0x9930ee42 => 29
	i32 2581819634, ; 163: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 90
	i32 2605712449, ; 164: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 129
	i32 2620111890, ; 165: Xamarin.Firebase.Encoders.dll => 0x9c2bbc12 => 102
	i32 2620871830, ; 166: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 58
	i32 2623491480, ; 167: Xamarin.Firebase.Installations.InterOp => 0x9c5f4d98 => 108
	i32 2624644809, ; 168: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 63
	i32 2639764100, ; 169: Xamarin.Firebase.Encoders => 0x9d579a84 => 102
	i32 2654752166, ; 170: PhirAPP.dll => 0x9e3c4da6 => 0
	i32 2663391936, ; 171: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 34
	i32 2671474046, ; 172: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 128
	i32 2701096212, ; 173: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 87
	i32 2732626843, ; 174: Xamarin.AndroidX.Activity => 0xa2e0939b => 39
	i32 2735172069, ; 175: System.Threading.Channels => 0xa30769e5 => 31
	i32 2737747696, ; 176: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 43
	i32 2770495804, ; 177: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 123
	i32 2778768386, ; 178: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 92
	i32 2779977773, ; 179: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 82
	i32 2793853378, ; 180: Square.Picasso.dll => 0xa686d1c2 => 17
	i32 2804607052, ; 181: Xamarin.Firebase.Components.dll => 0xa72ae84c => 100
	i32 2810250172, ; 182: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 55
	i32 2819470561, ; 183: System.Xml.dll => 0xa80db4e1 => 32
	i32 2821294376, ; 184: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 82
	i32 2847418871, ; 185: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 117
	i32 2853208004, ; 186: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 92
	i32 2855708567, ; 187: Xamarin.AndroidX.Transition => 0xaa36a797 => 88
	i32 2870995654, ; 188: Xamarin.Firebase.Iid => 0xab1feac6 => 105
	i32 2883826422, ; 189: Xamarin.Firebase.Installations => 0xabe3b2f6 => 107
	i32 2884993177, ; 190: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 66
	i32 2903344695, ; 191: System.ComponentModel.Composition => 0xad0d8637 => 137
	i32 2905242038, ; 192: mscorlib.dll => 0xad2a79b6 => 7
	i32 2914202368, ; 193: Xamarin.Firebase.Iid.Interop => 0xadb33300 => 106
	i32 2916838712, ; 194: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 93
	i32 2919462931, ; 195: System.Numerics.Vectors.dll => 0xae037813 => 26
	i32 2921128767, ; 196: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 41
	i32 2943219317, ; 197: Square.OkIO => 0xaf6df675 => 16
	i32 2978675010, ; 198: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 62
	i32 2996846495, ; 199: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 72
	i32 3016983068, ; 200: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 85
	i32 3024354802, ; 201: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 69
	i32 3058099980, ; 202: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 121
	i32 3071899978, ; 203: Xamarin.Firebase.Common.dll => 0xb719794a => 98
	i32 3106737866, ; 204: Xamarin.Firebase.Datatransport.dll => 0xb92d0eca => 101
	i32 3111772706, ; 205: System.Runtime.Serialization => 0xb979e222 => 138
	i32 3124832203, ; 206: System.Threading.Tasks.Extensions => 0xba4127cb => 143
	i32 3150271759, ; 207: Xamarin.KotlinX.Coroutines.Play.Services.dll => 0xbbc5550f => 130
	i32 3155362983, ; 208: Xamarin.Google.Android.DataTransport.TransportApi => 0xbc1304a7 => 111
	i32 3204380047, ; 209: System.Data.dll => 0xbefef58f => 131
	i32 3211777861, ; 210: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 61
	i32 3217536604, ; 211: Square.OkHttp3.dll => 0xbfc7b65c => 15
	i32 3230466174, ; 212: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 118
	i32 3247949154, ; 213: Mono.Security => 0xc197c562 => 142
	i32 3258312781, ; 214: Xamarin.AndroidX.CardView => 0xc235e84d => 49
	i32 3265893370, ; 215: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 143
	i32 3267021929, ; 216: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 47
	i32 3286872994, ; 217: SQLite-net.dll => 0xc3e9b3a2 => 10
	i32 3317135071, ; 218: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 59
	i32 3317144872, ; 219: System.Data => 0xc5b79d28 => 131
	i32 3331531814, ; 220: Xamarin.GooglePlayServices.Stats.dll => 0xc6932426 => 120
	i32 3340431453, ; 221: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 46
	i32 3345895724, ; 222: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 80
	i32 3358260929, ; 223: System.Text.Json => 0xc82afec1 => 30
	i32 3360279109, ; 224: SQLitePCLRaw.core => 0xc849ca45 => 12
	i32 3362522851, ; 225: Xamarin.AndroidX.Core => 0xc86c06e3 => 57
	i32 3366347497, ; 226: Java.Interop => 0xc8a662e9 => 2
	i32 3371992681, ; 227: Xamarin.Firebase.Encoders.Proto.dll => 0xc8fc8669 => 104
	i32 3374999561, ; 228: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 81
	i32 3383578424, ; 229: Xamarin.Firebase.Encoders.JSON => 0xc9ad4f38 => 103
	i32 3395150330, ; 230: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 27
	i32 3404865022, ; 231: System.ServiceModel.Internals => 0xcaf21dfe => 139
	i32 3405233483, ; 232: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 60
	i32 3429136800, ; 233: System.Xml => 0xcc6479a0 => 32
	i32 3430777524, ; 234: netstandard => 0xcc7d82b4 => 1
	i32 3439690031, ; 235: Xamarin.Android.Support.Annotations.dll => 0xcd05812f => 37
	i32 3441283291, ; 236: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 63
	i32 3476120550, ; 237: Mono.Android => 0xcf3163e6 => 6
	i32 3479776177, ; 238: Square.Picasso => 0xcf692bb1 => 17
	i32 3485117614, ; 239: System.Text.Json.dll => 0xcfbaacae => 30
	i32 3486566296, ; 240: System.Transactions => 0xcfd0c798 => 132
	i32 3493954962, ; 241: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 52
	i32 3501239056, ; 242: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 47
	i32 3509114376, ; 243: System.Xml.Linq => 0xd128d608 => 141
	i32 3567349600, ; 244: System.ComponentModel.Composition.dll => 0xd4a16f60 => 137
	i32 3597029428, ; 245: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 36
	i32 3627220390, ; 246: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 79
	i32 3633644679, ; 247: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 41
	i32 3641597786, ; 248: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 71
	i32 3672681054, ; 249: Mono.Android.dll => 0xdae8aa5e => 6
	i32 3676310014, ; 250: System.Web.Services.dll => 0xdb2009fe => 140
	i32 3682565725, ; 251: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 48
	i32 3684561358, ; 252: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 52
	i32 3689375977, ; 253: System.Drawing.Common => 0xdbe768e9 => 134
	i32 3706696989, ; 254: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 56
	i32 3718780102, ; 255: Xamarin.AndroidX.Annotation => 0xdda814c6 => 40
	i32 3748608112, ; 256: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 21
	i32 3754567612, ; 257: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 14
	i32 3786282454, ; 258: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 50
	i32 3829621856, ; 259: System.Numerics.dll => 0xe4436460 => 25
	i32 3841636137, ; 260: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 4
	i32 3876362041, ; 261: SQLite-net => 0xe70c9739 => 10
	i32 3885922214, ; 262: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 88
	i32 3888767677, ; 263: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 80
	i32 3896760992, ; 264: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 57
	i32 3910130544, ; 265: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 51
	i32 3920810846, ; 266: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 136
	i32 3921031405, ; 267: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 91
	i32 3934056515, ; 268: Xamarin.JavaX.Inject.dll => 0xea7cf043 => 122
	i32 3945713374, ; 269: System.Data.DataSetExtensions.dll => 0xeb2ecede => 133
	i32 3955647286, ; 270: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 44
	i32 3959773229, ; 271: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 72
	i32 3970018735, ; 272: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 121
	i32 4015948917, ; 273: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 42
	i32 4025784931, ; 274: System.Memory => 0xeff49a63 => 23
	i32 4101593132, ; 275: Xamarin.AndroidX.Emoji2 => 0xf479582c => 64
	i32 4105002889, ; 276: Mono.Security.dll => 0xf4ad5f89 => 142
	i32 4151237749, ; 277: System.Core => 0xf76edc75 => 20
	i32 4157403133, ; 278: Xamarin.Firebase.Common.Ktx.dll => 0xf7cceffd => 99
	i32 4182413190, ; 279: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 75
	i32 4192648326, ; 280: Xamarin.Firebase.Encoders.JSON.dll => 0xf9e6bc86 => 103
	i32 4213026141, ; 281: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 21
	i32 4256097574, ; 282: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 56
	i32 4260525087, ; 283: System.Buffers => 0xfdf2741f => 18
	i32 4269159614, ; 284: Xamarin.Firebase.Datatransport => 0xfe7634be => 101
	i32 4284549794, ; 285: Xamarin.Firebase.Components => 0xff610aa2 => 100
	i32 4292120959, ; 286: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 75
	i32 4294763496 ; 287: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 66
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [288 x i32] [
	i32 9, i32 73, i32 116, i32 8, i32 130, i32 105, i32 84, i32 97, ; 0..7
	i32 84, i32 31, i32 125, i32 50, i32 86, i32 48, i32 69, i32 140, ; 8..15
	i32 54, i32 68, i32 39, i32 25, i32 38, i32 70, i32 13, i32 23, ; 16..23
	i32 53, i32 96, i32 67, i32 7, i32 22, i32 68, i32 113, i32 77, ; 24..31
	i32 113, i32 111, i32 132, i32 125, i32 120, i32 3, i32 95, i32 136, ; 32..39
	i32 59, i32 65, i32 29, i32 91, i32 45, i32 141, i32 127, i32 37, ; 40..47
	i32 123, i32 126, i32 11, i32 33, i32 135, i32 60, i32 134, i32 79, ; 48..55
	i32 107, i32 108, i32 116, i32 8, i32 126, i32 16, i32 70, i32 112, ; 56..63
	i32 83, i32 4, i32 115, i32 44, i32 119, i32 74, i32 124, i32 22, ; 64..71
	i32 109, i32 94, i32 89, i32 45, i32 15, i32 95, i32 51, i32 85, ; 72..79
	i32 128, i32 90, i32 127, i32 42, i32 12, i32 62, i32 94, i32 98, ; 80..87
	i32 139, i32 83, i32 122, i32 55, i32 27, i32 19, i32 135, i32 43, ; 88..95
	i32 19, i32 106, i32 61, i32 138, i32 115, i32 76, i32 93, i32 65, ; 96..103
	i32 58, i32 24, i32 28, i32 87, i32 114, i32 54, i32 13, i32 49, ; 104..111
	i32 86, i32 20, i32 67, i32 3, i32 76, i32 124, i32 114, i32 5, ; 112..119
	i32 33, i32 96, i32 104, i32 46, i32 118, i32 78, i32 110, i32 36, ; 120..127
	i32 18, i32 74, i32 35, i32 71, i32 28, i32 26, i32 14, i32 112, ; 128..135
	i32 117, i32 97, i32 5, i32 129, i32 24, i32 89, i32 99, i32 77, ; 136..143
	i32 78, i32 34, i32 81, i32 9, i32 40, i32 38, i32 64, i32 11, ; 144..151
	i32 53, i32 1, i32 2, i32 109, i32 110, i32 119, i32 133, i32 73, ; 152..159
	i32 35, i32 0, i32 29, i32 90, i32 129, i32 102, i32 58, i32 108, ; 160..167
	i32 63, i32 102, i32 0, i32 34, i32 128, i32 87, i32 39, i32 31, ; 168..175
	i32 43, i32 123, i32 92, i32 82, i32 17, i32 100, i32 55, i32 32, ; 176..183
	i32 82, i32 117, i32 92, i32 88, i32 105, i32 107, i32 66, i32 137, ; 184..191
	i32 7, i32 106, i32 93, i32 26, i32 41, i32 16, i32 62, i32 72, ; 192..199
	i32 85, i32 69, i32 121, i32 98, i32 101, i32 138, i32 143, i32 130, ; 200..207
	i32 111, i32 131, i32 61, i32 15, i32 118, i32 142, i32 49, i32 143, ; 208..215
	i32 47, i32 10, i32 59, i32 131, i32 120, i32 46, i32 80, i32 30, ; 216..223
	i32 12, i32 57, i32 2, i32 104, i32 81, i32 103, i32 27, i32 139, ; 224..231
	i32 60, i32 32, i32 1, i32 37, i32 63, i32 6, i32 17, i32 30, ; 232..239
	i32 132, i32 52, i32 47, i32 141, i32 137, i32 36, i32 79, i32 41, ; 240..247
	i32 71, i32 6, i32 140, i32 48, i32 52, i32 134, i32 56, i32 40, ; 248..255
	i32 21, i32 14, i32 50, i32 25, i32 4, i32 10, i32 88, i32 80, ; 256..263
	i32 57, i32 51, i32 136, i32 91, i32 122, i32 133, i32 44, i32 72, ; 264..271
	i32 121, i32 42, i32 23, i32 64, i32 142, i32 20, i32 99, i32 75, ; 272..279
	i32 103, i32 21, i32 56, i32 18, i32 101, i32 100, i32 75, i32 66 ; 288..287
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" "stackrealign" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"NumRegisterParameters", i32 0}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
