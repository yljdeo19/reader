<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.example.reader.Book" %>
<%
    Book book = (Book) request.getAttribute("book");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title><%= book.getTitle() %> — чтение</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <style>
        .reader {
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.7;
            font-size: 18px;
            white-space: pre-wrap; /* сохраняем переносы строк из content */
        }
    </style>
</head>
<body class="bg-dark text-light">

<nav class="navbar navbar-dark bg-black mb-4">
    <div class="container">
        <a class="navbar-brand" href="books">📚 My Reader</a>
    </div>
</nav>

<div class="container reader">
    <h1 class="mb-1"><%= book.getTitle() %></h1>
    <h5 class="mb-4 text-light-50">Автор: <%= book.getAuthor() %></h5>

    <div class="mb-4">
        <%= book.getContent() %>
    </div>

    <a href="books" class="btn btn-light mt-3">⬅ Назад к списку</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
