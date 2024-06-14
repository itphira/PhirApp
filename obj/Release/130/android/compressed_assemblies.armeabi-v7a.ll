; ModuleID = 'obj\Release\130\android\compressed_assemblies.armeabi-v7a.ll'
source_filename = "obj\Release\130\android\compressed_assemblies.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


%struct.CompressedAssemblyDescriptor = type {
	i32,; uint32_t uncompressed_file_size
	i8,; bool loaded
	i8*; uint8_t* data
}

%struct.CompressedAssemblies = type {
	i32,; uint32_t count
	%struct.CompressedAssemblyDescriptor*; CompressedAssemblyDescriptor* descriptors
}
@__CompressedAssemblyDescriptor_data_0 = internal global [168960 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_1 = internal global [8704 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_2 = internal global [52736 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_3 = internal global [56832 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_4 = internal global [1735168 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_5 = internal global [121856 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_6 = internal global [690176 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_7 = internal global [1406464 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_8 = internal global [407552 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_9 = internal global [106496 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_10 = internal global [5632 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_11 = internal global [50176 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_12 = internal global [5120 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_13 = internal global [39424 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_14 = internal global [232448 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_15 = internal global [120320 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_16 = internal global [110592 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_17 = internal global [14768 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_18 = internal global [239104 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_19 = internal global [390144 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_20 = internal global [838656 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_21 = internal global [163328 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_22 = internal global [219648 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_23 = internal global [40960 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_24 = internal global [8192 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_25 = internal global [6144 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_26 = internal global [68096 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_27 = internal global [593920 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_28 = internal global [65024 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_29 = internal global [15296 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_30 = internal global [15360 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_31 = internal global [65024 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_32 = internal global [1318912 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_33 = internal global [887296 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_34 = internal global [15296 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_35 = internal global [24512 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_36 = internal global [58296 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_37 = internal global [1092536 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_38 = internal global [72192 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_39 = internal global [335360 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_40 = internal global [27648 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_41 = internal global [370176 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_42 = internal global [9728 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_43 = internal global [41984 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_44 = internal global [201728 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_45 = internal global [17408 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_46 = internal global [17408 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_47 = internal global [29184 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_48 = internal global [37376 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_49 = internal global [14848 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_50 = internal global [16384 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_51 = internal global [10752 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_52 = internal global [24064 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_53 = internal global [32768 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_54 = internal global [8704 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_55 = internal global [10240 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_56 = internal global [15872 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_57 = internal global [39936 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_58 = internal global [35840 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_59 = internal global [119296 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_60 = internal global [321024 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_61 = internal global [212480 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_62 = internal global [77312 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_63 = internal global [23576 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_64 = internal global [13824 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_65 = internal global [52224 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_66 = internal global [18944 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_67 = internal global [153016 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_68 = internal global [15384 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_69 = internal global [15392 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_70 = internal global [2247600 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_71 = internal global [27064 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_72 = internal global [537528 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_73 = internal global [14776 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_74 = internal global [22048 x i8] zeroinitializer, align 1
@__CompressedAssemblyDescriptor_data_75 = internal global [2188288 x i8] zeroinitializer, align 1


; Compressed assembly data storage
@compressed_assembly_descriptors = internal global [76 x %struct.CompressedAssemblyDescriptor] [
	; 0
	%struct.CompressedAssemblyDescriptor {
		i32 168960, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([168960 x i8], [168960 x i8]* @__CompressedAssemblyDescriptor_data_0, i32 0, i32 0); data
	}, 
	; 1
	%struct.CompressedAssemblyDescriptor {
		i32 8704, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([8704 x i8], [8704 x i8]* @__CompressedAssemblyDescriptor_data_1, i32 0, i32 0); data
	}, 
	; 2
	%struct.CompressedAssemblyDescriptor {
		i32 52736, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([52736 x i8], [52736 x i8]* @__CompressedAssemblyDescriptor_data_2, i32 0, i32 0); data
	}, 
	; 3
	%struct.CompressedAssemblyDescriptor {
		i32 56832, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([56832 x i8], [56832 x i8]* @__CompressedAssemblyDescriptor_data_3, i32 0, i32 0); data
	}, 
	; 4
	%struct.CompressedAssemblyDescriptor {
		i32 1735168, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([1735168 x i8], [1735168 x i8]* @__CompressedAssemblyDescriptor_data_4, i32 0, i32 0); data
	}, 
	; 5
	%struct.CompressedAssemblyDescriptor {
		i32 121856, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([121856 x i8], [121856 x i8]* @__CompressedAssemblyDescriptor_data_5, i32 0, i32 0); data
	}, 
	; 6
	%struct.CompressedAssemblyDescriptor {
		i32 690176, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([690176 x i8], [690176 x i8]* @__CompressedAssemblyDescriptor_data_6, i32 0, i32 0); data
	}, 
	; 7
	%struct.CompressedAssemblyDescriptor {
		i32 1406464, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([1406464 x i8], [1406464 x i8]* @__CompressedAssemblyDescriptor_data_7, i32 0, i32 0); data
	}, 
	; 8
	%struct.CompressedAssemblyDescriptor {
		i32 407552, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([407552 x i8], [407552 x i8]* @__CompressedAssemblyDescriptor_data_8, i32 0, i32 0); data
	}, 
	; 9
	%struct.CompressedAssemblyDescriptor {
		i32 106496, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([106496 x i8], [106496 x i8]* @__CompressedAssemblyDescriptor_data_9, i32 0, i32 0); data
	}, 
	; 10
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([5632 x i8], [5632 x i8]* @__CompressedAssemblyDescriptor_data_10, i32 0, i32 0); data
	}, 
	; 11
	%struct.CompressedAssemblyDescriptor {
		i32 50176, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([50176 x i8], [50176 x i8]* @__CompressedAssemblyDescriptor_data_11, i32 0, i32 0); data
	}, 
	; 12
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([5120 x i8], [5120 x i8]* @__CompressedAssemblyDescriptor_data_12, i32 0, i32 0); data
	}, 
	; 13
	%struct.CompressedAssemblyDescriptor {
		i32 39424, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([39424 x i8], [39424 x i8]* @__CompressedAssemblyDescriptor_data_13, i32 0, i32 0); data
	}, 
	; 14
	%struct.CompressedAssemblyDescriptor {
		i32 232448, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([232448 x i8], [232448 x i8]* @__CompressedAssemblyDescriptor_data_14, i32 0, i32 0); data
	}, 
	; 15
	%struct.CompressedAssemblyDescriptor {
		i32 120320, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([120320 x i8], [120320 x i8]* @__CompressedAssemblyDescriptor_data_15, i32 0, i32 0); data
	}, 
	; 16
	%struct.CompressedAssemblyDescriptor {
		i32 110592, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([110592 x i8], [110592 x i8]* @__CompressedAssemblyDescriptor_data_16, i32 0, i32 0); data
	}, 
	; 17
	%struct.CompressedAssemblyDescriptor {
		i32 14768, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([14768 x i8], [14768 x i8]* @__CompressedAssemblyDescriptor_data_17, i32 0, i32 0); data
	}, 
	; 18
	%struct.CompressedAssemblyDescriptor {
		i32 239104, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([239104 x i8], [239104 x i8]* @__CompressedAssemblyDescriptor_data_18, i32 0, i32 0); data
	}, 
	; 19
	%struct.CompressedAssemblyDescriptor {
		i32 390144, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([390144 x i8], [390144 x i8]* @__CompressedAssemblyDescriptor_data_19, i32 0, i32 0); data
	}, 
	; 20
	%struct.CompressedAssemblyDescriptor {
		i32 838656, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([838656 x i8], [838656 x i8]* @__CompressedAssemblyDescriptor_data_20, i32 0, i32 0); data
	}, 
	; 21
	%struct.CompressedAssemblyDescriptor {
		i32 163328, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([163328 x i8], [163328 x i8]* @__CompressedAssemblyDescriptor_data_21, i32 0, i32 0); data
	}, 
	; 22
	%struct.CompressedAssemblyDescriptor {
		i32 219648, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([219648 x i8], [219648 x i8]* @__CompressedAssemblyDescriptor_data_22, i32 0, i32 0); data
	}, 
	; 23
	%struct.CompressedAssemblyDescriptor {
		i32 40960, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([40960 x i8], [40960 x i8]* @__CompressedAssemblyDescriptor_data_23, i32 0, i32 0); data
	}, 
	; 24
	%struct.CompressedAssemblyDescriptor {
		i32 8192, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([8192 x i8], [8192 x i8]* @__CompressedAssemblyDescriptor_data_24, i32 0, i32 0); data
	}, 
	; 25
	%struct.CompressedAssemblyDescriptor {
		i32 6144, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([6144 x i8], [6144 x i8]* @__CompressedAssemblyDescriptor_data_25, i32 0, i32 0); data
	}, 
	; 26
	%struct.CompressedAssemblyDescriptor {
		i32 68096, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([68096 x i8], [68096 x i8]* @__CompressedAssemblyDescriptor_data_26, i32 0, i32 0); data
	}, 
	; 27
	%struct.CompressedAssemblyDescriptor {
		i32 593920, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([593920 x i8], [593920 x i8]* @__CompressedAssemblyDescriptor_data_27, i32 0, i32 0); data
	}, 
	; 28
	%struct.CompressedAssemblyDescriptor {
		i32 65024, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([65024 x i8], [65024 x i8]* @__CompressedAssemblyDescriptor_data_28, i32 0, i32 0); data
	}, 
	; 29
	%struct.CompressedAssemblyDescriptor {
		i32 15296, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([15296 x i8], [15296 x i8]* @__CompressedAssemblyDescriptor_data_29, i32 0, i32 0); data
	}, 
	; 30
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([15360 x i8], [15360 x i8]* @__CompressedAssemblyDescriptor_data_30, i32 0, i32 0); data
	}, 
	; 31
	%struct.CompressedAssemblyDescriptor {
		i32 65024, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([65024 x i8], [65024 x i8]* @__CompressedAssemblyDescriptor_data_31, i32 0, i32 0); data
	}, 
	; 32
	%struct.CompressedAssemblyDescriptor {
		i32 1318912, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([1318912 x i8], [1318912 x i8]* @__CompressedAssemblyDescriptor_data_32, i32 0, i32 0); data
	}, 
	; 33
	%struct.CompressedAssemblyDescriptor {
		i32 887296, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([887296 x i8], [887296 x i8]* @__CompressedAssemblyDescriptor_data_33, i32 0, i32 0); data
	}, 
	; 34
	%struct.CompressedAssemblyDescriptor {
		i32 15296, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([15296 x i8], [15296 x i8]* @__CompressedAssemblyDescriptor_data_34, i32 0, i32 0); data
	}, 
	; 35
	%struct.CompressedAssemblyDescriptor {
		i32 24512, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([24512 x i8], [24512 x i8]* @__CompressedAssemblyDescriptor_data_35, i32 0, i32 0); data
	}, 
	; 36
	%struct.CompressedAssemblyDescriptor {
		i32 58296, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([58296 x i8], [58296 x i8]* @__CompressedAssemblyDescriptor_data_36, i32 0, i32 0); data
	}, 
	; 37
	%struct.CompressedAssemblyDescriptor {
		i32 1092536, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([1092536 x i8], [1092536 x i8]* @__CompressedAssemblyDescriptor_data_37, i32 0, i32 0); data
	}, 
	; 38
	%struct.CompressedAssemblyDescriptor {
		i32 72192, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([72192 x i8], [72192 x i8]* @__CompressedAssemblyDescriptor_data_38, i32 0, i32 0); data
	}, 
	; 39
	%struct.CompressedAssemblyDescriptor {
		i32 335360, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([335360 x i8], [335360 x i8]* @__CompressedAssemblyDescriptor_data_39, i32 0, i32 0); data
	}, 
	; 40
	%struct.CompressedAssemblyDescriptor {
		i32 27648, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([27648 x i8], [27648 x i8]* @__CompressedAssemblyDescriptor_data_40, i32 0, i32 0); data
	}, 
	; 41
	%struct.CompressedAssemblyDescriptor {
		i32 370176, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([370176 x i8], [370176 x i8]* @__CompressedAssemblyDescriptor_data_41, i32 0, i32 0); data
	}, 
	; 42
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([9728 x i8], [9728 x i8]* @__CompressedAssemblyDescriptor_data_42, i32 0, i32 0); data
	}, 
	; 43
	%struct.CompressedAssemblyDescriptor {
		i32 41984, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([41984 x i8], [41984 x i8]* @__CompressedAssemblyDescriptor_data_43, i32 0, i32 0); data
	}, 
	; 44
	%struct.CompressedAssemblyDescriptor {
		i32 201728, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([201728 x i8], [201728 x i8]* @__CompressedAssemblyDescriptor_data_44, i32 0, i32 0); data
	}, 
	; 45
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([17408 x i8], [17408 x i8]* @__CompressedAssemblyDescriptor_data_45, i32 0, i32 0); data
	}, 
	; 46
	%struct.CompressedAssemblyDescriptor {
		i32 17408, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([17408 x i8], [17408 x i8]* @__CompressedAssemblyDescriptor_data_46, i32 0, i32 0); data
	}, 
	; 47
	%struct.CompressedAssemblyDescriptor {
		i32 29184, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([29184 x i8], [29184 x i8]* @__CompressedAssemblyDescriptor_data_47, i32 0, i32 0); data
	}, 
	; 48
	%struct.CompressedAssemblyDescriptor {
		i32 37376, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([37376 x i8], [37376 x i8]* @__CompressedAssemblyDescriptor_data_48, i32 0, i32 0); data
	}, 
	; 49
	%struct.CompressedAssemblyDescriptor {
		i32 14848, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([14848 x i8], [14848 x i8]* @__CompressedAssemblyDescriptor_data_49, i32 0, i32 0); data
	}, 
	; 50
	%struct.CompressedAssemblyDescriptor {
		i32 16384, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([16384 x i8], [16384 x i8]* @__CompressedAssemblyDescriptor_data_50, i32 0, i32 0); data
	}, 
	; 51
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([10752 x i8], [10752 x i8]* @__CompressedAssemblyDescriptor_data_51, i32 0, i32 0); data
	}, 
	; 52
	%struct.CompressedAssemblyDescriptor {
		i32 24064, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([24064 x i8], [24064 x i8]* @__CompressedAssemblyDescriptor_data_52, i32 0, i32 0); data
	}, 
	; 53
	%struct.CompressedAssemblyDescriptor {
		i32 32768, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([32768 x i8], [32768 x i8]* @__CompressedAssemblyDescriptor_data_53, i32 0, i32 0); data
	}, 
	; 54
	%struct.CompressedAssemblyDescriptor {
		i32 8704, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([8704 x i8], [8704 x i8]* @__CompressedAssemblyDescriptor_data_54, i32 0, i32 0); data
	}, 
	; 55
	%struct.CompressedAssemblyDescriptor {
		i32 10240, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([10240 x i8], [10240 x i8]* @__CompressedAssemblyDescriptor_data_55, i32 0, i32 0); data
	}, 
	; 56
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([15872 x i8], [15872 x i8]* @__CompressedAssemblyDescriptor_data_56, i32 0, i32 0); data
	}, 
	; 57
	%struct.CompressedAssemblyDescriptor {
		i32 39936, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([39936 x i8], [39936 x i8]* @__CompressedAssemblyDescriptor_data_57, i32 0, i32 0); data
	}, 
	; 58
	%struct.CompressedAssemblyDescriptor {
		i32 35840, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([35840 x i8], [35840 x i8]* @__CompressedAssemblyDescriptor_data_58, i32 0, i32 0); data
	}, 
	; 59
	%struct.CompressedAssemblyDescriptor {
		i32 119296, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([119296 x i8], [119296 x i8]* @__CompressedAssemblyDescriptor_data_59, i32 0, i32 0); data
	}, 
	; 60
	%struct.CompressedAssemblyDescriptor {
		i32 321024, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([321024 x i8], [321024 x i8]* @__CompressedAssemblyDescriptor_data_60, i32 0, i32 0); data
	}, 
	; 61
	%struct.CompressedAssemblyDescriptor {
		i32 212480, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([212480 x i8], [212480 x i8]* @__CompressedAssemblyDescriptor_data_61, i32 0, i32 0); data
	}, 
	; 62
	%struct.CompressedAssemblyDescriptor {
		i32 77312, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([77312 x i8], [77312 x i8]* @__CompressedAssemblyDescriptor_data_62, i32 0, i32 0); data
	}, 
	; 63
	%struct.CompressedAssemblyDescriptor {
		i32 23576, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([23576 x i8], [23576 x i8]* @__CompressedAssemblyDescriptor_data_63, i32 0, i32 0); data
	}, 
	; 64
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([13824 x i8], [13824 x i8]* @__CompressedAssemblyDescriptor_data_64, i32 0, i32 0); data
	}, 
	; 65
	%struct.CompressedAssemblyDescriptor {
		i32 52224, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([52224 x i8], [52224 x i8]* @__CompressedAssemblyDescriptor_data_65, i32 0, i32 0); data
	}, 
	; 66
	%struct.CompressedAssemblyDescriptor {
		i32 18944, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([18944 x i8], [18944 x i8]* @__CompressedAssemblyDescriptor_data_66, i32 0, i32 0); data
	}, 
	; 67
	%struct.CompressedAssemblyDescriptor {
		i32 153016, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([153016 x i8], [153016 x i8]* @__CompressedAssemblyDescriptor_data_67, i32 0, i32 0); data
	}, 
	; 68
	%struct.CompressedAssemblyDescriptor {
		i32 15384, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([15384 x i8], [15384 x i8]* @__CompressedAssemblyDescriptor_data_68, i32 0, i32 0); data
	}, 
	; 69
	%struct.CompressedAssemblyDescriptor {
		i32 15392, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([15392 x i8], [15392 x i8]* @__CompressedAssemblyDescriptor_data_69, i32 0, i32 0); data
	}, 
	; 70
	%struct.CompressedAssemblyDescriptor {
		i32 2247600, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([2247600 x i8], [2247600 x i8]* @__CompressedAssemblyDescriptor_data_70, i32 0, i32 0); data
	}, 
	; 71
	%struct.CompressedAssemblyDescriptor {
		i32 27064, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([27064 x i8], [27064 x i8]* @__CompressedAssemblyDescriptor_data_71, i32 0, i32 0); data
	}, 
	; 72
	%struct.CompressedAssemblyDescriptor {
		i32 537528, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([537528 x i8], [537528 x i8]* @__CompressedAssemblyDescriptor_data_72, i32 0, i32 0); data
	}, 
	; 73
	%struct.CompressedAssemblyDescriptor {
		i32 14776, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([14776 x i8], [14776 x i8]* @__CompressedAssemblyDescriptor_data_73, i32 0, i32 0); data
	}, 
	; 74
	%struct.CompressedAssemblyDescriptor {
		i32 22048, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([22048 x i8], [22048 x i8]* @__CompressedAssemblyDescriptor_data_74, i32 0, i32 0); data
	}, 
	; 75
	%struct.CompressedAssemblyDescriptor {
		i32 2188288, ; uncompressed_file_size
		i8 0, ; loaded
		i8* getelementptr inbounds ([2188288 x i8], [2188288 x i8]* @__CompressedAssemblyDescriptor_data_75, i32 0, i32 0); data
	}
], align 4; end of 'compressed_assembly_descriptors' array


; compressed_assemblies
@compressed_assemblies = local_unnamed_addr global %struct.CompressedAssemblies {
	i32 76, ; count
	%struct.CompressedAssemblyDescriptor* getelementptr inbounds ([76 x %struct.CompressedAssemblyDescriptor], [76 x %struct.CompressedAssemblyDescriptor]* @compressed_assembly_descriptors, i32 0, i32 0); descriptors
}, align 4


!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
