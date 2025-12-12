<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thời sự • Giao diện mới</title>
    <style>
        :root { --bg:#0b1220; --panel:#0f172a; --card:#111827; --text:#e5e7eb; --muted:#94a3b8; --primary:#6366f1; --primary2:#22d3ee; --border:#1f2937; }
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: radial-gradient(1200px 600px at 20% -200px, rgba(34,211,238,.15), transparent), radial-gradient(800px 400px at 120% -200px, rgba(99,102,241,.15), transparent), var(--bg); color: var(--text); line-height:1.7; }
        .header { position: sticky; top:0; z-index:100; background: linear-gradient(180deg, rgba(17,24,39,.85), rgba(17,24,39,.75)); backdrop-filter: blur(6px); border-bottom: 1px solid var(--border); }
        .header-content { max-width: 1200px; margin: 0 auto; padding: 16px 20px; display:flex; justify-content:space-between; align-items:center; }
        .logo { font-size: 24px; font-weight:700; display:flex; align-items:center; gap:10px; color:#fff; text-decoration:none; }
        .logo::before { content: "🗞️"; font-size: 26px; }
        .user-info { display:flex; align-items:center; gap:12px; font-size:13px; color: var(--muted); }
        .visitor-count, .user-welcome { background: rgba(99,102,241,.15); color: var(--text); padding: 6px 12px; border: 1px solid var(--border); border-radius: 999px; }
        .nav { background: var(--panel); border-bottom:1px solid var(--border); }
        .nav-content { max-width: 1200px; margin:0 auto; padding: 0 20px; display:flex; gap:28px; }
        .nav a { display:block; padding: 14px 0; color: var(--muted); text-decoration:none; font-weight:600; border-bottom:3px solid transparent; transition: color .2s ease, border-color .2s ease; }
        .nav a:hover, .nav a.active { color:#fff; border-bottom-color: var(--primary); }
        .container { max-width: 1200px; margin: 30px auto; padding: 0 20px; }
        .breadcrumb { margin-bottom: 18px; font-size: 13px; color: var(--muted); }
        .breadcrumb a { color: var(--primary2); text-decoration:none; }
        .breadcrumb a:hover { text-decoration: underline; }
        .page-header { background: linear-gradient(135deg, rgba(99,102,241,.15), rgba(34,211,238,.15)); border:1px solid var(--border); padding: 28px; border-radius: 16px; margin-bottom: 24px; box-shadow: 0 10px 30px rgba(0,0,0,.25); }
        .page-header h1 { color:#fff; font-size:30px; margin-bottom: 8px; }
        .page-header p { color: var(--muted); font-size: 15px; }
        .featured-article { background: var(--card); border:1px solid var(--border); border-radius: 16px; overflow:hidden; margin-bottom: 26px; box-shadow: 0 8px 24px rgba(0,0,0,.3); }
        .featured-image { width:100%; height: 320px; background: linear-gradient(135deg, var(--primary), var(--primary2)); display:flex; align-items:center; justify-content:center; font-size: 96px; }
        .featured-content { padding: 26px; }
        .article-category { display:inline-block; background: rgba(99,102,241,.18); color:#fff; padding: 5px 12px; border:1px solid var(--border); border-radius:999px; font-size:12px; margin-bottom: 12px; }
        .article-title { font-size: 24px; font-weight: 800; color:#fff; margin-bottom: 12px; line-height: 1.35; }
        .article-meta { display:flex; gap:18px; margin-bottom: 16px; font-size:13px; color: var(--muted); }
        .article-body { color: var(--text); font-size: 15px; line-height: 1.8; }
        .article-body p { margin-bottom: 12px; }
        .article-list { display:grid; gap: 16px; }
        .article-item { background: var(--card); border:1px solid var(--border); border-radius: 14px; padding: 22px; box-shadow: 0 8px 24px rgba(0,0,0,.3); display:flex; gap:16px; transition: transform .2s ease; }
        .article-item:hover { transform: translateX(3px); }
        .article-icon { font-size: 40px; flex-shrink:0; }
        .article-info h3 { font-size: 18px; color:#fff; margin-bottom:8px; }
        .article-info p { color: var(--muted); font-size: 14px; margin-bottom:8px; }
        .article-time { font-size: 12px; color: var(--muted); }
        .footer { background: var(--panel); color: var(--muted); text-align:center; padding: 28px 20px; margin-top: 40px; border-top:1px solid var(--border); }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="header-content">
            <a href="${pageContext.request.contextPath}/index.jsp" class="logo">TinNhanh24h</a>
            <div class="user-info">
                <div class="visitor-count">👥 ${applicationScope.visitors} lượt truy cập</div>
                <c:if test="${not empty sessionScope.user}">
                    <div class="user-welcome">👋 ${sessionScope.user.fullname}</div>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <div class="nav">
        <div class="nav-content">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/views/page1.jsp" class="active">Thời sự</a>
            <a href="${pageContext.request.contextPath}/views/page2.jsp">Công nghệ</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a> / <span>Thời sự</span>
        </div>

        <div class="page-header">
            <h1>📰 Tin tức Thời sự</h1>
            <p>Cập nhật những tin tức chính trị, xã hội, sự kiện quan trọng trong và ngoài nước</p>
        </div>

        <!-- Featured Article -->
        <div class="featured-article">
            <div class="featured-image">🌍</div>
            <div class="featured-content">
                <span class="article-category">TIN NỔI BẬT</span>
                <h2 class="article-title">Hội nghị thượng đỉnh quốc tế diễn ra tại Hà Nội: Bước ngoặt mới trong quan hệ đối ngoại</h2>
                <div class="article-meta">
                    <span>✍️ Phóng viên Nguyễn Văn A</span>
                    <span>⏰ 2 giờ trước</span>
                    <span>👁️ 15,234 lượt xem</span>
                </div>
                <div class="article-body">
                    <p>
                        <strong>HÀ NỘI</strong> - Sáng nay, Hội nghị thượng đỉnh quốc tế với sự tham gia của các nhà lãnh đạo từ hơn 50 quốc gia đã chính thức khai mạc tại Trung tâm Hội nghị Quốc gia, Hà Nội. Đây được xem là một trong những sự kiện ngoại giao quan trọng nhất trong năm.
                    </p>
                    <p>
                        Phát biểu khai mạc, Thủ tướng Chính phủ nhấn mạnh tầm quan trọng của hợp tác đa phương trong bối cảnh thế giới đang đối mặt với nhiều thách thức toàn cầu. "Chúng ta cần đoàn kết, hợp tác để cùng nhau vượt qua khó khăn và xây dựng một tương lai tốt đẹp hơn cho thế hệ mai sau," Thủ tướng phát biểu.
                    </p>
                    <p>
                        Hội nghị sẽ diễn ra trong 3 ngày với nhiều phiên thảo luận về các vấn đề như biến đổi khí hậu, an ninh lương thực, chuyển đổi số và phát triển bền vững. Các nhà lãnh đạo cũng sẽ ký kết nhiều thỏa thuận hợp tác quan trọng trong các lĩnh vực kinh tế, thương mại và văn hóa.
                    </p>
                    <p>
                        Theo đánh giá của các chuyên gia, hội nghị này không chỉ khẳng định vị thế của Việt Nam trên trường quốc tế mà còn mở ra nhiều cơ hội hợp tác mới, góp phần thúc đẩy phát triển kinh tế - xã hội của đất nước.
                    </p>
                </div>
            </div>
        </div>

        <!-- More Articles -->
        <h2 style="margin: 30px 0 20px; color: #333;">Tin tức khác</h2>
        <div class="article-list">
            <div class="article-item">
                <div class="article-icon">🏛️</div>
                <div class="article-info">
                    <h3>Quốc hội thông qua nhiều nghị quyết quan trọng trong kỳ họp thứ 6</h3>
                    <p>Các nghị quyết liên quan đến phát triển kinh tế, cải cách hành chính và chính sách xã hội đã được thông qua với tỷ lệ tán thành cao...</p>
                    <div class="article-time">⏰ 3 giờ trước | 👁️ 8,456 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🚆</div>
                <div class="article-info">
                    <h3>Khởi công dự án đường sắt tốc độ cao Bắc - Nam</h3>
                    <p>Dự án trị giá hàng tỷ USD được kỳ vọng sẽ thay đổi bộ mặt giao thông vận tải của cả nước, rút ngắn thời gian di chuyển...</p>
                    <div class="article-time">⏰ 5 giờ trước | 👁️ 12,789 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🎓</div>
                <div class="article-info">
                    <h3>Bộ Giáo dục công bố chương trình giáo dục phổ thông mới</h3>
                    <p>Chương trình mới tập trung phát triển năng lực, phẩm chất học sinh, tích hợp kiến thức liên môn và ứng dụng công nghệ...</p>
                    <div class="article-time">⏰ 6 giờ trước | 👁️ 9,234 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🌾</div>
                <div class="article-info">
                    <h3>Nông dân miền Tây vui mùa lúa được giá</h3>
                    <p>Giá lúa tăng cao nhờ nhu cầu xuất khẩu tăng mạnh, người nông dân phấn khởi với thu nhập khả quan trong vụ mùa này...</p>
                    <div class="article-time">⏰ 7 giờ trước | 👁️ 6,123 lượt xem</div>
                </div>
            </div>

            <div class="article-item">
                <div class="article-icon">🏥</div>
                <div class="article-info">
                    <h3>Khánh thành bệnh viện đa khoa hiện đại tại TP.HCM</h3>
                    <p>Bệnh viện được trang bị công nghệ y tế tiên tiến, góp phần nâng cao chất lượng khám chữa bệnh cho người dân...</p>
                    <div class="article-time">⏰ 8 giờ trước | 👁️ 5,678 lượt xem</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 TinNhanh24h - Tin tức cập nhật 24/7</p>
        <p style="margin-top: 10px; font-size: 14px; opacity: 0.8;">Mọi thông tin và hình ảnh trên website đều được bảo vệ bản quyền</p>
    </div>
</body>
</html>
