Pod::Spec.new do |s|

    s.name             = "Zee5Crashlytics"
    s.version          = '0.1.0'
    s.summary          = "An Example of full screen plugin for Zapp iOS."
    s.description      = <<-DESC
    An Example of full screen plugin for Zapp iOS.
                         DESC
    s.homepage         = "git@github.com:applicaster-plugins/FirebaseCrashlyticsPlugin.git"
    s.license          = 'MIT'
    s.author           = { "admin" => "rukshi.chauhan@zee.esselgroup.com" }
    s.source           = { :git => "git@github.com:applicaster-plugins/FirebaseCrashlyticsPlugin.git", :tag => s.version.to_s }
  
    s.ios.deployment_target  = "10.0"
    s.platform     = :ios, '10.0'
    s.requires_arc = true
    s.swift_version = '5.1'
    # s.prepare_command = <<-CMD
    #                       sh cocoapods_prepare_commands_paths.sh
    #                     CMD
    s.script_phase = { 
     :name => 'Firebase Crashlytics',
    #  :show_env_vars_in_log => true, 
     :script => "${PODS_ROOT}/Fabric/run"
     :execution_position => :after_compile 
    }
   
    s.subspec 'Core' do |c|
      c.source_files = 'PluginClasses/**/*.{h,m,swift}'
      c.dependency 'ZappPlugins'
      c.dependency 'Fabric'
      c.dependency 'Crashlytics'

    end
                  
    s.xcconfig =  { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
                    'ENABLE_BITCODE' => 'YES',
                    'SWIFT_VERSION' => '5.1',
                    'OTHER_LDFLAGS' => '-framework "Crashlytics" -framework "Fabric"' 
                  }
                  
    s.default_subspec = 'Core'
                  
  end
  