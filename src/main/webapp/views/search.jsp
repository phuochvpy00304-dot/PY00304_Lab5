<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tìm kiếm video • Giao diện mới</title>
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
        .search-card { background: var(--card); border:1px solid var(--border); border-radius: 16px; padding: 22px; box-shadow: 0 8px 24px rgba(0,0,0,.3); margin-bottom: 20px; }
        h2 { font-size: 22px; margin-bottom: 10px; }
        .search-form { display:flex; gap:10px; }
        .search-input { flex:1; padding: 10px 12px; background: var(--panel); color: var(--text); border:1px solid var(--border); border-radius:10px; }
        .search-btn { padding: 10px 14px; background: linear-gradient(135deg, var(--primary), var(--primary2)); border:none; color:#fff; font-weight:700; border-radius:10px; cursor:pointer; box-shadow: 0 10px 24px rgba(34,211,238,.3); }
        .table-card { background: var(--card); border:1px solid var(--border); border-radius: 16px; padding: 0; box-shadow: 0 8px 24px rgba(0,0,0,.3); overflow:hidden; }
        table { width:100%; border-collapse: collapse; }
        thead tr { background: rgba(17,24,39,.6); }
        th, td { padding: 12px 14px; border-bottom:1px solid var(--border); text-align:left; font-size: 14px; }
        th { color:#fff; }
        td { color: var(--muted); }
        .empty { color: var(--muted); padding: 14px; }
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
            <a href="${pageContext.request.contextPath}/views/search.jsp" class="active">Tìm kiếm</a>
        </div>
    </div>
    <div class="container">
        <div class="search-card">
            <h2>Tìm kiếm video theo từ khóa</h2>
            <form class="search-form" action="${pageContext.request.contextPath}/search" method="get">
                <input class="search-input" type="text" name="keyword" placeholder="Nhập từ khóa..." value="${fn:escapeXml(param.keyword)}"/>
                <button class="search-btn" type="submit">Tìm kiếm</button>
            </form>
        </div>
        <c:choose>
            <c:when test="${not empty videos}">
                <div class="table-card">
                    <table>
                        <thead>
                        <tr>
                            <th>Mã</th>
                            <th>Tiêu đề</th>
                            <th>Poster</th>
                            <th>Lượt xem</th>
                            <th>Đang hoạt động</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="v" items="${videos}">
                            <tr>
                                <td>${v.id}</td>
                                <td>${v.title}</td>
                                <td>${v.poster}</td>
                                <td>${v.views}</td>
                                <td><c:out value="${v.active ? 'Yes' : 'No'}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:when test="${not empty param.keyword}">
                <div class="table-card empty">Không tìm thấy video nào với từ khóa: <strong>${param.keyword}</strong>.</div>
            </c:when>
            <c:otherwise>
                <div class="table-card empty">Nhập từ khóa rồi bấm "Tìm kiếm".</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
