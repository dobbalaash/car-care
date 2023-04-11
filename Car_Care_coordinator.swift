class CarCareCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = DashboardViewController.instantiate()
        let interactor = DashboardInteractor()
        let presenter = DashboardPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        navigationController.pushViewController(viewController, animated: true)
    }
}
