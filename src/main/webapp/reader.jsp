<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.example.reader.Book" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Reader — Book</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<%
    Book book = (Book) request.getAttribute("book");
    if (book == null) {
%>
<div class="library-layout">
    <div class="library-title">Книга не найдена</div>
</div>
<%
} else {
%>

<div class="reader-layout">
    <!-- Левая колонка: инфо и главы (пока просто список заглушек) -->
    <aside class="reader-sidebar">
        <div class="reader-book-title"><%= book.getTitle() %></div>
        <div class="reader-book-tagline"><%= book.getTagline() %></div>

        <div class="chapter-list">
            <div class="chapter-item active">
                <span>Глава <%= book.getCurrentChapter() %></span>
                <span>●</span>
            </div>
            <div class="chapter-item">
                <span>Следующая глава</span>
                <span>●</span>
            </div>
        </div>
    </aside>

    <!-- Правая колонка: сам текст главы (пока мок) -->
    <main class="reader-content">
        <div class="reader-chapter-title">
            Глава <%= book.getCurrentChapter() %> · Ночной перрон
        </div>
        <div class="reader-chapter-meta">
            <%= book.getTitle() %> · ваши выборы скоро будут влиять на концовку.
        </div>

        <div class="reader-text">
            <p>
                Поезд плавно замедлился, и окна наполнились мягким светом платформы.
                Вокзал выглядел так, будто его нарисовали акварелью — размытые фонари,
                тёплый пар и редкие силуэты пассажиров.
            </p>
            <p>
                Это просто заглушка текста главы, позже мы заменим её реальными главами
                из MongoDB (отдельная коллекция <code>chapters</code>).
            </p>
        </div>
    </main>
</div>

<%
    } // конец else
%>

</body>
</html>
