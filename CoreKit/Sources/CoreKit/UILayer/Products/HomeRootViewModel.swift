import Foundation
import Combine
import UIKit
import enum NetworkLayer.APIError

@MainActor
public final class HomeRootViewModel: GetProductsUsecase {
    
    // MARK: - Properties
    
    nonisolated internal let repository: ProductRepository
    private let navigator: GoToProductDetails
    private let productsSubject = CurrentValueSubject<ProductList, Never>([])
    private let errorMessagesSubject = PassthroughSubject<APIError, Never>()
    public let errorPresentation = CurrentValueSubject<ErrorPresentation?, Never>(nil)
    private let isLoadingSubject = CurrentValueSubject<Bool, Never>(false)
    public let selectItemSubject = PassthroughSubject<IndexPath, Never>()

    
    public var productsPublisher: AnyPublisher<ProductList, Never> {
        productsSubject.eraseToAnyPublisher()
    }
    public var isLoading: AnyPublisher<Bool, Never> {
        isLoadingSubject.eraseToAnyPublisher()
    }
    public var errorMessagesPublisher: AnyPublisher<APIError, Never> {
        errorMessagesSubject.eraseToAnyPublisher()
    }
    public var selectedItemSubscriber: AnySubscriber<IndexPath, Never> {
        AnySubscriber(selectItemSubject)
    }

    private var cancelables: Set<AnyCancellable> = []
    
    // MARK: - Methods
    
    public init(repository: ProductRepository, navigator: GoToProductDetails) {
        self.repository = repository
        self.navigator = navigator
        self.subscribeToSelectItem()
    }
    
    public func getData() {
        Task { [weak self] in
            guard let self else { return }
            do {
                let products = try await self.getProducts()
                self.productsSubject.send(products)
            } catch let errorMessage as APIError {
                errorMessagesSubject.send(errorMessage)
            }
        }
    }
    
    private func subscribeToSelectItem() {
        selectItemSubject
            .sink { [weak self] indexPath in
                guard let self  else { return }
                let selectedProduct = self.productsSubject.value[indexPath.row]
                self.navigator.navigateToProductDetails(with: selectedProduct)
            }
            .store(in: &cancelables)
    }


}
