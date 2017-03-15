//
//  LogDetailsViewController.swift
//  Pods
//
//  Created by Filip Bec on 14/03/2017.
//
//

import UIKit

internal class LogDetailsViewController: UIViewController {

    private enum Kind: Int {
        case overview = 0
        case request = 1
        case response = 2
    }

    internal var log: Log!

    private var kind: Kind = .overview {
        didSet {
            switch kind {
            case .overview:
                sections = log.overviewDataSource
            case .request:
                sections = log.requestDataSource
            case .response:
                sections = log.responseDataSource
            }
            tableView.reloadData()
        }
    }

    fileprivate var sections = [LogDetailsSection]()
    @IBOutlet weak private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        kind = .overview
        setupTableView()

        let titleComponents = [log.request.httpMethod, log.request.url?.path]
        title = titleComponents
            .flatMap { $0 }
            .joined(separator: " ")
    }

    // MARK: - Private

    private func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40.0
    }

    // MARK: - Actions

    @IBAction func segmentedControlActionHandler(_ sender: UISegmentedControl) {
        guard let _kind = Kind(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        kind = _kind
    }

}

extension LogDetailsViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
            return sections[section].footerTitle
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]

        switch item {
        case .subtitle(let title, let subtitle):
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LogDetailsTableViewCell
            cell.titleLabel.text = title
            cell.subtitleLabel.text = subtitle
            return cell
        case .raw(let text):
            let cell = tableView.dequeueReusableCell(withIdentifier: "rawCell", for: indexPath) as! LogDetailsTableViewCell
            cell.titleLabel.text = text
            return cell
        }
    }

}
