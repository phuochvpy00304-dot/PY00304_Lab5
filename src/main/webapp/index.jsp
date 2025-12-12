<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TinNhanh24h • Giao diện mới</title>
    <style>
        :root { --bg:#0b1220; --panel:#0f172a; --card:#111827; --text:#e5e7eb; --muted:#94a3b8; --primary:#6366f1; --primary2:#22d3ee; --border:#1f2937; }
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: radial-gradient(1200px 600px at 20% -200px, rgba(34,211,238,.15), transparent), radial-gradient(800px 400px at 120% -200px, rgba(99,102,241,.15), transparent), var(--bg); color: var(--text); line-height:1.6; }
        .header { position: sticky; top:0; z-index:100; background: linear-gradient(180deg, rgba(17,24,39,.85), rgba(17,24,39,.75)); backdrop-filter: blur(6px); border-bottom: 1px solid var(--border); }
        .header-content { max-width: 1200px; margin: 0 auto; padding: 16px 20px; display:flex; justify-content:space-between; align-items:center; }
        .logo { font-size: 24px; font-weight: 700; letter-spacing:.2px; display:flex; align-items:center; gap:10px; color: var(--text); text-decoration:none; }
        .logo::before { content: "�️"; font-size: 26px; }
        .user-info { display:flex; align-items:center; gap:12px; font-size: 13px; color: var(--muted); }
        .visitor-count, .user-welcome { background: rgba(99,102,241,.15); color: var(--text); padding: 6px 12px; border: 1px solid var(--border); border-radius: 999px; }
        .logout-btn { background: linear-gradient(135deg, var(--primary), var(--primary2)); color:#fff; padding:8px 14px; border-radius:8px; text-decoration:none; font-weight:600; box-shadow: 0 6px 20px rgba(34,211,238,.25); transition: transform .2s ease, box-shadow .2s ease; }
        .logout-btn:hover { transform: translateY(-1px); box-shadow: 0 10px 24px rgba(34,211,238,.35); }
        .nav { background: var(--panel); border-bottom:1px solid var(--border); }
        .nav-content { max-width: 1200px; margin:0 auto; padding: 0 20px; display:flex; gap:28px; }
        .nav a { display:block; padding: 14px 0; color: var(--muted); text-decoration:none; font-weight:600; letter-spacing:.2px; border-bottom:3px solid transparent; transition: color .2s ease, border-color .2s ease; }
        .nav a:hover, .nav a.active { color:#fff; border-bottom-color: var(--primary); }
        .container { max-width: 1200px; margin: 30px auto; padding: 0 20px; }
        .hero { background: linear-gradient(135deg, rgba(99,102,241,.15), rgba(34,211,238,.15)); border:1px solid var(--border); border-radius: 16px; padding: 36px; margin-bottom: 28px; box-shadow: 0 10px 30px rgba(0,0,0,.25); text-align:center; }
        .hero h1 { color:#fff; font-size: 34px; margin-bottom: 10px; }
        .hero p { color: var(--muted); font-size: 16px; }
        .news-grid { display:grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 22px; margin-top: 26px; }
        .news-card { background: var(--card); border:1px solid var(--border); border-radius: 14px; overflow:hidden; box-shadow: 0 8px 24px rgba(0,0,0,.3); transition: transform .2s ease, box-shadow .2s ease; cursor:pointer; }
        .news-card:hover { transform: translateY(-3px); box-shadow: 0 14px 30px rgba(0,0,0,.4); }
        .news-image { width:100%; height:160px; background: linear-gradient(135deg, var(--primary), var(--primary2)); display:flex; align-items:center; justify-content:center; font-size: 48px; }
        .news-content { padding: 18px; }
        .news-category { display:inline-block; background: rgba(99,102,241,.18); color:#fff; padding: 4px 10px; border:1px solid var(--border); border-radius: 999px; font-size: 12px; margin-bottom: 8px; }
        .news-title { font-size: 18px; font-weight: 700; color:#fff; margin-bottom: 8px; line-height:1.4; }
        .news-excerpt { color: var(--muted); font-size: 14px; line-height:1.6; margin-bottom: 12px; }
        .news-meta { display:flex; justify-content: space-between; align-items:center; font-size: 12px; color: var(--muted); }
        .read-more { color: var(--primary2); text-decoration:none; font-weight:600; }
        .read-more:hover { text-decoration: underline; }
        .footer { background: var(--panel); color: var(--muted); text-align:center; padding: 28px 20px; margin-top: 44px; border-top:1px solid var(--border); }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="header-content">
            <div class="logo">TinNhanh24h</div>
            <div class="user-info">
                <div class="visitor-count">👥 ${applicationScope.visitors} lượt truy cập</div>
                <c:if test="${not empty sessionScope.user}">
                    <div class="user-welcome">👋 ${sessionScope.user.fullname}</div>
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Đăng xuất</a>
                </c:if>
            </div>
        </div>
    </div>

    <c:choose>
        <c:when test="${not empty sessionScope.user}">
            <!-- Navigation -->
            <div class="nav">
                <div class="nav-content">
                    <a href="${pageContext.request.contextPath}/index.jsp" class="active">Trang chủ</a>
                    <a href="${pageContext.request.contextPath}/views/page1.jsp">Thời sự</a>
                    <a href="${pageContext.request.contextPath}/views/page2.jsp">Công nghệ</a>
                </div>
            </div>

            <!-- Main Content -->
            <div class="container">
                <div class="hero">
                    <h1>Chào mừng đến với TinNhanh24h</h1>
                    <p>Cập nhật tin tức nóng hổi mỗi ngày - Nhanh chóng, chính xác, đáng tin cậy</p>
                </div>

                <h2 style="margin-bottom: 20px; color: #333;">📌 Tin nổi bật</h2>
                <div class="news-grid">
                    <div class="news-card">
                        <div class="news-image">🌍</div>
                        <div class="news-content">
                            <span class="news-category">Thời sự</span>
                            <div class="news-title">Hội nghị thượng đỉnh quốc tế diễn ra tại Hà Nội</div>
                            <div class="news-excerpt">
                                Hội nghị quy tụ các nhà lãnh đạo từ hơn 50 quốc gia, thảo luận về các vấn đề toàn cầu quan trọng...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 2 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">💻</div>
                        <div class="news-content">
                            <span class="news-category">Công nghệ</span>
                            <div class="news-title">Ra mắt công nghệ AI mới có khả năng học tập vượt trội</div>
                            <div class="news-excerpt">
                                Các nhà khoa học vừa công bố mô hình AI thế hệ mới với khả năng xử lý ngôn ngữ tự nhiên tiên tiến...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 4 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page2.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">⚽</div>
                        <div class="news-content">
                            <span class="news-category">Thể thao</span>
                            <div class="news-title">Đội tuyển Việt Nam giành chiến thắng ấn tượng</div>
                            <div class="news-excerpt">
                                Trong trận đấu kịch tính tối qua, đội tuyển Việt Nam đã có màn trình diễn xuất sắc và giành chiến thắng...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 5 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">🎬</div>
                        <div class="news-content">
                            <span class="news-category">Giải trí</span>
                            <div class="news-title">Phim Việt đạt doanh thu kỷ lục trong tuần đầu công chiếu</div>
                            <div class="news-excerpt">
                                Bộ phim mới nhất của đạo diễn nổi tiếng đã thu hút hàng triệu khán giả và phá vỡ nhiều kỷ lục phòng vé...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 6 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">💰</div>
                        <div class="news-content">
                            <span class="news-category">Kinh tế</span>
                            <div class="news-title">Thị trường chứng khoán tăng điểm mạnh trong phiên sáng</div>
                            <div class="news-excerpt">
                                VN-Index tăng hơn 20 điểm nhờ dòng tiền mạnh đổ vào các cổ phiếu ngân hàng và bất động sản...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 7 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page2.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>

                    <div class="news-card">
                        <div class="news-image">🏥</div>
                        <div class="news-content">
                            <span class="news-category">Sức khỏe</span>
                            <div class="news-title">Phát hiện phương pháp điều trị mới cho bệnh hiểm nghèo</div>
                            <div class="news-excerpt">
                                Các bác sĩ tại Bệnh viện Trung ương đã thành công trong việc áp dụng kỹ thuật điều trị tiên tiến...
                            </div>
                            <div class="news-meta">
                                <span>⏰ 8 giờ trước</span>
                                <a href="${pageContext.request.contextPath}/views/page1.jsp" class="read-more">Đọc thêm →</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <div class="footer">
                <p>&copy; 2024 TinNhanh24h - Tin tức cập nhật 24/7</p>
                <p style="margin-top: 10px; font-size: 14px; opacity: 0.8;">Mọi thông tin và hình ảnh trên website đều được bảo vệ bản quyền</p>
            </div>
        </c:when>

        <c:otherwise>
            <jsp:forward page="/views/login.jsp"/>
        </c:otherwise>
    </c:choose>
</body>
</html>
