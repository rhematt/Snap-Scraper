# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Snap-Scraper' do
  # Comment the next line if you don't want to use dynamic frameworks
  #use_frameworks!

  # Pods for Snap-Scraper
pod “Alamofire”

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
