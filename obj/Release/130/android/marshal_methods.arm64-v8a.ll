; ModuleID = 'obj\Release\130\android\marshal_methods.arm64-v8a.ll'
source_filename = "obj\Release\130\android\marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android"


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
@assembly_image_cache_hashes = local_unnamed_addr constant [152 x i64] [
	i64 120698629574877762, ; 0: Mono.Android => 0x1accec39cafe242 => 1
	i64 232391251801502327, ; 1: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 54
	i64 233177144301842968, ; 2: Xamarin.AndroidX.Collection.Jvm.dll => 0x33c696097d9f218 => 53
	i64 870603111519317375, ; 3: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 38
	i64 872800313462103108, ; 4: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 13
	i64 940822596282819491, ; 5: System.Transactions => 0xd0e792aa81923a3 => 25
	i64 1000557547492888992, ; 6: Mono.Security.dll => 0xde2b1c9cba651a0 => 28
	i64 1120440138749646132, ; 7: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 21
	i64 1301485588176585670, ; 8: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 37
	i64 1425944114962822056, ; 9: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 26
	i64 1518315023656898250, ; 10: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 39
	i64 1731380447121279447, ; 11: Newtonsoft.Json => 0x18071957e9b889d7 => 33
	i64 1795316252682057001, ; 12: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 10
	i64 1836611346387731153, ; 13: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 54
	i64 1837131419302612636, ; 14: Xamarin.Google.Android.DataTransport.TransportBackendCct.dll => 0x197ecd4ad53dce9c => 62
	i64 1865037103900624886, ; 15: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 30
	i64 1981742497975770890, ; 16: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 17
	i64 2040001226662520565, ; 17: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 29
	i64 2064708342624596306, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 69
	i64 2133195048986300728, ; 19: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 33
	i64 2165310824878145998, ; 20: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 51
	i64 2189479245026779307, ; 21: Square.Picasso.dll => 0x1e6297c5e2e960ab => 42
	i64 2203565783020068373, ; 22: Xamarin.KotlinX.Coroutines.Core => 0x1e94a367981dde15 => 72
	i64 2262844636196693701, ; 23: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 13
	i64 2329709569556905518, ; 24: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 16
	i64 2335503487726329082, ; 25: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 45
	i64 2337758774805907496, ; 26: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 8
	i64 2479423007379663237, ; 27: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 19
	i64 2547086958574651984, ; 28: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 52
	i64 2592350477072141967, ; 29: System.Xml.dll => 0x23f9e10627330e8f => 9
	i64 2624866290265602282, ; 30: mscorlib.dll => 0x246d65fbde2db8ea => 2
	i64 2783046991838674048, ; 31: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 8
	i64 3017704767998173186, ; 32: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 21
	i64 3143515969535650208, ; 33: Xamarin.Firebase.Encoders => 0x2ba0031e85f0a9a0 => 57
	i64 3171992396844006720, ; 34: Square.OkIO => 0x2c052e476c207d40 => 41
	i64 3289520064315143713, ; 35: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 15
	i64 3344514922410554693, ; 36: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 73
	i64 3364695309916733813, ; 37: Xamarin.Firebase.Common => 0x2eb1cc8eb5028175 => 56
	i64 3411255996856937470, ; 38: Xamarin.GooglePlayServices.Basement => 0x2f5737416a942bfe => 66
	i64 3531994851595924923, ; 39: System.Numerics => 0x31042a9aade235bb => 7
	i64 3659371656528649588, ; 40: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 48
	i64 3768479575991719956, ; 41: Xamarin.KotlinX.Coroutines.Play.Services.dll => 0x344c5435464d1814 => 74
	i64 4247996603072512073, ; 42: Xamarin.GooglePlayServices.Tasks => 0x3af3ea6755340049 => 67
	i64 4335356748765836238, ; 43: Xamarin.Google.Android.DataTransport.TransportBackendCct => 0x3c2a47fe48c7b3ce => 62
	i64 4337444564132831293, ; 44: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 36
	i64 4636684751163556186, ; 45: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 20
	i64 4708653840312162517, ; 46: Square.OkHttp3 => 0x41587fb86215d8d5 => 40
	i64 4794310189461587505, ; 47: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 52
	i64 5203618020066742981, ; 48: Xamarin.Essentials => 0x4836f704f0e652c5 => 55
	i64 5376510917114486089, ; 49: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 19
	i64 5507995362134886206, ; 50: System.Core.dll => 0x4c705499688c873e => 4
	i64 6183170893902868313, ; 51: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 36
	i64 6222399776351216807, ; 52: System.Text.Json.dll => 0x565a67a0ffe264a7 => 46
	i64 6300241346327543539, ; 53: Xamarin.Firebase.Iid => 0x576ef41fd714fef3 => 59
	i64 6401687960814735282, ; 54: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 16
	i64 6548213210057960872, ; 55: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 12
	i64 6589202984700901502, ; 56: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 64
	i64 6876862101832370452, ; 57: System.Xml.Linq => 0x5f6f85a57d108914 => 27
	i64 6878582369430612696, ; 58: Xamarin.Google.Android.DataTransport.TransportRuntime.dll => 0x5f75a238802d2ad8 => 63
	i64 7026573318513401069, ; 59: Xamarin.Firebase.Encoders.Proto.dll => 0x618367346e3a9ced => 58
	i64 7192745174564810625, ; 60: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 51
	i64 7349431895026339542, ; 61: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 49
	i64 7488575175965059935, ; 62: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 27
	i64 7637365915383206639, ; 63: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 55
	i64 7654504624184590948, ; 64: System.Net.Http => 0x6a3a4366801b8264 => 6
	i64 7735352534559001595, ; 65: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 23
	i64 7820441508502274321, ; 66: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 8003335089973143038, ; 67: Square.OkHttp3.dll => 0x6f118edc6044a5fe => 40
	i64 8083354569033831015, ; 68: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 15
	i64 8087206902342787202, ; 69: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 44
	i64 8167236081217502503, ; 70: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 0
	i64 8187640529827139739, ; 71: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 71
	i64 8428678171113854126, ; 72: Xamarin.Firebase.Iid.dll => 0x74f8ae23bb5494ae => 59
	i64 8465511506719290632, ; 73: Xamarin.Firebase.Messaging.dll => 0x757b89dcf7fc3508 => 60
	i64 8518412311883997971, ; 74: System.Collections.Immutable => 0x76377add7c28e313 => 43
	i64 8609060182490045521, ; 75: Square.OkIO.dll => 0x7779869f8b475c51 => 41
	i64 8626175481042262068, ; 76: Java.Interop => 0x77b654e585b55834 => 0
	i64 8725526185868997716, ; 77: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 44
	i64 9031035476476434958, ; 78: Xamarin.KotlinX.Coroutines.Core.dll => 0x7d54aeead9541a0e => 72
	i64 9324707631942237306, ; 79: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 10
	i64 9662334977499516867, ; 80: System.Numerics.dll => 0x8617827802b0cfc3 => 7
	i64 9735414641753518179, ; 81: Xamarin.Firebase.Encoders.Proto => 0x871b240946daf063 => 58
	i64 9808709177481450983, ; 82: Mono.Android.dll => 0x881f890734e555e7 => 1
	i64 9834056768316610435, ; 83: System.Transactions.dll => 0x8879968718899783 => 25
	i64 9998632235833408227, ; 84: Mono.Security => 0x8ac2470b209ebae3 => 28
	i64 10038780035334861115, ; 85: System.Net.Http.dll => 0x8b50e941206af13b => 6
	i64 10226222362177979215, ; 86: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 69
	i64 10229024438826829339, ; 87: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 12
	i64 10321854143672141184, ; 88: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 22
	i64 10406448008575299332, ; 89: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 73
	i64 10430153318873392755, ; 90: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 11
	i64 10447083246144586668, ; 91: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 30
	i64 11002576679268595294, ; 92: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 32
	i64 11023048688141570732, ; 93: System.Core => 0x98f9bc61168392ac => 4
	i64 11037814507248023548, ; 94: System.Xml => 0x992e31d0412bf7fc => 9
	i64 11071824625609515081, ; 95: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 64
	i64 11299661109949763898, ; 96: Xamarin.AndroidX.Collection.Jvm => 0x9cd075e94cda113a => 53
	i64 11574940883421875631, ; 97: PhirAPP.dll => 0xa0a273682481cdaf => 75
	i64 11739066727115742305, ; 98: SQLite-net.dll => 0xa2e98afdf8575c61 => 35
	i64 11806260347154423189, ; 99: SQLite-net => 0xa3d8433bc5eb5d95 => 35
	i64 12102847907131387746, ; 100: System.Buffers => 0xa7f5f40c43256f62 => 3
	i64 12145679461940342714, ; 101: System.Text.Json => 0xa88e1f1ebcb62fba => 46
	i64 12191646537372739477, ; 102: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 50
	i64 12269460666702402136, ; 103: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 43
	i64 12279246230491828964, ; 104: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 39
	i64 12346958216201575315, ; 105: Xamarin.JavaX.Inject.dll => 0xab593514a5491b93 => 68
	i64 12451044538927396471, ; 106: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 14
	i64 12466513435562512481, ; 107: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 18
	i64 12828192437253469131, ; 108: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 70
	i64 12854524964145442905, ; 109: Xamarin.Firebase.Encoders.dll => 0xb26472594447b059 => 57
	i64 13370592475155966277, ; 110: System.Runtime.Serialization => 0xb98de304062ea945 => 26
	i64 13454009404024712428, ; 111: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 65
	i64 13465488254036897740, ; 112: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 23
	i64 13647894001087880694, ; 113: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13764593499834068841, ; 114: Npgsql => 0xbf05a8dc3342af69 => 34
	i64 13959074834287824816, ; 115: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 14
	i64 14178052285788134900, ; 116: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 48
	i64 14331727281556788554, ; 117: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 49
	i64 14524915121004231475, ; 118: Xamarin.JavaX.Inject => 0xc992dd58a4283b33 => 68
	i64 14551742072151931844, ; 119: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 45
	i64 14789919016435397935, ; 120: Xamarin.Firebase.Common.dll => 0xcd4058fc2f6d352f => 56
	i64 14792063746108907174, ; 121: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 65
	i64 14954917835170835695, ; 122: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 31
	i64 15099396616243600100, ; 123: Xamarin.KotlinX.Coroutines.Play.Services => 0xd18bd538f1ef5ae4 => 74
	i64 15279429628684179188, ; 124: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 71
	i64 15370334346939861994, ; 125: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 11
	i64 15391712275433856905, ; 126: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 31
	i64 15594006816328266073, ; 127: Square.Picasso => 0xd8690a9430443159 => 42
	i64 15609085926864131306, ; 128: System.dll => 0xd89e9cf3334914ea => 5
	i64 15656451852953216831, ; 129: PhirAPP => 0xd946e4024248673f => 75
	i64 15847085070278954535, ; 130: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 47
	i64 15930129725311349754, ; 131: Xamarin.GooglePlayServices.Tasks.dll => 0xdd1330956f12f3fa => 67
	i64 15963349826457351533, ; 132: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 29
	i64 16154507427712707110, ; 133: System => 0xe03056ea4e39aa26 => 5
	i64 16321164108206115771, ; 134: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 32
	i64 16391261437891890046, ; 135: Npgsql.dll => 0xe379756ee21acb7e => 34
	i64 16423015068819898779, ; 136: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 70
	i64 16467346005009053642, ; 137: Xamarin.Google.Android.DataTransport.TransportApi => 0xe487c3f19e0337ca => 61
	i64 16755018182064898362, ; 138: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 37
	i64 16833383113903931215, ; 139: mscorlib => 0xe99c30c1484d7f4f => 2
	i64 17118171214553292978, ; 140: System.Threading.Channels => 0xed8ff6060fc420b2 => 47
	i64 17434242208926550937, ; 141: Xamarin.Google.Android.DataTransport.TransportRuntime => 0xf1f2deeb1f304b99 => 63
	i64 17590473451926037903, ; 142: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 50
	i64 17704177640604968747, ; 143: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 18
	i64 17710060891934109755, ; 144: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 17
	i64 17838668724098252521, ; 145: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 3
	i64 17891337867145587222, ; 146: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 22
	i64 17945795017270165205, ; 147: Xamarin.Google.Android.DataTransport.TransportApi.dll => 0xf90c457cc05cfed5 => 61
	i64 17986907704309214542, ; 148: Xamarin.GooglePlayServices.Basement.dll => 0xf99e554223166d4e => 66
	i64 18337470502355292274, ; 149: Xamarin.Firebase.Messaging => 0xfe7bc8440c175072 => 60
	i64 18370042311372477656, ; 150: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 38
	i64 18380184030268848184 ; 151: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 20
], align 8
@assembly_image_cache_indices = local_unnamed_addr constant [152 x i32] [
	i32 1, i32 54, i32 53, i32 38, i32 13, i32 25, i32 28, i32 21, ; 0..7
	i32 37, i32 26, i32 39, i32 33, i32 10, i32 54, i32 62, i32 30, ; 8..15
	i32 17, i32 29, i32 69, i32 33, i32 51, i32 42, i32 72, i32 13, ; 16..23
	i32 16, i32 45, i32 8, i32 19, i32 52, i32 9, i32 2, i32 8, ; 24..31
	i32 21, i32 57, i32 41, i32 15, i32 73, i32 56, i32 66, i32 7, ; 32..39
	i32 48, i32 74, i32 67, i32 62, i32 36, i32 20, i32 40, i32 52, ; 40..47
	i32 55, i32 19, i32 4, i32 36, i32 46, i32 59, i32 16, i32 12, ; 48..55
	i32 64, i32 27, i32 63, i32 58, i32 51, i32 49, i32 27, i32 55, ; 56..63
	i32 6, i32 23, i32 24, i32 40, i32 15, i32 44, i32 0, i32 71, ; 64..71
	i32 59, i32 60, i32 43, i32 41, i32 0, i32 44, i32 72, i32 10, ; 72..79
	i32 7, i32 58, i32 1, i32 25, i32 28, i32 6, i32 69, i32 12, ; 80..87
	i32 22, i32 73, i32 11, i32 30, i32 32, i32 4, i32 9, i32 64, ; 88..95
	i32 53, i32 75, i32 35, i32 35, i32 3, i32 46, i32 50, i32 43, ; 96..103
	i32 39, i32 68, i32 14, i32 18, i32 70, i32 57, i32 26, i32 65, ; 104..111
	i32 23, i32 24, i32 34, i32 14, i32 48, i32 49, i32 68, i32 45, ; 112..119
	i32 56, i32 65, i32 31, i32 74, i32 71, i32 11, i32 31, i32 42, ; 120..127
	i32 5, i32 75, i32 47, i32 67, i32 29, i32 5, i32 32, i32 34, ; 128..135
	i32 70, i32 61, i32 37, i32 2, i32 47, i32 63, i32 50, i32 18, ; 136..143
	i32 17, i32 3, i32 22, i32 61, i32 66, i32 60, i32 38, i32 20 ; 152..151
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 8; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 8

; Function attributes: "frame-pointer"="non-leaf" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" uwtable willreturn writeonly
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
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="non-leaf" "target-cpu"="generic" "target-features"="+neon,+outline-atomics" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"branch-target-enforcement", i32 0}
!3 = !{i32 1, !"sign-return-address", i32 0}
!4 = !{i32 1, !"sign-return-address-all", i32 0}
!5 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
!6 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
