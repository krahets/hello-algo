# Bản tóm tắt

### Đánh giá chính

- Cấu trúc dữ liệu có thể được phân loại theo hai quan điểm: cấu trúc logic và cấu trúc vật lý. Cấu trúc logic mô tả mối quan hệ logic giữa các phần tử dữ liệu, trong khi cấu trúc vật lý mô tả cách dữ liệu được lưu trữ trong bộ nhớ máy tính.
- Các cấu trúc logic phổ biến bao gồm cấu trúc tuyến tính, dạng cây và mạng. Chúng tôi thường phân loại cấu trúc dữ liệu là tuyến tính (mảng, danh sách liên kết, ngăn xếp, hàng đợi) và phi tuyến tính (cây, đồ thị, đống) dựa trên cấu trúc logic của chúng. Việc triển khai bảng băm có thể liên quan đến cả cấu trúc dữ liệu tuyến tính và phi tuyến tính.
- Khi một chương trình chạy, dữ liệu sẽ được lưu trữ trong bộ nhớ máy tính. Mỗi không gian bộ nhớ có một địa chỉ bộ nhớ tương ứng và chương trình truy cập dữ liệu thông qua các địa chỉ bộ nhớ này.
- Cấu trúc vật lý chủ yếu được chia thành lưu trữ không gian liền kề (mảng) và lưu trữ không gian phân tán (danh sách liên kết). Tất cả các cấu trúc dữ liệu được triển khai bằng cách sử dụng mảng, danh sách liên kết hoặc kết hợp cả hai.
- Các loại dữ liệu cơ bản trong máy tính bao gồm số nguyên `byte`, `short`, `int`, `long`, số dấu phẩy động `float`, `double`, ký tự `char` và boolean `bool`. Phạm vi giá trị của chúng phụ thuộc vào kích thước không gian mà chúng chiếm giữ và phương pháp biểu diễn của chúng.
- Độ lớn dấu, phần bù 1 và phần bù 2 là ba phương pháp mã hóa số trong máy tính và chúng có thể được chuyển đổi lẫn nhau. Bit có độ lớn dấu quan trọng nhất là bit dấu và các bit còn lại biểu thị giá trị của số.
- Các số nguyên được lưu trữ trong máy tính ở dạng bù 2. Theo biểu diễn phần bù 2, máy tính có thể xử lý phép cộng các số dương và âm một cách thống nhất mà không cần thiết kế các mạch phần cứng đặc biệt để trừ và không có sự mơ hồ về số 0 dương và âm.
- Mã hóa số dấu phẩy động bao gồm 1 bit dấu, 8 bit số mũ và 23 bit phân số. Do có các bit số mũ, phạm vi của số dấu phẩy động lớn hơn nhiều so với phạm vi của số nguyên, nhưng lại phải hy sinh độ chính xác.
- ASCII là bộ ký tự tiếng Anh sớm nhất, có độ dài 1 byte, chứa tổng cộng 128 ký tự. GBK là bộ ký tự tiếng Trung được sử dụng phổ biến, chứa hơn 20.000 ký tự tiếng Trung. Unicode cam kết cung cấp một bộ ký tự chuẩn hoàn chỉnh, tập hợp các ký tự từ nhiều ngôn ngữ khác nhau trên thế giới, từ đó giải quyết vấn đề văn bản bị cắt xén do các phương pháp mã hóa ký tự không nhất quán gây ra.
- UTF-8 là phương pháp mã hóa Unicode phổ biến nhất và có khả năng tương thích tuyệt vời. Đây là phương pháp mã hóa có độ dài thay đổi với khả năng mở rộng tốt, cải thiện hiệu quả hiệu quả không gian lưu trữ. UTF-16 và UTF-32 là các phương pháp mã hóa Unicode phổ biến. Khi mã hóa ký tự tiếng Trung, UTF-16 chiếm ít không gian hơn UTF-8. Các ngôn ngữ lập trình như Java và C# sử dụng mã hóa UTF-16 theo mặc định.

### Hỏi đáp

**Q**: Tại sao bảng băm chứa cả cấu trúc dữ liệu tuyến tính và phi tuyến tính?

Cấu trúc cơ bản của bảng băm là một mảng. Để giải quyết xung đột băm, chúng ta có thể sử dụng "chuỗi" (được thảo luận trong phần "Xung đột băm" tiếp theo): mỗi nhóm trong mảng trỏ đến một danh sách liên kết, danh sách này có thể được chuyển đổi thành cây (thường là cây đỏ đen) khi độ dài danh sách vượt quá một ngưỡng nhất định.

Từ góc độ lưu trữ, cấu trúc cơ bản của bảng băm là một mảng, trong đó mỗi vùng chứa có thể chứa một giá trị, danh sách liên kết hoặc cây. Do đó, bảng băm có thể chứa cả cấu trúc dữ liệu tuyến tính (mảng, danh sách liên kết) và cấu trúc dữ liệu phi tuyến tính (cây).

