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
add_target("cross_app_extensions")

    -- set kind
    set_kind("static")


    local crossapp_dir = "./"

    --add_headers("../(extensions/**.h)")
    add_includedirs("include/")
    -- add files
    if os("android") then
      add_cxflags("-DANDROID")
      add_cxflags("-Wno-psabi")
      add_cxflags("-std=c++11")

      -- CrossApp

      add_includedirs(crossapp_dir .. "../CrossApp")
      add_includedirs(crossapp_dir .. "../CrossApp/kazmath/include")
      add_includedirs(crossapp_dir .. "../CrossApp/platform/android")
      add_includedirs(crossapp_dir .. "../CrossApp/the_third_party/freetype/include")
      add_includedirs(crossapp_dir .. "../CrossApp/the_third_party/curl/include/android/")

      -- STL support
      add_includedirs(crossapp_dir .. "../static_libs/lib_cxx/include/")
      add_includedirs(crossapp_dir .. "../static_libs/lib_support/include/")

      add_includedirs(".")
      add_files("gameswf/**.cpp")

      --
      -- armv5te
      --
      if archs("armv5te") then
        print("====================================")
        print("====== build android armv5te")
        print("====================================")
        add_includedirs("../static_libs/lib_stl/libs/armeabi/include/")
      end

      --
      -- armv7-a
      --
      if archs("armv7-a") then
        print("====================================")
        print("====== build android armv7-a")
        print("====================================")
        add_includedirs("../static_libs/lib_stl/libs/armeabi-v7a/include/")
      end

    end

    -- add ios
    if os("ios") then
      add_cxflags("-DCC_TARGET_OS_IPHONE")

      -- CrossApp

      add_includedirs(crossapp_dir .. "../CrossApp")
      add_includedirs(crossapp_dir .. "../CrossApp/kazmath/include")
      add_includedirs(crossapp_dir .. "../CrossApp/platform/ios")
      add_includedirs(crossapp_dir .. "../CrossApp/the_third_party/freetype/include")
      add_includedirs(crossapp_dir .. "../CrossApp/the_third_party/curl/include/ios/")

      add_includedirs(".")
      add_files("gameswf/**.cpp")
    end
