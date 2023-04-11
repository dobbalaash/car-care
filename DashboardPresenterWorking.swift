// DashboardPresenter.swift
class DashboardPresenter {
    private let carService: CarService
    private weak var view: DashboardViewController?
    private var coordinator: Coordinator

    init(carService: CarService, view: DashboardViewController, coordinator: Coordinator) {
        self.carService = carService
        self.view = view
        self.coordinator = coordinator
    }

    func viewDidLoad() {
        // Fetch data from the car service and update the view
    }

    func serviceHistoryButtonTapped() {
        coordinator.showServiceHistory()
    }
}
