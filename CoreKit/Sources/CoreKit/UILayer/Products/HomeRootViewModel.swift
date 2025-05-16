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
    private let isLoadingSubject = CurrentValueSubject<Bool, Never>(false)
    public let selectItemSubject = PassthroughSubject<IndexPath, Never>()
    public let selectSegmentSubject = PassthroughSubject<Int, Never>()

    
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
    public var selectedSegment: AnySubscriber<Int, Never> {
        AnySubscriber(selectSegmentSubject)
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
            } catch {
                print(error)
            }
        }
    }
    
    private func subscribeToSelectItem() {
    }


}
