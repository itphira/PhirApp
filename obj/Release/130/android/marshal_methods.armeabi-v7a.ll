; ModuleID = 'obj\Release\130\android\marshal_methods.armeabi-v7a.ll'
source_filename = "obj\Release\130\android\marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


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
@assembly_image_cache_hashes = local_unnamed_addr constant [154 x i32] [
	i32 28873261, ; 0: Npgsql.dll => 0x1b8922d => 34
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 64
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 33
	i32 57305218, ; 3: Xamarin.KotlinX.Coroutines.Play.Services => 0x36a6882 => 74
	i32 99966887, ; 4: Xamarin.Firebase.Iid.dll => 0x5f55fa7 => 76
	i32 122350210, ; 5: System.Threading.Channels.dll => 0x74aea82 => 47
	i32 134690465, ; 6: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 69
	i32 318968648, ; 7: Xamarin.AndroidX.Activity.dll => 0x13031348 => 52
	i32 321597661, ; 8: System.Numerics => 0x132b30dd => 7
	i32 342366114, ; 9: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 15
	i32 347068432, ; 10: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 38
	i32 442521989, ; 11: Xamarin.Essentials => 0x1a605985 => 55
	i32 450948140, ; 12: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 14
	i32 465846621, ; 13: mscorlib => 0x1bc4415d => 2
	i32 469710990, ; 14: System.dll => 0x1bff388e => 5
	i32 485140951, ; 15: Xamarin.Google.Android.DataTransport.TransportRuntime => 0x1ceaa9d7 => 62
	i32 495452658, ; 16: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x1d8801f2 => 62
	i32 507148113, ; 17: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0x1e3a7751 => 60
	i32 526420162, ; 18: System.Transactions.dll => 0x1f6088c2 => 25
	i32 527452488, ; 19: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 69
	i32 548916678, ; 20: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 30
	i32 627609679, ; 21: Xamarin.AndroidX.CustomView => 0x2568904f => 12
	i32 662205335, ; 22: System.Text.Encodings.Web.dll => 0x27787397 => 45
	i32 663517072, ; 23: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 20
	i32 690569205, ; 24: System.Xml.Linq.dll => 0x29293ff5 => 27
	i32 691348768, ; 25: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 71
	i32 700284507, ; 26: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 22
	i32 720511267, ; 27: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 70
	i32 748832960, ; 28: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 36
	i32 755313932, ; 29: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 48
	i32 928116545, ; 30: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 64
	i32 955402788, ; 31: Newtonsoft.Json => 0x38f24a24 => 33
	i32 956575887, ; 32: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 70
	i32 961995525, ; 33: Square.OkIO.dll => 0x3956e305 => 41
	i32 967690846, ; 34: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 15
	i32 996733531, ; 35: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3b68f25b => 61
	i32 1012816738, ; 36: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 54
	i32 1028951442, ; 37: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 31
	i32 1031528504, ; 38: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 63
	i32 1035644815, ; 39: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 10
	i32 1052210849, ; 40: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 17
	i32 1084122840, ; 41: Xamarin.Kotlin.StdLib => 0x409e66d8 => 23
	i32 1098259244, ; 42: System => 0x41761b2c => 5
	i32 1175144683, ; 43: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 19
	i32 1221286664, ; 44: Square.OkHttp3 => 0x48cb5b08 => 40
	i32 1246548578, ; 45: Xamarin.AndroidX.Collection.Jvm.dll => 0x4a4cd262 => 53
	i32 1264890200, ; 46: Xamarin.KotlinX.Coroutines.Core.dll => 0x4b64b158 => 72
	i32 1275534314, ; 47: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 71
	i32 1292207520, ; 48: SQLitePCLRaw.core.dll => 0x4d0585a0 => 37
	i32 1293217323, ; 49: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 13
	i32 1333047053, ; 50: Xamarin.Firebase.Common => 0x4f74af0d => 56
	i32 1376866003, ; 51: Xamarin.AndroidX.SavedState => 0x52114ed3 => 54
	i32 1379897097, ; 52: Xamarin.JavaX.Inject => 0x523f8f09 => 68
	i32 1411638395, ; 53: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 8
	i32 1461234159, ; 54: System.Collections.Immutable.dll => 0x5718a9ef => 43
	i32 1479771757, ; 55: System.Collections.Immutable => 0x5833866d => 43
	i32 1592978981, ; 56: System.Runtime.Serialization.dll => 0x5ef2ee25 => 26
	i32 1597949149, ; 57: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 63
	i32 1622152042, ; 58: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 18
	i32 1639515021, ; 59: System.Net.Http.dll => 0x61b9038d => 6
	i32 1658251792, ; 60: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 21
	i32 1711441057, ; 61: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 38
	i32 1776026572, ; 62: System.Core.dll => 0x69dc03cc => 4
	i32 1788241197, ; 63: Xamarin.AndroidX.Fragment => 0x6a96652d => 14
	i32 1796167890, ; 64: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 30
	i32 1808609942, ; 65: Xamarin.AndroidX.Loader => 0x6bcd3296 => 18
	i32 1813058853, ; 66: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 23
	i32 1813201214, ; 67: Xamarin.Google.Android.Material => 0x6c13413e => 21
	i32 1828688058, ; 68: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 32
	i32 1847515442, ; 69: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 48
	i32 1867746548, ; 70: Xamarin.Essentials.dll => 0x6f538cf4 => 55
	i32 1876173635, ; 71: Xamarin.Firebase.Encoders.Proto => 0x6fd42343 => 58
	i32 1908813208, ; 72: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 66
	i32 1933215285, ; 73: Xamarin.Firebase.Messaging.dll => 0x733a8635 => 59
	i32 1985761444, ; 74: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 51
	i32 2011961780, ; 75: System.Buffers.dll => 0x77ec19b4 => 3
	i32 2019465201, ; 76: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 17
	i32 2031763787, ; 77: Xamarin.Android.Glide => 0x791a414b => 50
	i32 2055257422, ; 78: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 16
	i32 2103459038, ; 79: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 39
	i32 2124230737, ; 80: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x7e9d3051 => 61
	i32 2129483829, ; 81: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 65
	i32 2192057212, ; 82: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 32
	i32 2201107256, ; 83: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 73
	i32 2201231467, ; 84: System.Net.Http => 0x8334206b => 6
	i32 2217644978, ; 85: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 19
	i32 2267999099, ; 86: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 49
	i32 2294913272, ; 87: Npgsql => 0x88c998f8 => 34
	i32 2465273461, ; 88: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 36
	i32 2475788418, ; 89: Java.Interop.dll => 0x93918882 => 0
	i32 2483742551, ; 90: Xamarin.Firebase.Messaging => 0x940ae757 => 59
	i32 2522472828, ; 91: Xamarin.Android.Glide.dll => 0x9659e17c => 50
	i32 2537149420, ; 92: PhirAPP => 0x9739d3ec => 75
	i32 2570120770, ; 93: System.Text.Encodings.Web => 0x9930ee42 => 45
	i32 2605712449, ; 94: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 73
	i32 2620111890, ; 95: Xamarin.Firebase.Encoders.dll => 0x9c2bbc12 => 57
	i32 2639764100, ; 96: Xamarin.Firebase.Encoders => 0x9d579a84 => 57
	i32 2654752166, ; 97: PhirAPP.dll => 0x9e3c4da6 => 75
	i32 2663391936, ; 98: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 49
	i32 2671474046, ; 99: Xamarin.KotlinX.Coroutines.Core => 0x9f3b757e => 72
	i32 2732626843, ; 100: Xamarin.AndroidX.Activity => 0xa2e0939b => 52
	i32 2735172069, ; 101: System.Threading.Channels => 0xa30769e5 => 47
	i32 2770495804, ; 102: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 22
	i32 2793853378, ; 103: Square.Picasso.dll => 0xa686d1c2 => 42
	i32 2819470561, ; 104: System.Xml.dll => 0xa80db4e1 => 9
	i32 2847418871, ; 105: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 65
	i32 2870995654, ; 106: Xamarin.Firebase.Iid => 0xab1feac6 => 76
	i32 2905242038, ; 107: mscorlib.dll => 0xad2a79b6 => 2
	i32 2943219317, ; 108: Square.OkIO => 0xaf6df675 => 41
	i32 2978675010, ; 109: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 13
	i32 3058099980, ; 110: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 67
	i32 3071899978, ; 111: Xamarin.Firebase.Common.dll => 0xb719794a => 56
	i32 3111772706, ; 112: System.Runtime.Serialization => 0xb979e222 => 26
	i32 3124832203, ; 113: System.Threading.Tasks.Extensions => 0xba4127cb => 29
	i32 3150271759, ; 114: Xamarin.KotlinX.Coroutines.Play.Services.dll => 0xbbc5550f => 74
	i32 3155362983, ; 115: Xamarin.Google.Android.DataTransport.TransportApi => 0xbc1304a7 => 60
	i32 3204380047, ; 116: System.Data.dll => 0xbefef58f => 24
	i32 3217536604, ; 117: Square.OkHttp3.dll => 0xbfc7b65c => 40
	i32 3230466174, ; 118: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 66
	i32 3247949154, ; 119: Mono.Security => 0xc197c562 => 28
	i32 3265893370, ; 120: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 29
	i32 3286872994, ; 121: SQLite-net.dll => 0xc3e9b3a2 => 35
	i32 3317135071, ; 122: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 12
	i32 3317144872, ; 123: System.Data => 0xc5b79d28 => 24
	i32 3358260929, ; 124: System.Text.Json => 0xc82afec1 => 46
	i32 3360279109, ; 125: SQLitePCLRaw.core => 0xc849ca45 => 37
	i32 3362522851, ; 126: Xamarin.AndroidX.Core => 0xc86c06e3 => 11
	i32 3366347497, ; 127: Java.Interop => 0xc8a662e9 => 0
	i32 3371992681, ; 128: Xamarin.Firebase.Encoders.Proto.dll => 0xc8fc8669 => 58
	i32 3395150330, ; 129: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 8
	i32 3429136800, ; 130: System.Xml => 0xcc6479a0 => 9
	i32 3476120550, ; 131: Mono.Android => 0xcf3163e6 => 1
	i32 3479776177, ; 132: Square.Picasso => 0xcf692bb1 => 42
	i32 3485117614, ; 133: System.Text.Json.dll => 0xcfbaacae => 46
	i32 3486566296, ; 134: System.Transactions => 0xcfd0c798 => 25
	i32 3509114376, ; 135: System.Xml.Linq => 0xd128d608 => 27
	i32 3597029428, ; 136: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 51
	i32 3641597786, ; 137: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 16
	i32 3672681054, ; 138: Mono.Android.dll => 0xdae8aa5e => 1
	i32 3748608112, ; 139: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 44
	i32 3754567612, ; 140: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 39
	i32 3829621856, ; 141: System.Numerics.dll => 0xe4436460 => 7
	i32 3841636137, ; 142: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 31
	i32 3876362041, ; 143: SQLite-net => 0xe70c9739 => 35
	i32 3896760992, ; 144: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 11
	i32 3910130544, ; 145: Xamarin.AndroidX.Collection.Jvm => 0xe90fdb70 => 53
	i32 3921031405, ; 146: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 20
	i32 3934056515, ; 147: Xamarin.JavaX.Inject.dll => 0xea7cf043 => 68
	i32 3955647286, ; 148: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 10
	i32 3970018735, ; 149: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 67
	i32 4105002889, ; 150: Mono.Security.dll => 0xf4ad5f89 => 28
	i32 4151237749, ; 151: System.Core => 0xf76edc75 => 4
	i32 4213026141, ; 152: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 44
	i32 4260525087 ; 153: System.Buffers => 0xfdf2741f => 3
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [154 x i32] [
	i32 34, i32 64, i32 33, i32 74, i32 76, i32 47, i32 69, i32 52, ; 0..7
	i32 7, i32 15, i32 38, i32 55, i32 14, i32 2, i32 5, i32 62, ; 8..15
	i32 62, i32 60, i32 25, i32 69, i32 30, i32 12, i32 45, i32 20, ; 16..23
	i32 27, i32 71, i32 22, i32 70, i32 36, i32 48, i32 64, i32 33, ; 24..31
	i32 70, i32 41, i32 15, i32 61, i32 54, i32 31, i32 63, i32 10, ; 32..39
	i32 17, i32 23, i32 5, i32 19, i32 40, i32 53, i32 72, i32 71, ; 40..47
	i32 37, i32 13, i32 56, i32 54, i32 68, i32 8, i32 43, i32 43, ; 48..55
	i32 26, i32 63, i32 18, i32 6, i32 21, i32 38, i32 4, i32 14, ; 56..63
	i32 30, i32 18, i32 23, i32 21, i32 32, i32 48, i32 55, i32 58, ; 64..71
	i32 66, i32 59, i32 51, i32 3, i32 17, i32 50, i32 16, i32 39, ; 72..79
	i32 61, i32 65, i32 32, i32 73, i32 6, i32 19, i32 49, i32 34, ; 80..87
	i32 36, i32 0, i32 59, i32 50, i32 75, i32 45, i32 73, i32 57, ; 88..95
	i32 57, i32 75, i32 49, i32 72, i32 52, i32 47, i32 22, i32 42, ; 96..103
	i32 9, i32 65, i32 76, i32 2, i32 41, i32 13, i32 67, i32 56, ; 104..111
	i32 26, i32 29, i32 74, i32 60, i32 24, i32 40, i32 66, i32 28, ; 112..119
	i32 29, i32 35, i32 12, i32 24, i32 46, i32 37, i32 11, i32 0, ; 120..127
	i32 58, i32 8, i32 9, i32 1, i32 42, i32 46, i32 25, i32 27, ; 128..135
	i32 51, i32 16, i32 1, i32 44, i32 39, i32 7, i32 31, i32 35, ; 136..143
	i32 11, i32 53, i32 20, i32 68, i32 10, i32 67, i32 28, i32 4, ; 144..151
	i32 44, i32 3 ; 152..153
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="all" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn writeonly
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


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
