package com.example.reader;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/books")
public class LibraryServlet extends HttpServlet {

    private BookRepository repo;

    @Override
    public void init() {
        repo = BookRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Book> books = repo.findAll();

        req.setAttribute("books", books);
        // позже можно добавить topBooks, updatedBooks и т.д.

        req.getRequestDispatcher("/books.jsp").forward(req, resp);
    }
}
