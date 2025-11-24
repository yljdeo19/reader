<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Reader — Anime Library</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>

<div class="home-layout">
    <!-- ВЕРХНИЙ РЯД -->
    <div class="home-top-row">
        <!-- ЛЕВАЯ КОЛОНКА: наш премиальный hero-блок -->
        <section class="hero-card">
            <div>
                <div class="label">Reader · Anime</div>

                <div class="title">READER</div>
                <div class="subtitle">YOUR STORY UNIVERSE</div>

                <div class="desc">
                    Собери свою коллекцию атмосферных аниме-историй, визуальных новелл
                    и романтических сюжетов. Возвращайся к любимым главам в один клик.
                </div>

                <div class="actions">
                    <a class="btn-main" href="${pageContext.request.contextPath}/books">
                        Start Reading →
                    </a>

                    <div class="chip">Best</div>
                    <div class="chip">Soft anime style</div>
                </div>
            </div>

            <!-- Персонаж справа -->
            <img class="hero-character"
                 src="${pageContext.request.contextPath}/images/zenitsu.png"
                 alt="Anime hero">
        </section>

        <!-- ПРАВАЯ КОЛОНКА: Топ книг за месяц -->
        <aside class="home-sidebar">
            <div class="sidebar-title">Лучшие книги месяца</div>
            <div class="sidebar-subtitle">Самые дочитываемые истории за последние 30 дней.</div>

            <div class="book-list">
                <div class="book-item">
                    <div class="book-main">
                        <div class="book-title">Moonlit Train</div>
                        <div class="book-tagline">медленная романтика · 14 глав</div>
                    </div>
                    <div class="book-pill">★ 4.9</div>
                </div>

                <div class="book-item">
                    <div class="book-main">
                        <div class="book-title">Glass City Dreams</div>
                        <div class="book-tagline">киберпанк · драма</div>
                    </div>
                    <div class="book-pill">trend</div>
                </div>

                <div class="book-item">
                    <div class="book-main">
                        <div class="book-title">Under Cherry Sky</div>
                        <div class="book-tagline">школьная романтика · закончена</div>
                    </div>
                    <div class="book-pill">💜 фаворит</div>
                </div>
            </div>
        </aside>
    </div>

    <!-- НИЖНИЙ БЛОК: книги с новыми главами -->
    <section class="home-bottom-updates">
        <div class="bottom-header">
            <div class="bottom-title">Новые главы</div>
            <div class="bottom-caption">Истории, которые недавно получили продолжение.</div>
        </div>

        <div class="updates-list">
            <div class="update-item">
                <div class="update-main">
                    <div class="update-title">Moonlit Train</div>
                    <div class="update-info">Добавлена глава 15 · «Ночной перрон»</div>
                </div>
                <div class="update-badge">+1 глава</div>
            </div>

            <div class="update-item">
                <div class="update-main">
                    <div class="update-title">Glass City Dreams</div>
                    <div class="update-info">Добавлена глава 8 · сюжетный поворот</div>
                </div>
                <div class="update-badge">update</div>
            </div>

            <div class="update-item">
                <div class="update-main">
                    <div class="update-title">Rainy Café Notes</div>
                    <div class="update-info">Новые сцены и выборы героя</div>
                </div>
                <div class="update-badge">новое</div>
            </div>
        </div>
    </section>
</div>

</body>
</html>
