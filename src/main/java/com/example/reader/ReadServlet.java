package com.example.reader;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/read")
public class ReadServlet extends HttpServlet {

    private BookRepository repo;

    @Override
    public void init() {
        repo = BookRepository.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        if (id == null || id.isBlank()) {
            resp.sendRedirect(req.getContextPath() + "/books");
            return;
        }

        var bookOpt = repo.findById(id);
        if (bookOpt.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        Book book = bookOpt.get();
        req.setAttribute("book", book);

        // пока главы заглушка, потом сделаем отдельную коллекцию chapters
        req.getRequestDispatcher("/reader.jsp").forward(req, resp);
    }
}
