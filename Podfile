source 'https://github.com/CocoaPods/Specs.git'
 
platform :ios, '8.0'
inhibit_all_warnings!
use_frameworks!
 
xcodeproj 'AppCodeFrame'
target 'AppCodeFrame', :exclusive => true do
  pod 'Alamofire', '~> 1.2'
  pod 'JSONHelper'
end


 
post_install do |installer|
  installer.project.targets.each do |target|
    puts "#{target.name}"
  end
end