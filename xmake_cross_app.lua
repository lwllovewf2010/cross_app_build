-- the debug mode
if modes("debug") then

    -- enable the debug symbols
    set_symbols("debug")

    -- disable optimization
    set_optimize("none")
end

-- the release mode
if modes("release") then

    -- set the symbols visibility: hidden
    set_symbols("hidden")

    -- enable fastest optimization
    set_optimize("fastest")

    -- strip all symbols
    set_strip("all")
end

-- add target
add_target("cross_app")

    -- set kind
    set_kind("static")

    -- add files
    add_files("CrossApp.cpp")

    -- ===================================
    -- local
    local crossapp_dir = "./"
    add_files(crossapp_dir .. "platform/*.cpp")
    add_files(crossapp_dir .. "script_support")

    -- add_headers(crossapp_dir .. "CrossApp/**.h")

    -- all head
    add_includedirs(crossapp_dir)
    add_includedirs(crossapp_dir .. "platform/")
    add_includedirs(crossapp_dir .. "kazmath/include/")

    -- add head

    -- view
    add_files("./view/*.cpp")
    add_files("./script_support/*.cpp")
    -- add_files("./video/*.cpp")

    -- add support
    add_files(crossapp_dir .. "support/*.cpp")
    add_files(crossapp_dir .. "support/*.c")
    add_files(crossapp_dir .. "support/data_support/*.cpp")

    -- add devevice
    add_files(crossapp_dir .. "support/device/CADevice.cpp")

    add_files(crossapp_dir .. "support/image_support/*.cpp")

    -- JSON
    add_files(crossapp_dir .. "support/Json/CSContentJsonDictionary.cpp")
    add_files(crossapp_dir .. "support/Json/lib_json/*.cpp")

    add_files(crossapp_dir .. "support/LocalStorage/LocalStorage.cpp")
    add_files(crossapp_dir .. "support/network/*.cpp")
    add_files(crossapp_dir .. "support/sqlite3/*.c")
    add_files(crossapp_dir .. "support/tinyxml2/*.cpp")
    add_files(crossapp_dir .. "support/user_default/*.cpp")

    --
    -- =====================================
    -- == android
    -- =====================================
    if os("android") then
      -- set_headerdir("inc")
      -- add_headers("./**.h")
      -- config
      add_cxflags("-DANDROID -Wno-psabi -DUSE_FILE32API -D__STDC_CONSTANT_MACROS -fexceptions -fpermissive -Wno-psabi -DUSE_FILE32API -D__STDC_CONSTANT_MACROS")
      add_cxflags("-std=c++11")
      add_cxflags("-lGLESv2")
      add_cxflags("-lz")

      -- =========
      -- include
      -- =========

      -- platform
      add_includedirs(crossapp_dir .. "platform/android/")

      -- CrossApp third_party
      add_includedirs(crossapp_dir .. "the_third_party/curl/include/android")
      add_includedirs(crossapp_dir .. "the_third_party/freetype/include/")
      add_includedirs(crossapp_dir .. "the_third_party/websockets/android/include/")
      add_includedirs(crossapp_dir .. "the_third_party/png/include/android/")
      add_includedirs(crossapp_dir .. "the_third_party/jpeg/include/android/")
      add_includedirs(crossapp_dir .. "the_third_party/ffmpeg/include/")
      add_includedirs(crossapp_dir .. "the_third_party/SDL/include/")
      add_includedirs(crossapp_dir .. "the_third_party/tiff/include/android")
      add_includedirs(crossapp_dir .. "the_third_party/webp/include/android")

      -- STL support
      add_includedirs(crossapp_dir .. "../static_libs/lib_cxx/include/")
      add_includedirs(crossapp_dir .. "../static_libs/lib_support/include/")

      -- platform cpp
      add_files(crossapp_dir .. "platform/android/*.cpp")
      add_files(crossapp_dir .. "platform/android/jni/*.cpp")
      add_files(crossapp_dir .. "support/device/Device_android/*.cpp")
      add_files(crossapp_dir .. "support/zip_support/*.cpp")

      -- armv5te
      if archs("armv5te") then
        print("====================================")
        print("====== build android armv5te")
        print("====================================")
        add_includedirs("../static_libs/lib_stl/libs/armeabi/include/")
      end

      -- armv7-a
      if archs("armv7-a") then
        print("====================================")
        print("====== build android armv7-a")
        print("====================================")
        add_includedirs("../static_libs/lib_stl/libs/armeabi-v7a/include/")
      end

    -- =====================================
    -- == IOS
    -- =====================================
    elseif os("ios") then
        add_cxflags("-DCC_TARGET_OS_IPHONE")
        add_includedirs(crossapp_dir .. "platform/ios/")
        add_includedirs(crossapp_dir .. "the_third_party/curl/include/ios")
        add_includedirs(crossapp_dir .. "the_third_party/freetype/include/")
        add_includedirs(crossapp_dir .. "the_third_party/websockets/ios/include/")
        add_includedirs(crossapp_dir .. "the_third_party/png/include/ios/")
        add_includedirs(crossapp_dir .. "the_third_party/jpeg/include/ios/")
        add_includedirs(crossapp_dir .. "the_third_party/ffmpeg/include/")
        add_includedirs(crossapp_dir .. "the_third_party/SDL/include/")
        add_includedirs(crossapp_dir .. "the_third_party/tiff/include/ios")
        add_includedirs(crossapp_dir .. "the_third_party/webp/include/ios")
        add_files(crossapp_dir .. "platform/ios/*.cpp")
        --add_files(crossapp_dir .. "support/device/Device_ios/*.mm")
        --add_files(crossapp_dir .. "support/device/Device_ios/*.m")
    -- =====================================
    -- == MACXOS
    -- =====================================
    elseif os("macosx") then
            add_cxflags("-DCC_TARGET_OS_MAC")
            add_includedirs("../static/platform/mac/")
            add_includedirs("../static/the_third_party/curl/include/mac")
            add_includedirs("../static/the_third_party/freetype/include/")
            add_includedirs("../static/the_third_party/websockets/ios/include/")
            add_includedirs("../static/the_third_party/png/include/mac/")
            add_includedirs("../static/the_third_party/jpeg/include/mac/")
            add_includedirs("../static/the_third_party/ffmpeg/include/")
            add_includedirs("../static/the_third_party/SDL/include/")
            add_includedirs("../static/the_third_party/tiff/include/mac")
            add_includedirs("../static/the_third_party/webp/include/mac")
            add_files("./platform/mac/*.cpp")
    end

    -- add animation
    add_files("./animation/*.cpp")

    -- add basics
    add_files("./basics/*.cpp")
    add_files("./basics/*.c")

    -- cocoa
    add_files("./cocoa/*.cpp")

    --control
    add_files("./control/*.cpp")

    -- controller
    add_files("./controller/*.cpp")

    -- dispatcher
    add_files("./dispatcher/*.cpp")

    -- images
    add_files("./images/*.cpp")
    add_files("./images/gif_lib/*.c")

    -- kazmath
    add_files("./kazmath/src/**.c")

    -- shaders
    add_files("./shaders/*.cpp")
