class CarCoordinator: CarCoordinatorInput {
    var navigationController: UINavigationController

    // ...
    func showServiceHistory() {
        let serviceHistoryVC = ServiceHistoryViewController()
        navigationController.pushViewController(serviceHistoryVC, animated: true)
    }
    // ...
}
