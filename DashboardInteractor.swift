class DashboardInteractor {
    weak var presenter: DashboardPresenter?

    func fetchCarServiceRecords() {
        // Fetch service records from the server
        let serviceRecords = ...
        presenter?.didFetchCarServiceRecords(serviceRecords)
    }
}
