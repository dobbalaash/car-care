class DashboardPresenter {
    weak var view: DashboardViewController?
    var interactor: DashboardInteractor

    init(view: DashboardViewController?, interactor: DashboardInteractor)
}
