//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 6 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    /// Storyboard `PostViewer`.
    static let postViewer = _R.storyboard.postViewer()
    /// Storyboard `Settings`.
    static let settings = _R.storyboard.settings()
    /// Storyboard `Stories`.
    static let stories = _R.storyboard.stories()
    /// Storyboard `Theme`.
    static let theme = _R.storyboard.theme()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "PostViewer", bundle: ...)`
    static func postViewer(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.postViewer)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Settings", bundle: ...)`
    static func settings(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.settings)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Stories", bundle: ...)`
    static func stories(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.stories)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Theme", bundle: ...)`
    static func theme(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.theme)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.file` struct is generated, and contains static references to 10 files.
  struct file {
    /// Resource file `Poppins-Bold.ttf`.
    static let poppinsBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-Bold", pathExtension: "ttf")
    /// Resource file `Poppins-ExtraBold.ttf`.
    static let poppinsExtraBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-ExtraBold", pathExtension: "ttf")
    /// Resource file `Poppins-ExtraLight.ttf`.
    static let poppinsExtraLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-ExtraLight", pathExtension: "ttf")
    /// Resource file `Poppins-Italic.ttf`.
    static let poppinsItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-Italic", pathExtension: "ttf")
    /// Resource file `Poppins-Light.ttf`.
    static let poppinsLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-Light", pathExtension: "ttf")
    /// Resource file `Poppins-Medium.ttf`.
    static let poppinsMediumTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-Medium", pathExtension: "ttf")
    /// Resource file `Poppins-Regular.ttf`.
    static let poppinsRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-Regular", pathExtension: "ttf")
    /// Resource file `Poppins-SemiBold.ttf`.
    static let poppinsSemiBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Poppins-SemiBold", pathExtension: "ttf")
    /// Resource file `fabric.apikey`.
    static let fabricApikey = Rswift.FileResource(bundle: R.hostingBundle, name: "fabric", pathExtension: "apikey")
    /// Resource file `fabric.buildsecret`.
    static let fabricBuildsecret = Rswift.FileResource(bundle: R.hostingBundle, name: "fabric", pathExtension: "buildsecret")

    /// `bundle.url(forResource: "Poppins-Bold", withExtension: "ttf")`
    static func poppinsBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-ExtraBold", withExtension: "ttf")`
    static func poppinsExtraBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsExtraBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-ExtraLight", withExtension: "ttf")`
    static func poppinsExtraLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsExtraLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-Italic", withExtension: "ttf")`
    static func poppinsItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-Light", withExtension: "ttf")`
    static func poppinsLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-Medium", withExtension: "ttf")`
    static func poppinsMediumTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsMediumTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-Regular", withExtension: "ttf")`
    static func poppinsRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Poppins-SemiBold", withExtension: "ttf")`
    static func poppinsSemiBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.poppinsSemiBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "fabric", withExtension: "apikey")`
    static func fabricApikey(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.fabricApikey
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "fabric", withExtension: "buildsecret")`
    static func fabricBuildsecret(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.fabricBuildsecret
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 8 fonts.
  struct font: Rswift.Validatable {
    /// Font `Poppins-Bold`.
    static let poppinsBold = Rswift.FontResource(fontName: "Poppins-Bold")
    /// Font `Poppins-ExtraBold`.
    static let poppinsExtraBold = Rswift.FontResource(fontName: "Poppins-ExtraBold")
    /// Font `Poppins-ExtraLight`.
    static let poppinsExtraLight = Rswift.FontResource(fontName: "Poppins-ExtraLight")
    /// Font `Poppins-Italic`.
    static let poppinsItalic = Rswift.FontResource(fontName: "Poppins-Italic")
    /// Font `Poppins-Light`.
    static let poppinsLight = Rswift.FontResource(fontName: "Poppins-Light")
    /// Font `Poppins-Medium`.
    static let poppinsMedium = Rswift.FontResource(fontName: "Poppins-Medium")
    /// Font `Poppins-Regular`.
    static let poppinsRegular = Rswift.FontResource(fontName: "Poppins-Regular")
    /// Font `Poppins-SemiBold`.
    static let poppinsSemiBold = Rswift.FontResource(fontName: "Poppins-SemiBold")

    /// `UIFont(name: "Poppins-Bold", size: ...)`
    static func poppinsBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsBold, size: size)
    }

    /// `UIFont(name: "Poppins-ExtraBold", size: ...)`
    static func poppinsExtraBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsExtraBold, size: size)
    }

    /// `UIFont(name: "Poppins-ExtraLight", size: ...)`
    static func poppinsExtraLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsExtraLight, size: size)
    }

    /// `UIFont(name: "Poppins-Italic", size: ...)`
    static func poppinsItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsItalic, size: size)
    }

    /// `UIFont(name: "Poppins-Light", size: ...)`
    static func poppinsLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsLight, size: size)
    }

    /// `UIFont(name: "Poppins-Medium", size: ...)`
    static func poppinsMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsMedium, size: size)
    }

    /// `UIFont(name: "Poppins-Regular", size: ...)`
    static func poppinsRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsRegular, size: size)
    }

    /// `UIFont(name: "Poppins-SemiBold", size: ...)`
    static func poppinsSemiBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: poppinsSemiBold, size: size)
    }

    static func validate() throws {
      if R.font.poppinsBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-Bold' could not be loaded, is 'Poppins-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsExtraBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-ExtraBold' could not be loaded, is 'Poppins-ExtraBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsExtraLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-ExtraLight' could not be loaded, is 'Poppins-ExtraLight.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-Italic' could not be loaded, is 'Poppins-Italic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-Light' could not be loaded, is 'Poppins-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-Medium' could not be loaded, is 'Poppins-Medium.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-Regular' could not be loaded, is 'Poppins-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.poppinsSemiBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Poppins-SemiBold' could not be loaded, is 'Poppins-SemiBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 13 images.
  struct image {
    /// Image `Ask`.
    static let ask = Rswift.ImageResource(bundle: R.hostingBundle, name: "Ask")
    /// Image `Comments`.
    static let comments = Rswift.ImageResource(bundle: R.hostingBundle, name: "Comments")
    /// Image `Earth`.
    static let earth = Rswift.ImageResource(bundle: R.hostingBundle, name: "Earth")
    /// Image `FilterIcon`.
    static let filterIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "FilterIcon")
    /// Image `Help`.
    static let help = Rswift.ImageResource(bundle: R.hostingBundle, name: "Help")
    /// Image `LanuchScreenIcon`.
    static let lanuchScreenIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "LanuchScreenIcon")
    /// Image `News`.
    static let news = Rswift.ImageResource(bundle: R.hostingBundle, name: "News")
    /// Image `PlaceholderIcon`.
    static let placeholderIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "PlaceholderIcon")
    /// Image `PointsIcon`.
    static let pointsIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "PointsIcon")
    /// Image `Rate`.
    static let rate = Rswift.ImageResource(bundle: R.hostingBundle, name: "Rate")
    /// Image `Settings`.
    static let settings = Rswift.ImageResource(bundle: R.hostingBundle, name: "Settings")
    /// Image `Show`.
    static let show = Rswift.ImageResource(bundle: R.hostingBundle, name: "Show")
    /// Image `ThemeIcon`.
    static let themeIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "ThemeIcon")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Ask", bundle: ..., traitCollection: ...)`
    static func ask(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.ask, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Comments", bundle: ..., traitCollection: ...)`
    static func comments(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.comments, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Earth", bundle: ..., traitCollection: ...)`
    static func earth(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.earth, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "FilterIcon", bundle: ..., traitCollection: ...)`
    static func filterIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.filterIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Help", bundle: ..., traitCollection: ...)`
    static func help(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.help, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "LanuchScreenIcon", bundle: ..., traitCollection: ...)`
    static func lanuchScreenIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.lanuchScreenIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "News", bundle: ..., traitCollection: ...)`
    static func news(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.news, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "PlaceholderIcon", bundle: ..., traitCollection: ...)`
    static func placeholderIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.placeholderIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "PointsIcon", bundle: ..., traitCollection: ...)`
    static func pointsIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pointsIcon, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Rate", bundle: ..., traitCollection: ...)`
    static func rate(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.rate, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Settings", bundle: ..., traitCollection: ...)`
    static func settings(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.settings, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Show", bundle: ..., traitCollection: ...)`
    static func show(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.show, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "ThemeIcon", bundle: ..., traitCollection: ...)`
    static func themeIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.themeIcon, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 4 nibs.
  struct nib {
    /// Nib `SettingsTableViewCell`.
    static let settingsTableViewCell = _R.nib._SettingsTableViewCell()
    /// Nib `SkeletonCell`.
    static let skeletonCell = _R.nib._SkeletonCell()
    /// Nib `StoryTableViewCell`.
    static let storyTableViewCell = _R.nib._StoryTableViewCell()
    /// Nib `ThemeSelectableTableViewCell`.
    static let themeSelectableTableViewCell = _R.nib._ThemeSelectableTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "SettingsTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.settingsTableViewCell) instead")
    static func settingsTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.settingsTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "SkeletonCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.skeletonCell) instead")
    static func skeletonCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.skeletonCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "StoryTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.storyTableViewCell) instead")
    static func storyTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.storyTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ThemeSelectableTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.themeSelectableTableViewCell) instead")
    static func themeSelectableTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.themeSelectableTableViewCell)
    }
    #endif

    static func settingsTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SettingsTableViewCell? {
      return R.nib.settingsTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SettingsTableViewCell
    }

    static func skeletonCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SkeletonCell? {
      return R.nib.skeletonCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SkeletonCell
    }

    static func storyTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> StoryTableViewCell? {
      return R.nib.storyTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? StoryTableViewCell
    }

    static func themeSelectableTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ThemeSelectableTableViewCell? {
      return R.nib.themeSelectableTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ThemeSelectableTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 4 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `SettingsTableViewCell`.
    static let settingsTableViewCell: Rswift.ReuseIdentifier<SettingsTableViewCell> = Rswift.ReuseIdentifier(identifier: "SettingsTableViewCell")
    /// Reuse identifier `SkeletonCell`.
    static let skeletonCell: Rswift.ReuseIdentifier<SkeletonCell> = Rswift.ReuseIdentifier(identifier: "SkeletonCell")
    /// Reuse identifier `StoryTableViewCell`.
    static let storyTableViewCell: Rswift.ReuseIdentifier<StoryTableViewCell> = Rswift.ReuseIdentifier(identifier: "StoryTableViewCell")
    /// Reuse identifier `ThemeSelectableTableViewCell`.
    static let themeSelectableTableViewCell: Rswift.ReuseIdentifier<ThemeSelectableTableViewCell> = Rswift.ReuseIdentifier(identifier: "ThemeSelectableTableViewCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 3 localization tables.
  struct string {
    /// This `R.string.launchScreen` struct is generated, and contains static references to 1 localization keys.
    struct launchScreen {
      /// ru translation: Hacker News
      ///
      /// Locales: ru
      static let zeoby6PText = Rswift.StringResource(key: "0ZE-OB-y6P.text", tableName: "LaunchScreen", bundle: R.hostingBundle, locales: ["ru"], comment: nil)

      /// ru translation: Hacker News
      ///
      /// Locales: ru
      static func zeoby6PText(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("0ZE-OB-y6P.text", tableName: "LaunchScreen", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "LaunchScreen", preferredLanguages: preferredLanguages) else {
          return "0ZE-OB-y6P.text"
        }

        return NSLocalizedString("0ZE-OB-y6P.text", tableName: "LaunchScreen", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.localizable` struct is generated, and contains static references to 5 localization keys.
    struct localizable {
      /// en translation: Help
      ///
      /// Locales: ru, en
      static let settingsHelpHeader = Rswift.StringResource(key: "settings.help.header", tableName: "Localizable", bundle: R.hostingBundle, locales: ["ru", "en"], comment: nil)
      /// en translation: Help
      ///
      /// Locales: ru, en
      static let settingsHelpTitle = Rswift.StringResource(key: "settings.help.title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["ru", "en"], comment: nil)
      /// en translation: Rate Us
      ///
      /// Locales: ru, en
      static let settingsHelpRate = Rswift.StringResource(key: "settings.help.rate", tableName: "Localizable", bundle: R.hostingBundle, locales: ["ru", "en"], comment: nil)
      /// en translation: Themes
      ///
      /// Locales: ru, en
      static let settingsThemesHeader = Rswift.StringResource(key: "settings.themes.header", tableName: "Localizable", bundle: R.hostingBundle, locales: ["ru", "en"], comment: nil)
      /// en translation: Themes
      ///
      /// Locales: ru, en
      static let settingsThemesTitle = Rswift.StringResource(key: "settings.themes.title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["ru", "en"], comment: nil)

      /// en translation: Help
      ///
      /// Locales: ru, en
      static func settingsHelpHeader(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("settings.help.header", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "settings.help.header"
        }

        return NSLocalizedString("settings.help.header", bundle: bundle, comment: "")
      }

      /// en translation: Help
      ///
      /// Locales: ru, en
      static func settingsHelpTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("settings.help.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "settings.help.title"
        }

        return NSLocalizedString("settings.help.title", bundle: bundle, comment: "")
      }

      /// en translation: Rate Us
      ///
      /// Locales: ru, en
      static func settingsHelpRate(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("settings.help.rate", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "settings.help.rate"
        }

        return NSLocalizedString("settings.help.rate", bundle: bundle, comment: "")
      }

      /// en translation: Themes
      ///
      /// Locales: ru, en
      static func settingsThemesHeader(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("settings.themes.header", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "settings.themes.header"
        }

        return NSLocalizedString("settings.themes.header", bundle: bundle, comment: "")
      }

      /// en translation: Themes
      ///
      /// Locales: ru, en
      static func settingsThemesTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("settings.themes.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "settings.themes.title"
        }

        return NSLocalizedString("settings.themes.title", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.main` struct is generated, and contains static references to 2 localization keys.
    struct main {
      /// ru translation: Hacker News
      ///
      /// Locales: ru
      static let kZ9ZSgTitle = Rswift.StringResource(key: "76k-z9-zSg.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ru"], comment: nil)
      /// ru translation: Item
      ///
      /// Locales: ru
      static let nZA5TQvETitle = Rswift.StringResource(key: "nZA-5T-qvE.title", tableName: "Main", bundle: R.hostingBundle, locales: ["ru"], comment: nil)

      /// ru translation: Hacker News
      ///
      /// Locales: ru
      static func kZ9ZSgTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("76k-z9-zSg.title", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "76k-z9-zSg.title"
        }

        return NSLocalizedString("76k-z9-zSg.title", tableName: "Main", bundle: bundle, comment: "")
      }

      /// ru translation: Item
      ///
      /// Locales: ru
      static func nZA5TQvETitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("nZA-5T-qvE.title", tableName: "Main", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Main", preferredLanguages: preferredLanguages) else {
          return "nZA-5T-qvE.title"
        }

        return NSLocalizedString("nZA-5T-qvE.title", tableName: "Main", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _SettingsTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = SettingsTableViewCell

      let bundle = R.hostingBundle
      let identifier = "SettingsTableViewCell"
      let name = "SettingsTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SettingsTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SettingsTableViewCell
      }

      fileprivate init() {}
    }

    struct _SkeletonCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = SkeletonCell

      let bundle = R.hostingBundle
      let identifier = "SkeletonCell"
      let name = "SkeletonCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> SkeletonCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? SkeletonCell
      }

      fileprivate init() {}
    }

    struct _StoryTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = StoryTableViewCell

      let bundle = R.hostingBundle
      let identifier = "StoryTableViewCell"
      let name = "StoryTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> StoryTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? StoryTableViewCell
      }

      fileprivate init() {}
    }

    struct _ThemeSelectableTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ThemeSelectableTableViewCell

      let bundle = R.hostingBundle
      let identifier = "ThemeSelectableTableViewCell"
      let name = "ThemeSelectableTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ThemeSelectableTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ThemeSelectableTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try postViewer.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try settings.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try stories.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try theme.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if UIKit.UIImage(named: "LanuchScreenIcon", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'LanuchScreenIcon' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct postViewer: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "PostViewer"
      let postViewerViewController = StoryboardViewControllerResource<PostViewerViewController>(identifier: "PostViewerViewController")

      func postViewerViewController(_: Void = ()) -> PostViewerViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: postViewerViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.postViewer().postViewerViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'postViewerViewController' could not be loaded from storyboard 'PostViewer' as 'PostViewerViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct settings: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "Settings"
      let settingsViewController = StoryboardViewControllerResource<SettingsViewController>(identifier: "SettingsViewController")

      func settingsViewController(_: Void = ()) -> SettingsViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: settingsViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.settings().settingsViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'settingsViewController' could not be loaded from storyboard 'Settings' as 'SettingsViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct stories: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "Stories"
      let storiesViewController = StoryboardViewControllerResource<StoriesViewController>(identifier: "StoriesViewController")

      func storiesViewController(_: Void = ()) -> StoriesViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: storiesViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.stories().storiesViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'storiesViewController' could not be loaded from storyboard 'Stories' as 'StoriesViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct theme: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "Theme"
      let themeViewController = StoryboardViewControllerResource<ThemeViewController>(identifier: "ThemeViewController")

      func themeViewController(_: Void = ()) -> ThemeViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: themeViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.theme().themeViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'themeViewController' could not be loaded from storyboard 'Theme' as 'ThemeViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
