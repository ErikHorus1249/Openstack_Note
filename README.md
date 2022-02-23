# I. Đăng  nhập hệ thống

> Đăng nhập tại:
> http://203.162.130.73:7788/horizon/auth/login/?next=/horizon/
> username: admin
>  password: admin
>   domain: default

![](https://i.imgur.com/6ESjSIv.png)

# II. Giao diện quản lý
![](https://i.imgur.com/nHVIIST.jpeg)
1. Instances - quản lý về tạo máy ảo 
2. Image - quản lý về thêm sửa xóa các image
3. Network - quản lý thêm sửa xóa thiết lập thông số cho mạng
## 1. Instances
![](https://i.imgur.com/n5vjWYs.png)
## 2. Image
![](https://i.imgur.com/3oYUiqH.png)

## 3. Network 
![](https://i.imgur.com/ZnTIe35.png)

# III. Hướng dẫn xây dựng bản ảnh 
Trong quá trình xây dựng bản ảnh sẽ bao gồm các bước sau đây:
1. Thêm bản ảnh vào kho lưu trữ của Openstack
2. Tạo máy ảo từ bản ảnh
3. Tạo bản lưu trữ cuối dạng snapshot image từ máy ảo.

![](https://i.imgur.com/ScaMewV.png)
**Bước 1**
Tại giao diện Image - > chọn create image -> điền các thông tin cần thiết như tên image, chọn file image để tải lên (có thể chọn ISO hoặc QEMU image), điền thông số boot yêu cầu như dung lượng ổ cứng thấp nhất (minimum disk) và RAM (minimum RAM disk) -> chọn chế độ share là public -> chọn create image để hoàn tất quy trình.

**Bước 2**

![](https://i.imgur.com/abGYXfu.png)
Tại giao diện Instances chọn **Launch instance**  -> tại mục Details thì chỉ thêm tên cho máy ảo (instance) các mục khác để mặc định 

![](https://i.imgur.com/0eu21nz.png)

Tại mục ***Source***  chọn boot source là **Image** -> chọn image ở danh sách bên dưới -> với những image không hạn định dung lương ổ cứng thì phải thêm thủ công ở mục **Volume size** .

![](https://i.imgur.com/1aUdKt1.png)

Tại mục flavor chọn cấu hình flavor phù hợp với máy ảo.

![](https://i.imgur.com/BEz6izu.png)

Tại mục network chọn mạng LAN cho máy ảo bằng cách chọn mũi tên tại mục LAN -> Bước 3chọn Launch instance để kết thúc quy trình.

**Bước 3**
Sau khi chờ cho instance chạy hoàn tất, tức là máy ở status **running**

![](https://i.imgur.com/JjshbNO.png)

Chọn vào tên của instance để truy cập vào mục điều khiển từ xa thông quan giao diện NoVNC

![](https://i.imgur.com/XXe6Tqo.png)

Chọn vào mục Console để truy cập giao diện.

![](https://i.imgur.com/KFerBr0.png)

Thực hiện tùy chỉnh, cài đặt công cụ theo ý muốn sau đó tiến hành đóng gói thành snapshot image.
Quay lại giao diện Instances chọn máy ảo cần đóng gói -> chọn Create snapshot -> Thêm tên cho snapshot -> chọn **create snapshot** để kết thúc quy trình.

![](https://i.imgur.com/9BdZd9t.png)

Kiểm tra lại snapshot đã tạo thành công hay chưa trong giao diện Image.







