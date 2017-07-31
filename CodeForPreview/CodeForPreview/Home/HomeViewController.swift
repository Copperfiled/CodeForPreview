//
//  HomeViewController.swift
//  CodeForPreview
//
//  Created by guanxiaobai on 31/07/2017.
//  Copyright © 2017 guanxiaobai. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()
    let tableView = UITableView(frame: CGRect(), style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupBinding()
        viewModel.loadContent()
    }

    func setupUI() {
        self.title = "内容页"
        let nib = UINib(nibName: "ObjectFirstTableViewCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: FirstCell)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    /// 绑定ViewModel
    func setupBinding()  {
        self.viewModel.loadFirstSignal.observeValues { [weak self] refresh in
            //加载是否成功
//            if refresh {
                self?.refresh(with: 0)
//            }
        }
        self.viewModel.loadSecondSignal.observeValues { [weak self] refresh in
            //加载是否成功
//            if refresh {
                self?.refresh(with: 1)
//            }
        }
        self.viewModel.loadThirdSignal.observeValues { [weak self] refresh in
            //加载是否成功
//            if refresh {
                self?.refresh(with: 2)
//            }
        }
        self.viewModel.loadFourthSignal.observeValues { [weak self] refresh in
            //加载是否成功
//            if refresh {
                self?.refresh(with: 3)
//            }
        }
        self.viewModel.loadFifthSignal.observeValues { [weak self] refresh in
            //加载是否成功
//            if refresh {
                self?.refresh(with: 4)
//            }
        }
    }
    func refresh(with index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .left)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //模块数目，可以从ViewMode中读取，这里暂时指定
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstCell, for: indexPath) as! ObjectFirstTableViewCell
        cell.contentLabel.text = self.viewModel.dataSource[indexPath.row]
        return cell
    }
}
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
