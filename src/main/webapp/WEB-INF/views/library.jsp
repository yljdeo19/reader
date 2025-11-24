<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.reader.Book" %>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Моя библиотека</title>

    <!-- Bootstrap CDN -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
</head>
<body class="bg-dark text-light">

<nav class="navbar navbar-dark bg-black mb-4">
    <div class="container">
        <a class="navbar-brand" href="books">📚 My Reader</a>
    </div>
</nav>

<div class="container">
    <h1 class="mb-4">Моя библиотека</h1>

    <div class="row gy-4">
        <% if (books != null) {
            for (Book book : books) { %>
        <div class="col-md-4">
            <div class="card h-100 bg-secondary text-light">
                <div class="card-body d-flex flex-column">
                    <h5 class="card-title"><%= book.getTitle() %></h5>
                    <h6 class="card-subtitle mb-2 text-light-50">
                        <%= book.getAuthor() %>
                    </h6>
                    <p class="card-text flex-grow-1">
                        <%= book.getDescription() %>
                    </p>
                    <a href="read?id=<%= book.getId() %>" class="btn btn-light mt-auto">
                        Читать
                    </a>
                </div>
            </div>
        </div>
        <%   }
        } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
