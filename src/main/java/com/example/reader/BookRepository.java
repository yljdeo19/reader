package com.example.reader;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static com.mongodb.client.model.Filters.eq;

public class BookRepository {

    private static final String COLLECTION_NAME = "books";

    private static BookRepository INSTANCE;

    private final MongoCollection<Document> collection;

    private BookRepository() {
        MongoDatabase db = MongoClientProvider.getDatabase();
        this.collection = db.getCollection(COLLECTION_NAME);

        // Если коллекция пуста — создадим демо-данные
        if (collection.countDocuments() == 0) {
            seedDemoData();
        }
    }

    public static BookRepository getInstance() {
        if (INSTANCE == null) {
            synchronized (BookRepository.class) {
                if (INSTANCE == null) {
                    INSTANCE = new BookRepository();
                }
            }
        }
        return INSTANCE;
    }

    // --- CRUD ---

    public List<Book> findAll() {
        List<Book> result = new ArrayList<>();
        for (Document doc : collection.find()) {
            result.add(Book.fromDocument(doc));
        }
        return result;
    }

    public Optional<Book> findById(String id) {
        Document doc = collection.find(eq("_id", id)).first();
        return Optional.ofNullable(Book.fromDocument(doc));
    }

    public void save(Book book) {
        if (book.getId() == null || book.getId().isBlank()) {
            // используем простые строковые id, чтобы не тащить ObjectId
            String newId = java.util.UUID.randomUUID().toString();
            book.setId(newId);
            collection.insertOne(book.toDocument());
        } else {
            collection.replaceOne(eq("_id", book.getId()), book.toDocument(), new com.mongodb.client.model.ReplaceOptions().upsert(true));
        }
    }

    // В будущем можно сделать методы: findTop(), findUpdated(), по жанрам и т.д.

    // --- демо-данные ---

    private void seedDemoData() {
        List<Book> demo = List.of(
                new Book(
                        "moonlit-train",
                        "Moonlit Train",
                        "Медленная романтика на ночном поезде.",
                        Arrays.asList("романтика", "slowburn"),
                        24, 15, false,
                        "/img/moonlit.jpg"       // <-- вот это
                ),
                new Book(
                        "glass-city",
                        "Glass City Dreams",
                        "Киберпанк, неон и тяжёлые выборы.",
                        Arrays.asList("киберпанк", "драма"),
                        18, 8, false,
                        "/img/glass.jpg"
                ),
                new Book(
                        "cherry-sky",
                        "Under Cherry Sky",
                        "Школьная романтика под дождём из сакуры.",
                        Arrays.asList("школа", "романтика", "завершена"),
                        16, 16, true,
                        "/img/cherry.jpg"
                )

        );

        List<Document> docs = new ArrayList<>();
        for (Book b : demo) {
            docs.add(b.toDocument());
        }
        collection.insertMany(docs);
    }
}
