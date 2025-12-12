<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập • Giao diện mới</title>
    <style>
        :root { --bg:#0b1220; --panel:#0f172a; --card:#111827; --text:#e5e7eb; --muted:#94a3b8; --primary:#6366f1; --primary2:#22d3ee; --border:#1f2937; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: radial-gradient(1200px 600px at 20% -200px, rgba(34,211,238,.15), transparent), radial-gradient(800px 400px at 120% -200px, rgba(99,102,241,.15), transparent), var(--bg); color: var(--text); }
        .brand { max-width: 420px; margin: 60px auto 0; text-align:center; color:#fff; font-weight:800; letter-spacing:.2px; }
        .brand span { display:inline-block; background: linear-gradient(135deg, var(--primary), var(--primary2)); -webkit-background-clip: text; background-clip: text; color: transparent; }
        .visitor { text-align:center; color: var(--muted); font-size: 13px; margin-top: 6px; }
        .login-box { width: 420px; margin: 16px auto 60px; padding: 26px 28px; background: var(--card); border:1px solid var(--border); border-radius: 16px; box-shadow: 0 10px 30px rgba(0,0,0,.35); }
        h2 { text-align:center; margin-bottom: 10px; font-size: 22px; }
        label { display:block; margin: 10px 0 6px; font-size: 13px; color: var(--muted); }
        input[type=text], input[type=password] { width:100%; padding: 10px 12px; background: var(--panel); color: var(--text); border:1px solid var(--border); border-radius:10px; outline:none; }
        input[type=text]:focus, input[type=password]:focus { border-color: var(--primary2); box-shadow: 0 0 0 3px rgba(34,211,238,.15); }
        .error { color: #fca5a5; margin: 10px 0; font-size: 13px; }
        .actions { margin-top: 14px; display:flex; align-items:center; justify-content:space-between; }
        .remember { display:flex; align-items:center; gap:8px; font-size: 13px; color: var(--muted); }
        .btn { margin-top: 14px; width: 100%; padding: 10px 12px; border:none; cursor:pointer; background: linear-gradient(135deg, var(--primary), var(--primary2)); color:#fff; font-weight:700; border-radius:10px; box-shadow: 0 10px 24px rgba(34,211,238,.3); transition: transform .2s ease, box-shadow .2s ease; }
        .btn:hover { transform: translateY(-1px); box-shadow: 0 14px 28px rgba(34,211,238,.4); }
    </style>
</head>
<body>
<div class="brand">TinNhanh<span>24h</span></div>
<div class="visitor">👥 ${applicationScope.visitors} lượt truy cập</div>
<div class="login-box">
    <h2>Đăng nhập</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form method="post" action="${pageContext.request.contextPath}/login">
        <label for="id">Username</label>
        <input type="text" id="id" name="id"
               value="${empty id ? sessionScope.rememberId : id}" />

        <label for="password">Mật khẩu</label>
        <input type="password" id="password" name="password"
               value="${sessionScope.rememberPassword}" />

        <div class="actions">
            <label class="remember">
                <input type="checkbox" id="remember" name="remember" /> Ghi nhớ đăng nhập
            </label>
        </div>
        <button type="submit" class="btn">Đăng nhập</button>
    </form>
</div>
</body>
</html>
