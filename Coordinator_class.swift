class CarCareCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let dashboardVC = DashboardViewController()
        let dashboardPresenter = DashboardPresenter(view: dashboardVC)
        dashboardVC.presenter = dashboardPresenter
        navigationController.pushViewController(dashboardVC, animated: true)
    }

    func showServiceHistory() {
        let serviceHistoryVC = ServiceHistoryViewController()
        let serviceHistoryPresenter = ServiceHistoryPresenter(view: serviceHistoryVC)
        serviceHistoryVC.presenter = serviceHistoryPresenter
        navigationController.pushViewController(serviceHistoryVC, animated: true)
    }
}
