package com.example.reader;

import org.bson.Document;

import java.util.List;

public class Book {

    private String id;              // строковый id (мы сами задаём, не ObjectId)
    private String title;           // название
    private String tagline;         // короткое описание
    private List<String> genres;    // жанры
    private int totalChapters;      // всего глав
    private int currentChapter;     // текущая глава (для прогресса)
    private boolean finished;       // завершена ли книга
    private String thumbnail;       // путь к обложке (например, /img/moonlit.png)

    public Book() {
    }

    public Book(String id,
                String title,
                String tagline,
                List<String> genres,
                int totalChapters,
                int currentChapter,
                boolean finished,
                String thumbnail) {
        this.id = id;
        this.title = title;
        this.tagline = tagline;
        this.genres = genres;
        this.totalChapters = totalChapters;
        this.currentChapter = currentChapter;
        this.finished = finished;
        this.thumbnail = thumbnail;
    }

    // --- геттеры/сеттеры ---

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTagline() {
        return tagline;
    }

    public void setTagline(String tagline) {
        this.tagline = tagline;
    }

    public List<String> getGenres() {
        return genres;
    }

    public void setGenres(List<String> genres) {
        this.genres = genres;
    }

    public int getTotalChapters() {
        return totalChapters;
    }

    public void setTotalChapters(int totalChapters) {
        this.totalChapters = totalChapters;
    }

    public int getCurrentChapter() {
        return currentChapter;
    }

    public void setCurrentChapter(int currentChapter) {
        this.currentChapter = currentChapter;
    }

    public boolean isFinished() {
        return finished;
    }

    public void setFinished(boolean finished) {
        this.finished = finished;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    // --- конвертация в/из Mongo Document ---

    public Document toDocument() {
        Document doc = new Document();
        if (id != null) {
            doc.put("_id", id);
        }
        doc.put("title", title);
        doc.put("tagline", tagline);
        doc.put("genres", genres);
        doc.put("totalChapters", totalChapters);
        doc.put("currentChapter", currentChapter);
        doc.put("finished", finished);
        doc.put("thumbnail", thumbnail);
        return doc;
    }

    @SuppressWarnings("unchecked")
    public static Book fromDocument(Document doc) {
        if (doc == null) return null;

        Book b = new Book();
        b.id = doc.getString("_id");
        b.title = doc.getString("title");
        b.tagline = doc.getString("tagline");
        b.genres = (List<String>) doc.get("genres");
        b.totalChapters = doc.getInteger("totalChapters", 0);
        b.currentChapter = doc.getInteger("currentChapter", 0);
        b.finished = doc.getBoolean("finished", false);
        b.thumbnail = doc.getString("thumbnail");
        return b;
    }
}
