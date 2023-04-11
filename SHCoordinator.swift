// ServiceHistoryCoordinator.swift
class ServiceHistoryCoordinator {
    private let navigationController: UINavigationController
    private let service: CarService

    init(navigationController: UINavigationController, service: CarService) {
        self.navigationController = navigationController
        self.service = service
    }

    func start() {
        let serviceHistoryViewController = ServiceHistoryViewController()
        let serviceHistoryPresenter = ServiceHistoryPresenter(view: serviceHistoryViewController,
                                                             service: service)
        serviceHistoryViewController.presenter = serviceHistoryPresenter
        navigationController.pushViewController(serviceHistoryViewController, animated: true)
    }
}
