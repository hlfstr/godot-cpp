# godot-cpp
C++ bindings for the Godot script API

# Creating a GDNative library (Linux)

Use git to downlaod the latest `godot-cpp` and `godot_headers`.
```
$ git clone --recurse-submodules https://github.com/markedhero/godot-cpp
```
Right now our directory structure should look like this:
```
godot-cpp/
├── godot_headers/
├── include/
├── jni/
└── src/
```

It is highly recommended that you use Clang as the compiler, especially when developing for Android.  Clang will be assumed for the rest of these instructions.

Now to generate the cpp bindings, enter the godot-cpp directory.
```
$ cd godot-cpp
```
Generate the godot_api.json file for use in generating the bindings
```
$ /path/to/godot_binary --gdnative-generate-json-api godot_api.json
```
Complete the build of the godot-cpp bindings
```
$ scons generate_bindings=yes platform=linux use_llvm=yes -j 6
```
resulting libraries will be placed under `bin/` and the generated headers will be placed under `include/*`

Alternatively, you can specify the Godot Engine path during the build
```
$ scons godotbinpath="/path/to/godot_binary" generate_bindings=yes platform=linux use_llvm=yes
```

**Note:**
> `generate_bindings=yes` is used to force regenerating C++ bindings (`godot_api.json` - Godot API)

> You may need to specify `headers=/path/to/godot_headers` if you have downloaded the godot_headers to a different directory

Now our directory structure will be
```
godot-cpp/
├── godot_headers/
├── include/
├── jni/
├── src/
└── bin/libgodot-cpp.linux.64.a
```

# Creating a GDNative library (Android)

It is assumed that you have the latest Android NDK installed and available in your path.
You should also be familiar with building and using the Android NDK on your system.
You must first follow the build instructions for Linux above

Included in this fork is the "jni/" directory, which contains an Android.mk file to build for Android.
You must first be in the godot-cpp folder as before.

Initiate the Build using the ndk-build tool
```
$ ndk-build -j 6
```

As the project is being compiled, output will be placed in the "obj/" folder.  The final build will be placed in "lib/"
The current directory structure should be
```
godot-cpp/
├── godot_headers/
├── include/
├── jni/
├── libs/
│   ├── arm64-v8a/
│   │   ├── libandroid_gdnative.so
│   │   └── libc++_shared.so
│   ├── armeabi-v7a/
│   │   ├── libandroid_gdnative.so
│   │   └── libc++_shared.so
│   ├── x86/
│   │   ├── libandroid_gdnative.so
│   │   └── libc++_shared.so
│   └── x86_64/
│       ├── libandroid_gdnative.so
│       └── libc++_shared.so
├── obj/
├── src/
└── bin/libgodot-cpp.linux.64.a
```

The library has been compiled as a Shared Library to include on the Android Platform.  Both the 'libandroi_gdnative.so' and 'libc++_shared.so' are required for your projects.

# Conclusion
The compilation has completed.  From here you can begin developing GDNative for the Linux Platform as well as the Android Platform.

### See Also

[Using GDNative](http://docs.godotengine.org/en/latest/tutorials/plugins/gdnative/gdnative-cpp-example.html#using-your-gdnative-module)

[Examples](https://github.com/markedhero/GDNative-demos)
