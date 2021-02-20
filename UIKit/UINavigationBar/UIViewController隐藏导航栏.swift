override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 隐藏导航栏
    self.navigationController?.setNavigationBarHidden(true, animated: true)
}
override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // 导航栏透明
    self.navigationController?.navigationBar.isTranslucent = false
    // 显示导航栏
    self.navigationController?.setNavigationBarHidden(false, animated: true)
    // 立即刷新导航栏
    self.setNeedsStatusBarAppearanceUpdate()
}