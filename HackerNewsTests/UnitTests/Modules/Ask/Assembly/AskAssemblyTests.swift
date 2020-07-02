//
//  AskAssemblyTests.swift
//  HackerNews
//
//  Created by Nikita Vasilev on 02/05/2020.
//  Copyright © 2020 Nikita Vasilev. All rights reserved.
//

import Quick
import Nimble
import Swinject
import HNService

@testable import HackerNews

final class AskModuleAssemblyTests: QuickSpec {
    override func spec() {
        let container = MockContainer().container
        
        let viewController = container.resolve(PostsViewController.self)
        let presenter = viewController?.output as? AskPresenter
        let router = presenter?.router as? AskRouter
        let interactor = presenter?.interactor as? AskInteractor

        describe("Checking module creation") {
            it("Must be AskViewController") {
                expect(viewController).toNot(beNil())
                expect(viewController).to(beAKindOf(PostsViewController.self))
            }
            
            it("Must contains correct output") {
                expect(viewController?.output).toNot(beNil())
                expect(viewController?.output).to(beIdenticalTo(presenter))
            }
            
            it("Must contains view, interactor and router") {
                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beIdenticalTo(viewController))
                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beIdenticalTo(router))
                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beIdenticalTo(interactor))
                expect(presenter?.themeManager).toNot(beNil())
                expect(presenter?.themeManager).to(beAKindOf(ThemeManager.self))
            }

            it("Must contains output") {
                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beIdenticalTo(presenter))
            }
            
            it("Must contains network service") {
                expect(interactor?.networkService).toNot(beNil())
                expect(interactor?.networkService).to(beAKindOf(HNServiceProtocol.self))
            }

            it("Must contains correct transitionHandler") {
                expect(router?.transitionHandler).toNot(beNil())
                expect(router?.transitionHandler).to(beIdenticalTo(viewController))
            }
        }
    }
}
