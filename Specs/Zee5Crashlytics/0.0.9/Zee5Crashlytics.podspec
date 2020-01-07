Pod::Spec.new do |s|

    s.name             = "Zee5Crashlytics"
    s.version          = '0.0.9'
    s.summary          = "An Example of full screen plugin for Zapp iOS."
    s.description      = <<-DESC
    An Example of full screen plugin for Zapp iOS.
                         DESC
    s.homepage         = "https://rukshi_chauhan:NyNTGU65adnbwqJcQjHb@bitbucket.org/zee5in/zee5crashlyticsplugin-ios.git"
    s.license          = 'MIT'
    s.author           = { "admin" => "rukshi.chauhan@zee.esselgroup.com" }
    s.source           = { :git => "https://rukshi_chauhan:NyNTGU65adnbwqJcQjHb@bitbucket.org/zee5in/zee5crashlyticsplugin-ios.git", :tag => s.version.to_s }
  
    s.ios.deployment_target  = "10.0"
    s.platform     = :ios, '10.0'
    s.requires_arc = true
    s.swift_version = '5.1'
    s.prepare_command = <<-CMD
                          sh cocoapods_prepare_commands_paths.sh
                        CMD
    
   
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
  