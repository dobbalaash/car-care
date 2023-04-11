// Coordinator.swift
class Coordinator {
    private let navigationController: UINavigationController
    private let carService: CarService

    init(navigationController: UINavigationController, carService: CarService) {
        self.navigationController = navigationController
        self.carService = carService
    }

    func start() {
        let dashboardViewController = DashboardViewController()
        let dashboardPresenter = DashboardPresenter(carService: carService, view: dashboardViewController)
        dashboardViewController.presenter = dashboardPresenter
        navigationController.pushViewController(dashboardViewController, animated: true)
    }

    func showServiceHistory() {
        let serviceHistoryViewController = ServiceHistoryViewController()
        let serviceHistoryPresenter = ServiceHistoryPresenter(carService: carService, view: serviceHistoryViewController)
        serviceHistoryViewController.presenter = serviceHistoryPresenter
        navigationController.pushViewController(serviceHistoryViewController, animated: true)
    }
}
