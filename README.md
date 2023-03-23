# Mars-iOS

[![CI Status](https://img.shields.io/travis/DouDou/Mars-iOS.svg?style=flat)](https://travis-ci.org/DouDou/Mars-iOS)
[![Version](https://img.shields.io/cocoapods/v/Mars-iOS.svg?style=flat)](https://cocoapods.org/pods/Mars-iOS)
[![License](https://img.shields.io/cocoapods/l/Mars-iOS.svg?style=flat)](https://cocoapods.org/pods/Mars-iOS)
[![Platform](https://img.shields.io/cocoapods/p/Mars-iOS.svg?style=flat)](https://cocoapods.org/pods/Mars-iOS)

## Example

* [Mars源码](https://github.com/Tencent/mars)

#### Xlog

* Due to the different needs of each person, the decoding of the *.xlog file needs to find the information by itself

* Provide the official unencrypted decoding method here

```ruby
python Mars/Classes/Xlog/decode_mars_nocrypt_log_file.py *.xlog
```

## Requirements

You need to use the [wget](https://www.gnu.org/software/wget/?spm=a2c6h.12873639.article-detail.137.33c229e1tbzpdu) command line tool to do the download

#### Install using brew

```ruby
brew install wget
```

## Installation

Mars-iOS is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

### Objective-C

```ruby
pod 'Mars-iOS' # 完整版

pod 'Mars-iOS/Xlog' # Xlog
```

### Swift

```ruby
pod 'Mars-iOS/Swift' # 完整版

pod 'Mars-iOS/Xlog.Swift' # Xlog
```

## Author

DouDou, bg1859710@gmail.com

## License

Mars-iOS is available under the MIT license. See the LICENSE file for more info.
