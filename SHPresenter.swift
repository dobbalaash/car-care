// ServiceHistoryPresenter.swift
class ServiceHistoryPresenter {
    private weak var view: ServiceHistoryViewController?
    private let service: CarService

    init(view: ServiceHistoryViewController, service: CarService) {
        self.view = view
        self.service = service
    }

    func viewDidLoad() {
        service.fetchServiceHistory { [weak self] result in
            switch result {
            case .success(let serviceHistory):
                self?.view?.updateView(with: serviceHistory)
            case .failure(let error):
                self?.view?.showError(error)
            }
        }
    }
}
