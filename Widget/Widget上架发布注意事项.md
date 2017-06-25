App + Widget上架
注意事项：
1. 需要支持AppGroup能力。唯一的groupid（inhouse和AppStore必须不同），共享数据存储到group的存储空间（沙盒中，否则无法共享数据，如sessionid，userid，data等）。
2. 需要两个发布证书，主工程和Widget各一个。
3. Bundle identifier保持一致性。如主工程：com.test.myapp, Widget：com.test.myapp.widget
4. Version和Build保持一致。不一致无法成功发布到AppStore
