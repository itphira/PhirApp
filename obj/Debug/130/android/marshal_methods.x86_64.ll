; ModuleID = 'obj\Debug\130\android\marshal_methods.x86_64.ll'
source_filename = "obj\Debug\130\android\marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android"


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
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 8
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [288 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 63
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 6
	i64 210515253464952879, ; 2: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 50
	i64 232391251801502327, ; 3: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 83
	i64 233177144301842968, ; 4: Xamarin.AndroidX.Collection.Jvm.dll => 0x33c696097d9f218 => 51
	i64 295915112840604065, ; 5: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 84
	i64 316157742385208084, ; 6: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 56
	i64 322890146361922204, ; 7: Xamarin.Android.Support.Exif => 0x47b22e09b60529c => 38
	i64 634308326490598313, ; 8: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 73
	i64 687654259221141486, ; 9: Xamarin.GooglePlayServices.Base => 0x98b09e7c92917ee => 117
	i64 702024105029695270, ; 10: System.Drawing.Common => 0x9be17343c0e7726 => 134
	i64 870603111519317375, ; 11: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 13
	i64 872800313462103108, ; 12: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 62
	i64 940822596282819491, ; 13: System.Transactions => 0xd0e792aa81923a3 => 132
	i64 1000557547492888992, ; 14: Mono.Security.dll => 0xde2b1c9cba651a0 => 142
	i64 1120440138749646132, ; 15: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 114
	i64 1301485588176585670, ; 16: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 12
	i64 1315114680217950157, ; 17: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 45
	i64 1425944114962822056, ; 18: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 138
	i64 1465843056802068477, ; 19: Xamarin.Firebase.Components.dll => 0x1457b87e6928f7fd => 100
	i64 1518315023656898250, ; 20: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 14
	i64 1576750169145655260, ; 21: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 95
	i64 1624659445732251991, ; 22: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 43
	i64 1628611045998245443, ; 23: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 75
	i64 1636321030536304333, ; 24: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 69
	i64 1731380447121279447, ; 25: Newtonsoft.Json => 0x18071957e9b889d7 => 8
	i64 1743969030606105336, ; 26: System.Memory.dll => 0x1833d297e88f2af8 => 23
	i64 1795316252682057001, ; 27: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 44
	i64 1836611346387731153, ; 28: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 83
	i64 1837131419302612636, ; 29: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x197ecd4ad53dce9c => 112
	i64 1865037103900624886, ; 30: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 3
	i64 1875917498431009007, ; 31: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 40
	i64 1981742497975770890, ; 32: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 74
	i64 2040001226662520565, ; 33: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 143
	i64 2064708342624596306, ; 34: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 125
	i64 2133195048986300728, ; 35: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 8
	i64 2136356949452311481, ; 36: Xamarin.AndroidX.MultiDex.dll => 0x1da5dd539d8acbb9 => 78
	i64 2165310824878145998, ; 37: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 36
	i64 2165725771938924357, ; 38: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 48
	i64 2189479245026779307, ; 39: Square.Picasso.dll => 0x1e6297c5e2e960ab => 17
	i64 2203565783020068373, ; 40: Xamarin.KotlinX.Coroutines.Core => 0x1e94a367981dde15 => 128
	i64 2262844636196693701, ; 41: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 62
	i64 2284400282711631002, ; 42: System.Web.Services => 0x1fb3d1f42fd4249a => 140
	i64 2304837677853103545, ; 43: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 82
	i64 2329709569556905518, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 71
	i64 2335503487726329082, ; 45: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 29
	i64 2337758774805907496, ; 46: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 27
	i64 2470498323731680442, ; 47: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 55
	i64 2479423007379663237, ; 48: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 89
	i64 2497223385847772520, ; 49: System.Runtime => 0x22a7eb7046413568 => 28
	i64 2547086958574651984, ; 50: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 39
	i64 2592350477072141967, ; 51: System.Xml.dll => 0x23f9e10627330e8f => 32
	i64 2624866290265602282, ; 52: mscorlib.dll => 0x246d65fbde2db8ea => 7
	i64 2783046991838674048, ; 53: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 27
	i64 2787234703088983483, ; 54: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 85
	i64 3017704767998173186, ; 55: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 114
	i64 3143515969535650208, ; 56: Xamarin.Firebase.Encoders => 0x2ba0031e85f0a9a0 => 102
	i64 3171992396844006720, ; 57: Square.OkIO => 0x2c052e476c207d40 => 16
	i64 3289520064315143713, ; 58: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 70
	i64 3303437397778967116, ; 59: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 41
	i64 3311221304742556517, ; 60: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 26
	i64 3344514922410554693, ; 61: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 129
	i64 3364695309916733813, ; 62: Xamarin.Firebase.Common => 0x2eb1cc8eb5028175 => 98
	i64 3411255996856937470, ; 63: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 118
	i64 3493805808809882663, ; 64: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 87
	i64 3522470458906976663, ; 65: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 86
	i64 3531994851595924923, ; 66: System.Numerics => 0x31042a9aade235bb => 25
	i64 3571415421602489686, ; 67: System.Runtime.dll => 0x319037675df7e556 => 28
	i64 3659371656528649588, ; 68: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 33
	i64 3716579019761409177, ; 69: netstandard.dll => 0x3393f0ed5c8c5c99 => 1
	i64 3727469159507183293, ; 70: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 81
	i64 3768479575991719956, ; 71: Xamarin.KotlinX.Coroutines.Play.Services.dll => 0x344c5435464d1814 => 130
	i64 3772598417116884899, ; 72: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 63
	i64 3966267475168208030, ; 73: System.Memory => 0x370b03412596249e => 23
	i64 4201423742386704971, ; 74: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 56
	i64 4239882675311405204, ; 75: Xamarin.Firebase.Encoders.JSON => 0x3ad716d44f44e894 => 103
	i64 4247996603072512073, ; 76: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 121
	i64 4335356748765836238, ; 77: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3c2a47fe48c7b3ce => 112
	i64 4337444564132831293, ; 78: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 11
	i64 4525561845656915374, ; 79: System.ServiceModel.Internals => 0x3ece06856b710dae => 139
	i64 4636684751163556186, ; 80: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 91
	i64 4702770163853758138, ; 81: Xamarin.Firebase.Components => 0x4143988c34cf0eba => 100
	i64 4708653840312162517, ; 82: Square.OkHttp3 => 0x41587fb86215d8d5 => 15
	i64 4759461199762736555, ; 83: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 72
	i64 4782108999019072045, ; 84: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0x425d76cc43bb0a2d => 47
	i64 4794310189461587505, ; 85: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 39
	i64 4795410492532947900, ; 86: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 86
	i64 5203618020066742981, ; 87: Xamarin.Essentials => 0x4836f704f0e652c5 => 96
	i64 5205316157927637098, ; 88: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 77
	i64 5376510917114486089, ; 89: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 89
	i64 5408338804355907810, ; 90: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 88
	i64 5451019430259338467, ; 91: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 54
	i64 5507995362134886206, ; 92: System.Core.dll => 0x4c705499688c873e => 20
	i64 5574231584441077149, ; 93: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 42
	i64 5692067934154308417, ; 94: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 93
	i64 5724799082821825042, ; 95: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 66
	i64 5757522595884336624, ; 96: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 52
	i64 5767696078500135884, ; 97: Xamarin.Android.Support.Annotations.dll => 0x500af9065b6a03cc => 37
	i64 6058153446002397952, ; 98: Xamarin.Firebase.Common.Ktx => 0x5412e2762fc81300 => 99
	i64 6092862891035488599, ; 99: Xamarin.Firebase.Measurement.Connector.dll => 0x548e32849d547157 => 109
	i64 6183170893902868313, ; 100: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 11
	i64 6222399776351216807, ; 101: System.Text.Json.dll => 0x565a67a0ffe264a7 => 30
	i64 6300241346327543539, ; 102: Xamarin.Firebase.Iid => 0x576ef41fd714fef3 => 105
	i64 6319713645133255417, ; 103: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 73
	i64 6401687960814735282, ; 104: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 71
	i64 6504860066809920875, ; 105: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 48
	i64 6548213210057960872, ; 106: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 59
	i64 6554405243736097249, ; 107: Xamarin.GooglePlayServices.Stats => 0x5af5ecd7aad901e1 => 120
	i64 6557084851308642443, ; 108: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 94
	i64 6589202984700901502, ; 109: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 115
	i64 6591024623626361694, ; 110: System.Web.Services.dll => 0x5b7805f9751a1b5e => 140
	i64 6876862101832370452, ; 111: System.Xml.Linq => 0x5f6f85a57d108914 => 141
	i64 6878582369430612696, ; 112: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x5f75a238802d2ad8 => 113
	i64 6894844156784520562, ; 113: System.Numerics.Vectors => 0x5faf683aead1ad72 => 26
	i64 6975328107116786489, ; 114: Xamarin.Firebase.Annotations => 0x60cd57f4e07e7339 => 97
	i64 7026573318513401069, ; 115: Xamarin.Firebase.Encoders.Proto.dll => 0x618367346e3a9ced => 104
	i64 7103753931438454322, ; 116: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 68
	i64 7192745174564810625, ; 117: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 36
	i64 7349431895026339542, ; 118: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 34
	i64 7385250113861300937, ; 119: Xamarin.Firebase.Iid.Interop.dll => 0x667dadd98e1db2c9 => 106
	i64 7476537270401454554, ; 120: Xamarin.Firebase.Encoders.JSON.dll => 0x67c1ff08f83f51da => 103
	i64 7488575175965059935, ; 121: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 141
	i64 7637365915383206639, ; 122: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 96
	i64 7654504624184590948, ; 123: System.Net.Http => 0x6a3a4366801b8264 => 24
	i64 7735352534559001595, ; 124: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 124
	i64 7820441508502274321, ; 125: System.Data => 0x6c87ca1e14ff8111 => 131
	i64 7836164640616011524, ; 126: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 43
	i64 7904570928025870493, ; 127: Xamarin.Firebase.Installations => 0x6db2ad60fadca09d => 107
	i64 7940488133782528123, ; 128: Xamarin.GooglePlayServices.CloudMessaging => 0x6e3247e31d4fe07b => 119
	i64 7969431548154767168, ; 129: Xamarin.Firebase.Installations.dll => 0x6e991bc4e98e6740 => 107
	i64 8003335089973143038, ; 130: Square.OkHttp3.dll => 0x6f118edc6044a5fe => 15
	i64 8044118961405839122, ; 131: System.ComponentModel.Composition => 0x6fa2739369944712 => 137
	i64 8083354569033831015, ; 132: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 70
	i64 8087206902342787202, ; 133: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 21
	i64 8101777744205214367, ; 134: Xamarin.Android.Support.Annotations => 0x706f4beeec84729f => 37
	i64 8103644804370223335, ; 135: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 133
	i64 8167236081217502503, ; 136: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 2
	i64 8187640529827139739, ; 137: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 127
	i64 8398329775253868912, ; 138: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 53
	i64 8426919725312979251, ; 139: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 72
	i64 8428678171113854126, ; 140: Xamarin.Firebase.Iid.dll => 0x74f8ae23bb5494ae => 105
	i64 8450804802111199978, ; 141: Xamarin.Android.Support.Exif.dll => 0x75474a317800daea => 38
	i64 8465511506719290632, ; 142: Xamarin.Firebase.Messaging.dll => 0x757b89dcf7fc3508 => 110
	i64 8518412311883997971, ; 143: System.Collections.Immutable => 0x76377add7c28e313 => 19
	i64 8598790081731763592, ; 144: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 65
	i64 8601935802264776013, ; 145: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 88
	i64 8609060182490045521, ; 146: Square.OkIO.dll => 0x7779869f8b475c51 => 16
	i64 8626175481042262068, ; 147: Java.Interop => 0x77b654e585b55834 => 2
	i64 8684531736582871431, ; 148: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 136
	i64 8725526185868997716, ; 149: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 21
	i64 8951477988056063522, ; 150: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 80
	i64 9031035476476434958, ; 151: Xamarin.KotlinX.Coroutines.Core.dll => 0x7d54aeead9541a0e => 128
	i64 9312692141327339315, ; 152: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 93
	i64 9324707631942237306, ; 153: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 44
	i64 9662334977499516867, ; 154: System.Numerics.dll => 0x8617827802b0cfc3 => 25
	i64 9678050649315576968, ; 155: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 55
	i64 9735414641753518179, ; 156: Xamarin.Firebase.Encoders.Proto => 0x871b240946daf063 => 104
	i64 9774216967140627647, ; 157: Xamarin.Firebase.Datatransport.dll => 0x87a4fe8bac0354bf => 101
	i64 9780093022148426479, ; 158: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 95
	i64 9796610708422913120, ; 159: Xamarin.Firebase.Iid.Interop => 0x87f48d88de55ec60 => 106
	i64 9808709177481450983, ; 160: Mono.Android.dll => 0x881f890734e555e7 => 6
	i64 9825649861376906464, ; 161: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 52
	i64 9834056768316610435, ; 162: System.Transactions.dll => 0x8879968718899783 => 132
	i64 9875200773399460291, ; 163: Xamarin.GooglePlayServices.Base.dll => 0x890bc2c8482339c3 => 117
	i64 9907349773706910547, ; 164: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 65
	i64 9998632235833408227, ; 165: Mono.Security => 0x8ac2470b209ebae3 => 142
	i64 10038780035334861115, ; 166: System.Net.Http.dll => 0x8b50e941206af13b => 24
	i64 10226222362177979215, ; 167: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 125
	i64 10229024438826829339, ; 168: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 59
	i64 10321854143672141184, ; 169: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 123
	i64 10352330178246763130, ; 170: Xamarin.Firebase.Measurement.Connector => 0x8faadd72b7f4627a => 109
	i64 10376576884623852283, ; 171: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 87
	i64 10406448008575299332, ; 172: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 129
	i64 10430153318873392755, ; 173: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 57
	i64 10447083246144586668, ; 174: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 3
	i64 10847732767863316357, ; 175: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 45
	i64 11002576679268595294, ; 176: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 5
	i64 11019817191295005410, ; 177: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 42
	i64 11023048688141570732, ; 178: System.Core => 0x98f9bc61168392ac => 20
	i64 11037814507248023548, ; 179: System.Xml => 0x992e31d0412bf7fc => 32
	i64 11071824625609515081, ; 180: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 115
	i64 11162124722117608902, ; 181: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 92
	i64 11171845786728836392, ; 182: Xamarin.GooglePlayServices.CloudMessaging.dll => 0x9b0a5e8d536aad28 => 119
	i64 11299661109949763898, ; 183: Xamarin.AndroidX.Collection.Jvm => 0x9cd075e94cda113a => 51
	i64 11336891506707244397, ; 184: Xamarin.Firebase.Datatransport => 0x9d54bac28a6da56d => 101
	i64 11340910727871153756, ; 185: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 58
	i64 11376351552967644903, ; 186: Xamarin.Firebase.Annotations.dll => 0x9de0eb76829996e7 => 97
	i64 11392833485892708388, ; 187: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 79
	i64 11529969570048099689, ; 188: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 92
	i64 11574940883421875631, ; 189: PhirAPP.dll => 0xa0a273682481cdaf => 0
	i64 11580057168383206117, ; 190: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 40
	i64 11591352189662810718, ; 191: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 85
	i64 11597940890313164233, ; 192: netstandard => 0xa0f429ca8d1805c9 => 1
	i64 11672361001936329215, ; 193: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 68
	i64 11739066727115742305, ; 194: SQLite-net.dll => 0xa2e98afdf8575c61 => 10
	i64 11806260347154423189, ; 195: SQLite-net => 0xa3d8433bc5eb5d95 => 10
	i64 12102847907131387746, ; 196: System.Buffers => 0xa7f5f40c43256f62 => 18
	i64 12137774235383566651, ; 197: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 90
	i64 12145679461940342714, ; 198: System.Text.Json => 0xa88e1f1ebcb62fba => 30
	i64 12191646537372739477, ; 199: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 35
	i64 12269460666702402136, ; 200: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 19
	i64 12279246230491828964, ; 201: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 14
	i64 12346958216201575315, ; 202: Xamarin.JavaX.Inject.dll => 0xab593514a5491b93 => 122
	i64 12451044538927396471, ; 203: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 67
	i64 12466513435562512481, ; 204: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 76
	i64 12487638416075308985, ; 205: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 61
	i64 12538491095302438457, ; 206: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 49
	i64 12550732019250633519, ; 207: System.IO.Compression => 0xae2d28465e8e1b2f => 135
	i64 12700543734426720211, ; 208: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 50
	i64 12753841065332862057, ; 209: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 94
	i64 12828192437253469131, ; 210: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 126
	i64 12854524964145442905, ; 211: Xamarin.Firebase.Encoders.dll => 0xb26472594447b059 => 102
	i64 12963446364377008305, ; 212: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 134
	i64 12982280885948128408, ; 213: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 60
	i64 13129914918964716986, ; 214: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 64
	i64 13370592475155966277, ; 215: System.Runtime.Serialization => 0xb98de304062ea945 => 138
	i64 13401370062847626945, ; 216: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 90
	i64 13404347523447273790, ; 217: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 53
	i64 13454009404024712428, ; 218: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 116
	i64 13465488254036897740, ; 219: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 124
	i64 13491513212026656886, ; 220: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 46
	i64 13572454107664307259, ; 221: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 81
	i64 13621154251410165619, ; 222: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 60
	i64 13647894001087880694, ; 223: System.Data.dll => 0xbd670f48cb071df6 => 131
	i64 13764593499834068841, ; 224: Npgsql => 0xbf05a8dc3342af69 => 9
	i64 13807020823704499900, ; 225: Xamarin.Firebase.Common.Ktx.dll => 0xbf9c64495353f6bc => 99
	i64 13829530607229561650, ; 226: Xamarin.Firebase.Installations.InterOp => 0xbfec5cd0b64f6b32 => 108
	i64 13959074834287824816, ; 227: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 67
	i64 14124974489674258913, ; 228: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 49
	i64 14172845254133543601, ; 229: Xamarin.AndroidX.MultiDex => 0xc4b00faaed35f2b1 => 78
	i64 14178052285788134900, ; 230: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 33
	i64 14261073672896646636, ; 231: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 79
	i64 14331727281556788554, ; 232: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 34
	i64 14495724990987328804, ; 233: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 82
	i64 14524915121004231475, ; 234: Xamarin.JavaX.Inject => 0xc992dd58a4283b33 => 122
	i64 14551742072151931844, ; 235: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 29
	i64 14644440854989303794, ; 236: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 77
	i64 14789919016435397935, ; 237: Xamarin.Firebase.Common.dll => 0xcd4058fc2f6d352f => 98
	i64 14792063746108907174, ; 238: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 116
	i64 14809388726477333247, ; 239: Xamarin.GooglePlayServices.Stats.dll => 0xcd8584954e5b22ff => 120
	i64 14852515768018889994, ; 240: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 58
	i64 14954917835170835695, ; 241: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 4
	i64 14987728460634540364, ; 242: System.IO.Compression.dll => 0xcfff1ba06622494c => 135
	i64 14988210264188246988, ; 243: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 61
	i64 15099396616243600100, ; 244: Xamarin.KotlinX.Coroutines.Play.Services => 0xd18bd538f1ef5ae4 => 130
	i64 15150743910298169673, ; 245: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 80
	i64 15279429628684179188, ; 246: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 127
	i64 15370334346939861994, ; 247: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 57
	i64 15391712275433856905, ; 248: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 4
	i64 15582737692548360875, ; 249: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 75
	i64 15594006816328266073, ; 250: Square.Picasso => 0xd8690a9430443159 => 17
	i64 15609085926864131306, ; 251: System.dll => 0xd89e9cf3334914ea => 22
	i64 15656451852953216831, ; 252: PhirAPP => 0xd946e4024248673f => 0
	i64 15777549416145007739, ; 253: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 84
	i64 15847085070278954535, ; 254: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 31
	i64 15930129725311349754, ; 255: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 121
	i64 15963349826457351533, ; 256: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 143
	i64 16154507427712707110, ; 257: System => 0xe03056ea4e39aa26 => 22
	i64 16321164108206115771, ; 258: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 5
	i64 16361933716545543812, ; 259: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 66
	i64 16391261437891890046, ; 260: Npgsql.dll => 0xe379756ee21acb7e => 9
	i64 16423015068819898779, ; 261: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 126
	i64 16467346005009053642, ; 262: Xamarin.Google.Android.DataTransport.TransportApi => 0xe487c3f19e0337ca => 111
	i64 16565028646146589191, ; 263: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 137
	i64 16621146507174665210, ; 264: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 54
	i64 16755018182064898362, ; 265: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 12
	i64 16822611501064131242, ; 266: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 133
	i64 16833383113903931215, ; 267: mscorlib => 0xe99c30c1484d7f4f => 7
	i64 17024911836938395553, ; 268: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 41
	i64 17037200463775726619, ; 269: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 69
	i64 17118171214553292978, ; 270: System.Threading.Channels => 0xed8ff6060fc420b2 => 31
	i64 17434242208926550937, ; 271: Xamarin.Google.Android.DataTransport.TransportRuntime => 0xf1f2deeb1f304b99 => 113
	i64 17544493274320527064, ; 272: Xamarin.AndroidX.AsyncLayoutInflater => 0xf37a8fada41aded8 => 47
	i64 17590473451926037903, ; 273: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 35
	i64 17677828421478984182, ; 274: Xamarin.Firebase.Installations.InterOp.dll => 0xf5544349c68f29f6 => 108
	i64 17704177640604968747, ; 275: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 76
	i64 17710060891934109755, ; 276: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 74
	i64 17838668724098252521, ; 277: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 18
	i64 17891337867145587222, ; 278: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 123
	i64 17928294245072900555, ; 279: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 136
	i64 17945795017270165205, ; 280: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0xf90c457cc05cfed5 => 111
	i64 17986907704309214542, ; 281: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 118
	i64 18116111925905154859, ; 282: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 46
	i64 18129453464017766560, ; 283: System.ServiceModel.Internals.dll => 0xfb98c1df1ec108a0 => 139
	i64 18260797123374478311, ; 284: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 64
	i64 18337470502355292274, ; 285: Xamarin.Firebase.Messaging => 0xfe7bc8440c175072 => 110
	i64 18370042311372477656, ; 286: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 13
	i64 18380184030268848184 ; 287: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 91
], align 16
@assembly_image_cache_indices = local_unnamed_addr constant [288 x i32] [
	i32 63, i32 6, i32 50, i32 83, i32 51, i32 84, i32 56, i32 38, ; 0..7
	i32 73, i32 117, i32 134, i32 13, i32 62, i32 132, i32 142, i32 114, ; 8..15
	i32 12, i32 45, i32 138, i32 100, i32 14, i32 95, i32 43, i32 75, ; 16..23
	i32 69, i32 8, i32 23, i32 44, i32 83, i32 112, i32 3, i32 40, ; 24..31
	i32 74, i32 143, i32 125, i32 8, i32 78, i32 36, i32 48, i32 17, ; 32..39
	i32 128, i32 62, i32 140, i32 82, i32 71, i32 29, i32 27, i32 55, ; 40..47
	i32 89, i32 28, i32 39, i32 32, i32 7, i32 27, i32 85, i32 114, ; 48..55
	i32 102, i32 16, i32 70, i32 41, i32 26, i32 129, i32 98, i32 118, ; 56..63
	i32 87, i32 86, i32 25, i32 28, i32 33, i32 1, i32 81, i32 130, ; 64..71
	i32 63, i32 23, i32 56, i32 103, i32 121, i32 112, i32 11, i32 139, ; 72..79
	i32 91, i32 100, i32 15, i32 72, i32 47, i32 39, i32 86, i32 96, ; 80..87
	i32 77, i32 89, i32 88, i32 54, i32 20, i32 42, i32 93, i32 66, ; 88..95
	i32 52, i32 37, i32 99, i32 109, i32 11, i32 30, i32 105, i32 73, ; 96..103
	i32 71, i32 48, i32 59, i32 120, i32 94, i32 115, i32 140, i32 141, ; 104..111
	i32 113, i32 26, i32 97, i32 104, i32 68, i32 36, i32 34, i32 106, ; 112..119
	i32 103, i32 141, i32 96, i32 24, i32 124, i32 131, i32 43, i32 107, ; 120..127
	i32 119, i32 107, i32 15, i32 137, i32 70, i32 21, i32 37, i32 133, ; 128..135
	i32 2, i32 127, i32 53, i32 72, i32 105, i32 38, i32 110, i32 19, ; 136..143
	i32 65, i32 88, i32 16, i32 2, i32 136, i32 21, i32 80, i32 128, ; 144..151
	i32 93, i32 44, i32 25, i32 55, i32 104, i32 101, i32 95, i32 106, ; 152..159
	i32 6, i32 52, i32 132, i32 117, i32 65, i32 142, i32 24, i32 125, ; 160..167
	i32 59, i32 123, i32 109, i32 87, i32 129, i32 57, i32 3, i32 45, ; 168..175
	i32 5, i32 42, i32 20, i32 32, i32 115, i32 92, i32 119, i32 51, ; 176..183
	i32 101, i32 58, i32 97, i32 79, i32 92, i32 0, i32 40, i32 85, ; 184..191
	i32 1, i32 68, i32 10, i32 10, i32 18, i32 90, i32 30, i32 35, ; 192..199
	i32 19, i32 14, i32 122, i32 67, i32 76, i32 61, i32 49, i32 135, ; 200..207
	i32 50, i32 94, i32 126, i32 102, i32 134, i32 60, i32 64, i32 138, ; 208..215
	i32 90, i32 53, i32 116, i32 124, i32 46, i32 81, i32 60, i32 131, ; 216..223
	i32 9, i32 99, i32 108, i32 67, i32 49, i32 78, i32 33, i32 79, ; 224..231
	i32 34, i32 82, i32 122, i32 29, i32 77, i32 98, i32 116, i32 120, ; 232..239
	i32 58, i32 4, i32 135, i32 61, i32 130, i32 80, i32 127, i32 57, ; 240..247
	i32 4, i32 75, i32 17, i32 22, i32 0, i32 84, i32 31, i32 121, ; 248..255
	i32 143, i32 22, i32 5, i32 66, i32 9, i32 126, i32 111, i32 137, ; 256..263
	i32 54, i32 12, i32 133, i32 7, i32 41, i32 69, i32 31, i32 113, ; 264..271
	i32 47, i32 35, i32 108, i32 76, i32 74, i32 18, i32 123, i32 136, ; 272..279
	i32 111, i32 118, i32 46, i32 139, i32 64, i32 110, i32 13, i32 91 ; 288..287
], align 16

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 8; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 8

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 8
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 8
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 16; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
