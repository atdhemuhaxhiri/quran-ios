//
//  Container.swift
//  Quran
//
//  Created by Mohamed Afifi on 4/20/16.
//  Copyright © 2016 Quran.com. All rights reserved.
//

import UIKit

class Container {

    private let imagesCache: Cache = {
        let cache = NSCache()
        cache.countLimit = 10
        return cache
    }()

    func createRootViewController() -> UIViewController {
        let controller = MainTabBarController()
        controller.viewControllers = [createSurasNavigationController(),
                                      createJuzsNavigationController(),
                                      createSettingsController()]
        return controller
    }

    func createSurasNavigationController() -> UIViewController {
        return SurasNavigationController(rootViewController: createSurasViewController())
    }

    func createJuzsNavigationController() -> UIViewController {
        return JuzsNavigationController(rootViewController: createJuzsViewController())
    }

    func createSurasViewController() -> UIViewController {
        return SurasViewController(dataRetriever: createSurasRetriever(), quranControllerCreator: createBlockCreator(createQuranController))
    }

    func createJuzsViewController() -> UIViewController {
        return JuzsViewController(dataRetriever: createQuartersRetriever(), quranControllerCreator: createBlockCreator(createQuranController))
    }

    func createSearchController() -> UIViewController {
        return SearchNavigationController(rootViewController: SearchViewController())
    }

    func createSettingsController() -> UIViewController {
        return SettingsNavigationController(rootViewController: SettingsViewController())
    }

    func createSurasRetriever() -> AnyDataRetriever<[(Juz, [Sura])]> {
        return SurasDataRetriever().erasedType()
    }

    func createQuartersRetriever() -> AnyDataRetriever<[(Juz, [Quarter])]> {
        return QuartersDataRetriever().erasedType()
    }

    func createQuranPagesRetriever() -> AnyDataRetriever<[QuranPage]> {
        return QuranPagesDataRetriever().erasedType()
    }

    func createQarisDataRetriever() -> AnyDataRetriever<[Qari]> {
        return QariDataRetriever().erasedType()
    }

    func createQuranController() -> QuranViewController {
        return QuranViewController(
            imageService: createQuranImageService(),
            dataRetriever: createQuranPagesRetriever(),
            audioViewPresenter: createAudioBannerViewPresenter()
        )
    }

    func createBlockCreator<CreatedObject>(creationClosure: () -> CreatedObject) -> AnyCreator<CreatedObject> {
        return BlockCreator(creationClosure: creationClosure).erasedType()
    }

    func createQuranImageService() -> QuranImageService {
        return DefaultQuranImageService(imagesCache: createImagesCache())
    }

    func createImagesCache() -> Cache {
        return imagesCache
    }

    func createAudioBannerViewPresenter() -> AudioBannerViewPresenter {
        return DefaultAudioBannerViewPresenter(qariRetreiver: createQarisDataRetriever())
    }
}
