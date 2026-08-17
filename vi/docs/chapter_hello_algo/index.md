---
comments: true
icon: material/rocket-launch-outline
---

# Lời mở đầu

Vài năm trước, tôi đã chia sẻ lời giải cho loạt bài toán "Kiếm chỉ Offer" (Sword for Offer) trên LeetCode và nhận được sự động viên, ủng hộ nhiệt tình từ rất nhiều độc giả. Trong quá trình giao lưu trực tuyến, câu hỏi tôi thường gặp nhất chính là "làm thế nào để bắt đầu học thuật toán". Dần dần, tôi cũng nảy sinh sự hứng thú lớn đối với câu hỏi này.

Đi thẳng vào luyện giải bài tập (LeetCode) dường như là phương thức phổ biến nhất—vừa đơn giản, trực diện lại rất hiệu quả. Tuy nhiên, việc luyện đề giống như chơi game Dò mìn vậy: những người có năng lực tự học tốt có thể gỡ từng quả mìn một cách thuận lợi, trong khi những người chưa vững nền tảng có thể kết thúc bằng những trải nghiệm đầy thương tích và nản lòng rút lui. Đọc qua các sách giáo khoa chính thống cũng là một cách tiếp cận thường thấy, nhưng đối với những ai đang tìm việc, áp lực từ luận văn tốt nghiệp, viết CV và chuẩn bị cho các kỳ thi viết/phỏng vấn đã vắt kiệt sức lực, khiến việc vượt qua những cuốn sách dày cộp trở thành một thử thách vô cùng gian nan.

Nếu bạn cũng đang gặp phải những khó khăn tương tự, thì thật may mắn khi cuốn sách này đã tìm đến bạn. Cuốn sách này chính là câu trả lời của tôi dành cho câu hỏi đó—cho dù nó có thể chưa phải là lời giải tối ưu nhất, nhưng ít nhất cũng là một nỗ lực tích cực. Cuốn sách này không thể trực tiếp mang lại cho bạn một lời mời làm việc ngay lập tức, nhưng nó sẽ dẫn dắt bạn khám phá "bản đồ" của cấu trúc dữ liệu và giải thuật, giúp bạn nhận diện hình dạng, kích thước và sự phân bố của các "quả mìn" khác nhau, từ đó nắm vững các "phương pháp gỡ mìn" tương ứng. Với những kiến thức này, tôi tin bạn sẽ tự tin hơn khi đối mặt với các bài toán thực tế và đọc các tài liệu kỹ thuật, từng bước xây dựng một hệ thống kiến thức hoàn chỉnh cho riêng mình.

Tôi rất tâm đắc với câu nói của Giáo sư Feynman: "Kiến thức không miễn phí. Bạn phải đầu tư sự chú ý." Theo nghĩa đó, cuốn sách này không hoàn toàn "miễn phí". Để xứng đáng với "sự chú ý" quý báu mà bạn dành cho cuốn sách, tôi sẽ cố gắng hết sức và dành toàn bộ tâm huyết của mình để hoàn thành tác phẩm này.

Tôi ý thức sâu sắc rằng kiến thức và kinh nghiệm của bản thân có hạn. Dù nội dung cuốn sách đã được chau chuốt qua nhiều vòng chỉnh sửa, chắc chắn vẫn sẽ không tránh khỏi những sai sót. Tôi rất mong nhận được sự góp ý và sửa lỗi từ quý thầy cô cùng các bạn học giả gần xa.

![Hello Algorithms](../assets/covers/chapter_hello_algo.jpg){ class="cover-image" }

<div style="text-align: center;">
    <h2 style="margin-top: 0.8em; margin-bottom: 0.8em;">Xin chào, Thuật toán!</h2>
</div>

Sự ra đời của máy tính đã đem đến những thay đổi to lớn cho thế giới. Với khả năng tính toán tốc độ cao và tính khả lập trình vượt trội, máy tính trở thành phương tiện lý tưởng để thực thi các thuật toán và xử lý dữ liệu. Từ đồ họa chân thực trong các trò chơi 3D, khả năng tự ra quyết định của xe tự hành, những trận cờ vây xuất sắc của AlphaGo, cho đến các cuộc trò chuyện tự nhiên của ChatGPT, tất cả đều là những ví dụ sống động minh chứng cho sức mạnh của thuật toán khi vận hành trên máy tính.

Thực tế là trước khi máy tính xuất hiện, thuật toán và cấu trúc dữ liệu đã tồn tại ở mọi ngóc ngách trong thế giới của chúng ta. Các thuật toán thời kỳ đầu tương đối đơn giản, chẳng hạn như phương pháp đếm cổ xưa hay quy trình chế tác công cụ. Cùng với tiến trình văn minh, thuật toán ngày càng trở nên tinh tế và phức tạp hơn. Từ sự khéo léo tỉ mỉ của những nghệ nhân lành nghề, đến các dây chuyền công nghiệp giải phóng sức lao động, hay các quy luật khoa học vận hành vũ trụ—phía sau hầu hết mọi điều bình thường hay phi thường ấy đều chứa đựng tư duy giải thuật vô cùng khéo léo.

Tương tự như vậy, cấu trúc dữ liệu cũng hiện hữu ở khắp mọi nơi: từ các mạng xã hội khổng lồ cho đến hệ thống tàu điện ngầm nhỏ gọn, nhiều hệ thống phức tạp có thể được mô hình hóa dưới dạng "Đồ thị"; từ một quốc gia cho đến một gia đình, các hình thức tổ chức xã hội cốt lõi đều mang đặc trưng của cấu trúc "Cây"; việc mặc quần áo mùa đông giống như một "Ngăn xếp" (Stack), chiếc áo mặc vào đầu tiên sẽ là chiếc cởi ra cuối cùng; một hộp đựng cầu lông giống như một "Hàng đợi" (Queue), bóng được đưa vào từ đầu này và lấy ra từ đầu kia; một cuốn từ điển giống như một "Bảng băm" (Hash Table), giúp tra cứu nhanh từ cần tìm.

Cuốn sách này hướng tới mục tiêu giúp bạn đọc nắm vững các khái niệm cốt lõi của thuật toán và cấu trúc dữ liệu thông qua các hình minh họa động trực quan, dễ hiểu cùng mã nguồn có thể chạy thử trực tiếp. Trên nền tảng đó, cuốn sách cũng hy vọng mở ra góc nhìn sống động về sự hiện diện của thuật toán trong thế giới muôn màu, giúp bạn cảm nhận được vẻ đẹp của tư duy giải thuật. Chúc bạn có một hành trình học tập thú vị và bổ ích!
