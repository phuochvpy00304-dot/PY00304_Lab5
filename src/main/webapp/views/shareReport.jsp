<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Báo cáo chia sẻ • Giao diện mới</title>
    <style>
        :root { --bg:#0b1220; --panel:#0f172a; --card:#111827; --text:#e5e7eb; --muted:#94a3b8; --primary:#6366f1; --primary2:#22d3ee; --border:#1f2937; }
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: radial-gradient(1200px 600px at 20% -200px, rgba(34,211,238,.15), transparent), radial-gradient(800px 400px at 120% -200px, rgba(99,102,241,.15), transparent), var(--bg); color: var(--text); }
        .header { position: sticky; top:0; z-index:100; background: linear-gradient(180deg, rgba(17,24,39,.85), rgba(17,24,39,.75)); backdrop-filter: blur(6px); border-bottom:1px solid var(--border); }
        .header-content { max-width: 1200px; margin: 0 auto; padding: 16px 20px; display:flex; justify-content:space-between; align-items:center; }
        .logo { font-size: 24px; font-weight:700; display:flex; align-items:center; gap:10px; color:#fff; text-decoration:none; }
        .logo::before { content: "🗞️"; font-size: 26px; }
        .user-info { display:flex; align-items:center; gap:12px; font-size:13px; color: var(--muted); }
        .visitor-count, .user-welcome { background: rgba(99,102,241,.15); color: var(--text); padding: 6px 12px; border: 1px solid var(--border); border-radius: 999px; }
        .nav { background: var(--panel); border-bottom:1px solid var(--border); }
        .nav-content { max-width: 1200px; margin:0 auto; padding: 0 20px; display:flex; gap:28px; }
        .nav a { display:block; padding: 14px 0; color: var(--muted); text-decoration:none; font-weight:600; border-bottom:3px solid transparent; transition: color .2s ease, border-color .2s ease; }
        .nav a:hover, .nav a.active { color:#fff; border-bottom-color: var(--primary); }
        .container { max-width: 1200px; margin: 26px auto; padding: 0 20px; }
        .title { font-size: 22px; margin-bottom: 12px; }
        .table-card { background: var(--card); border:1px solid var(--border); border-radius: 16px; padding: 0; box-shadow: 0 8px 24px rgba(0,0,0,.3); overflow:hidden; }
        table { width:100%; border-collapse: collapse; }
        thead tr { background: rgba(17,24,39,.6); }
        th, td { padding: 12px 14px; border-bottom:1px solid var(--border); text-align:left; font-size: 14px; }
        th { color:#fff; }
        td { color: var(--muted); }
    </style>
</head>
<body>
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
    <div class="nav">
        <div class="nav-content">
            <a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a>
            <a href="${pageContext.request.contextPath}/views/page1.jsp">Thời sự</a>
            <a href="${pageContext.request.contextPath}/views/page2.jsp">Công nghệ</a>
            <a href="${pageContext.request.contextPath}/views/shareReport.jsp" class="active">Báo cáo chia sẻ</a>
        </div>
    </div>
    <div class="container">
        <div class="title">Thông tin chia sẻ tổng hợp của từng video</div>
        <div class="table-card">
            <table>
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Mã video</th>
                    <th>Tiêu đề</th>
                    <th>Số lượt chia sẻ</th>
                    <th>Ngày chia sẻ đầu tiên</th>
                    <th>Ngày chia sẻ cuối cùng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="r" items="${reports}" varStatus="st">
                    <tr>
                        <td>${st.index + 1}</td>
                        <td>${r.videoId}</td>
                        <td>${r.title}</td>
                        <td>${r.shareCount}</td>
                        <td><fmt:formatDate value="${r.firstShareDate}" pattern="dd/MM/yyyy"/></td>
                        <td><fmt:formatDate value="${r.lastShareDate}" pattern="dd/MM/yyyy"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
