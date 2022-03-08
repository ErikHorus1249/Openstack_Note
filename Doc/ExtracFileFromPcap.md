# Quy trình trích xuất file(PDF, Doc, Xls) trong luồng mạng từ Pcap
## 1 Cài đặt Tshark 
### 1.1. Môi trường

> Ubuntu 18.04 bionic hoặc phiên bản mới hơn

### 1.2. Các bước cài đặt 
**Bước 1**: Cập nhật hệ thống 

> $ sudo apt  update -y && sudo apt upgrade  -y

**Bước 2**: Cài đặt trên 

> $ sudo apt install tshark -y

## 2. Trích xuất file từ pcap
### 2.1. Chuẩn bị
Hai file bao gồm:
+ file.pdf (File data gốc được gửi qua mạng với giao thức HTTP)
+ File pcap thu trong quá trình gửi file

![](https://i.imgur.com/Ln9NTXE.png)

### 2.2. Trích xuất 
Chạy lệnh Tshark với các option sau:

    tshark -r <pcap> --export-objects <protocol>, <dir>

> `$ tshark -r Raw-data.pcap --export-objects http,.`
-r : file pcap đầu vào
--export-objects: chế độ xuất đối tượng được vận chuyển trong mạng
, . : lưu file tại thư mục hiện tại 

![](https://i.imgur.com/URO7MwJ.png)

kết quả đạt được.

#### references: 
[HowToInstall](https://www.howtoinstall.me/ubuntu/18-04/tshark/)