**Q**: Độ dài của `char` có phải là loại 1 byte không?

Độ dài của loại `char` được xác định bằng phương pháp mã hóa được ngôn ngữ lập trình sử dụng. Ví dụ: Java, JavaScript, TypeScript và C# đều sử dụng mã hóa UTF-16 (để lưu trữ các điểm mã Unicode), vì vậy loại `char` có độ dài 2 byte.

**Q**: Có sự mơ hồ khi gọi cấu trúc dữ liệu dựa trên mảng là "cấu trúc dữ liệu tĩnh" không? Ngăn xếp cũng có thể thực hiện các hoạt động "động" như đẩy và bật.

Các ngăn xếp thực sự có thể thực hiện các hoạt động dữ liệu động, nhưng cấu trúc dữ liệu vẫn ở trạng thái "tĩnh" (độ dài cố định). Mặc dù cấu trúc dữ liệu dựa trên mảng có thể tự động thêm hoặc xóa các phần tử nhưng dung lượng của chúng là cố định. Nếu khối lượng dữ liệu vượt quá kích thước được phân bổ trước thì cần tạo một mảng mới lớn hơn và nội dung của mảng cũ phải được sao chép sang mảng mới.

**Q**: Khi xây dựng một ngăn xếp (hàng đợi), kích thước của nó không được chỉ định. Tại sao chúng là "cấu trúc dữ liệu tĩnh"?

Trong các ngôn ngữ lập trình cấp cao, chúng ta không cần chỉ định thủ công dung lượng ban đầu của ngăn xếp (hàng đợi); lớp xử lý việc này một cách tự động. Ví dụ: dung lượng ban đầu của `ArrayList` của Java thường là 10. Ngoài ra, hoạt động mở rộng cũng được triển khai tự động. Xem phần "Danh sách" tiếp theo để biết chi tiết.

**Q**: Phương pháp chuyển đổi độ lớn dấu thành phần bù 2 là "đầu tiên phủ định sau đó thêm 1". Vì vậy, việc chuyển đổi phần bù 2 thành cường độ dấu phải là phép toán nghịch đảo "đầu tiên trừ 1 sau đó phủ định". Tuy nhiên, phần bù của 2 cũng có thể được chuyển đổi thành cường độ dấu thông qua "đầu tiên phủ định sau đó thêm 1". Tại sao lại thế này?

Điều này là do sự chuyển đổi lẫn nhau giữa độ lớn dấu và phần bù 2 thực sự là quá trình tính toán "phần bù". Trước tiên chúng ta hãy định nghĩa phần bù: giả sử $a + b = c$, sau đó chúng ta nói rằng $a$ là phần bù của $b$ cho $c$, và ngược lại, $b$ là phần bù của $a$ cho $c$.

Cho một số nhị phân $n = 4$ bit $0010$, nếu chúng ta coi số này là độ lớn dấu (bỏ qua bit dấu), thì phần bù 2 của nó có thể thu được thông qua "phủ định đầu tiên sau đó cộng 1":

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

Chúng tôi thấy rằng tổng của độ lớn dấu và phần bù của 2 là $0010 + 1110 = 10000$, có nghĩa là phần bù của 2 $1110$ là "phần bù" của độ lớn dấu $0010$ đến $10000$. **Điều này có nghĩa là "phủ định đầu tiên sau đó thêm 1" ở trên thực sự là quá trình tính toán phần bù cho $10000$**.

Vì vậy, "phần bù" của phần bù 2 $1110$ đến $10000$ là gì? Chúng ta vẫn có thể sử dụng "đầu tiên phủ định sau đó thêm 1" để có được nó:

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

Nói cách khác, độ lớn dấu và phần bù của 2 là "phần bù" của nhau cho $10000$, do đó, "độ lớn dấu của phần bù 2" và "phần bù của 2 cho độ lớn dấu" có thể được thực hiện bằng cách sử dụng cùng một thao tác (đầu tiên phủ định sau đó thêm 1).

Tất nhiên, chúng ta cũng có thể sử dụng phép toán nghịch đảo để tìm độ lớn dấu của phần bù 2 $1110$, nghĩa là "đầu tiên trừ 1 rồi phủ định":

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

Tóm lại, cả "đầu tiên phủ định rồi cộng 1" và "đầu tiên trừ 1 rồi phủ định" đều đang tính phần bù cho $10000$ và chúng tương đương nhau.

Về cơ bản, thao tác "phủ định" thực sự là tìm phần bù của $1111$ (vì "độ lớn dấu + phần bù của 1 = 1111" luôn đúng); và việc cộng 1 vào số bù 1 sẽ tạo ra số bù 2, là số bù của $10000$.

Ở trên sử dụng $n = 4$ làm ví dụ và nó có thể được khái quát thành số nhị phân của bất kỳ số bit nào.
