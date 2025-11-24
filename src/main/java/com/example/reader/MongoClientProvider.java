package com.example.reader;

import com.mongodb.MongoClientSettings;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

public class MongoClientProvider {

    // Можно вынести в переменную окружения MONGO_URI
    private static final String DEFAULT_URI = "mongodb://localhost:27017";
    private static final String DB_NAME = "reader_app";

    private static MongoClient mongoClient;

    private MongoClientProvider() {
    }

    private static MongoClient getClient() {
        if (mongoClient == null) {
            synchronized (MongoClientProvider.class) {
                if (mongoClient == null) {
                    String uri = System.getenv().getOrDefault("MONGO_URI", DEFAULT_URI);
                    mongoClient = MongoClients.create(uri);
                }
            }
        }
        return mongoClient;
    }

    public static MongoDatabase getDatabase() {
        return getClient().getDatabase(DB_NAME);
    }
}
