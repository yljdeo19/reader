<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.reader.Book" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Reader — Library</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<div class="library-layout">
    <header class="library-header">
        <div>
            <div class="library-title">Библиотека</div>
            <div class="library-subtitle">
                Выбери историю, к которой хочется вернуться прямо сейчас.
            </div>
        </div>

        <div class="library-filters">
            <button class="filter-chip active">Все</button>
            <button class="filter-chip">Романтика</button>
            <button class="filter-chip">Фэнтези</button>
            <button class="filter-chip">Киберпанк</button>
        </div>
    </header>

    <section class="book-grid">
        <%
            List<Book> books = (List<Book>) request.getAttribute("books");
            if (books != null) {
                for (Book b : books) {
        %>
        <article class="book-card">
            <div class="book-cover">
                <img src="<%= request.getContextPath() %><%= b.getThumbnail() %>" alt="<%= b.getTitle() %>">
            </div>

            <div class="book-meta">
                <div class="book-card-title"><%= b.getTitle() %></div>
                <div class="book-card-tagline"><%= b.getTagline() %></div>

                <div class="book-card-tags">
                    <% if (b.getGenres() != null) {
                        for (String g : b.getGenres()) { %>
                    <span class="book-tag"><%= g %></span>
                    <%   }
                    } %>
                </div>
            </div>

            <div class="book-card-footer">
                <span class="book-progress">
                    Прогресс: глава <%= b.getCurrentChapter() %> / <%= b.getTotalChapters() %>
                </span>
                <a class="book-open-btn"
                   href="<%= request.getContextPath() %>/read?id=<%= b.getId() %>">
                    <%= b.isFinished() ? "Перечитать" : "Продолжить" %>
                </a>
            </div>
        </article>
        <%
                }
            }
        %>
    </section>
</div>

</body>
</html>
