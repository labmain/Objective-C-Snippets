source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
inhibit_all_warnings!
def share_pods
    pod 'Masonry'
end

target 'toeflWord' do
    pod 'AFNetworking'
    pod 'Masonry'
end

target 'widget' do
    share_pods
end
